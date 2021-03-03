---
title: Additional features
permalink: /docs/additional-features/
---

* Table of contents
{:toc}

# Account name enquiry

Since it's easy to mistype the account number or mobile number for a recipient, we provide a feature where you can
request more details about an account number, before creating a transaction.

To do this initiate a call to the following endpoint:

## For Bank Accounts:

{% capture data-raw %}
```javascript
POST /v1/account_validations

{
  "bank_account": "12345678", // account number to query
  "bank_code": "000", // bank code to query - same codes are used as for creating the transactions
  "country": "NG",   // Only "NG" and "GH" is supported for now
  "currency": "NGN", // Only "NGN" and "GHS" is supported for now
  "method": "bank"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="validation-bank" raw=data-raw %}

## For Mobile Accounts:

{% capture data-raw %}
```javascript
POST /v1/account_validations

{
  "phone_number": "+233000000000", // mobile phone number to query
  "country": "GH",   // Only "GH" is supported for now
  "currency": "GHS", // Only "GHS" is supported for now
  "method": "mobile",
  "mobile_provider": "vodafone" // Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="validation-mobile" raw=data-raw %}

If the `mobile_provider` field is provided, the validation result will be based off `phone_number`-`mobile_provider` registration check.

The valid `mobile_provider` values are:

{% capture data-raw %}
```
mtn
airtel
tigo
vodafone
```
{% endcapture %}

{% include language-tabbar.html prefix="mobile_provider-values" raw=data-raw %}

The response will either be a `200 OK`, and provide you with the account title:

{% capture data-raw %}
```javascript
{
  "object": {
    "account_name": "Test User"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="validation-result" raw=data-raw %}


Or a `422 Unprocessably Entity` status code, with an error description in the body:

{% capture data-raw %}
```javascript
{
  "object": {
    "account_name": null
  },
  "meta": {
    "error": "Account Invalid"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="validation-result-failure" raw=data-raw %}


Once you have the account title you can compare that with the recipient details you wish to provide us, and only create a transaction if they match.

Note that an error on name enquiry might both mean that the account doesn't exist, or that there is a connectivity issue with the banking system. Because of this if you get an error message you might need to retry the call a few minutes later.

Also note that GHS mobile validation currently only works for Airtel Tigo and MTN, so mobile numbers belonging to other operators will always return an error.

# Name validation in transactions

Another feature to limit mispayments because of mistyped account numbers is enabling name validation on transactions. This feature will block payouts if the account holder's name and the recipient name provided don't match. The feature is currently available for `NGN::Bank`, `GHS::Bank` and `GHS::Mobile` payouts only.

To enable name validation please enable the `account_validation` trait during transaction creation:

{% capture data-raw %}
```javascript
POST /v1/transactions

{
   "transaction":{
      "traits": {
        "account_validation": true
      },
      // (...) additional transaction details
   }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="validation-trait" raw=data-raw %}

We can also enable name validation by default across all transactions created by you. If this is of interest please contact our team so we can configure your account as such. If the feature is enabled, then it can be disabled on a per-transaction basis by specifying `"account_validation": false` in the `traits` section.

Once the trait is enabled we will do a name enquiry from the bank and check if the name we get back matches the name received in the recipient details. If they match we will go ahead with the payout. If it doesn't we will stop the payout and return an error message describing that the transaction will not proceed unless the recipient details are updated to match the account holder name, or name validation is disabled on the transaction.

In both cases we will return the account holder name in the recipient's metadata. For example if you entered "JOHN SMITH" as the recipient name, but the account holder is in fact "JANE DOE" then you will receive a `recipient.error` webhook with the following details:

{% capture data-raw %}
```javascript
{
  "webhook": "fd599451-4f3c-4045-91e1-d68ed12ffb75",
  "event": "recipient.error",
  "object": {
    "editable": true,
    "metadata": {
      "provider_name_validation": {
        "valid?": true,
        "account_name": "JANE DOE"
      }
    },
    "payout_method": {
      "type": "NGN::Bank",
      "details": {
        "last_name": "SMITH",
        "first_name": "JOHN",
        // (...)
      },
    }
    "state": "error",
    "state_reason": "The recipient name doesn't match the account holder's name. Please edit or cancel the transaction",
    // (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="recipient-error" raw=data-raw %}

In case the account number doesn't exist at the bank or there is a connectivity issue with the banking system you will receive an error with the following message: "We could not verify that the account entered exists. This could be a temporary error with a bank, or it can mean the details entered were incorrect. We will retry the transaction". Unfortunately due to how the banking system works in the supported markets it is not always possible to differentiate an invalid account number from a connectivity issue, hence we will automatically retry the name enquiry until we get a valid response, or the transaction is cancelled.

# Collections from senders

The TransferZero API can also be used to collect money from various senders.

For the supported collection corridors please see the [collection details documentation]({{ "/docs/collection-details/" | prepend: site.baseurl }}).

<div class="alert alert-warning" markdown="1">
**Warning!** Our system only allows fully KYC'd senders to send in funds, this includes using our collection systems as well. Please read more about our KYC requirements in the [KYC documentation](({{ "/docs/kyc/" | prepend: site.baseurl }})). Also please contact our team for more information so we can assess your KYC processess to know if they are adequate or not.
</div>

The collected money can then be used to fund any of the an automated payout types (see the [transaction flow]({{ "/docs/transaction-flow/" | prepend: site.baseurl }})), or it can be used to fund the user's internal balance. In the latter case payments will be aggregated and only sent out manually by our team once requested.

How to handle automated collection requests are based on the particular currency and type of collection.

You can also check the [API reference documentation](https://api.transferzero.com/documentation#fetching-possible-payin-methods) for more details.

The generic structure of a transaction that collects the equivalent of 100 USD from senders and pays out to the USD balance (that will be payed out manually by our team in bulk) looks like the following:

{% capture data-raw %}
```javascript
{
  "input_currency": "NGN",
  "payin_methods": [
    {
      // payin method details
    }
  ],
  "sender": {
    // sender details
  },
  "recipients": [
    {
      "requested_amount": "100",
      "requested_currency": "USD",
      "payout_method": {
        "type": "USD::Balance",
        "details": {
          "reference": "REF-000"
            // Reference number that you wish to appear on reconciliation reports.
            // The field is optional
        }
      }
    }
  ],
  "metadata": {},
  "external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-example" raw=data-raw %}

Please note that this is just an example, the `recipient` details, including the `requested_amount` and `requested_currency` can be modified based on the steps described at the [transaction flow]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}) documentation. You can also use any of the automated payout types instead of `USD::Balance`, in which case once we receive the funds the payment will be done automatically. The funds can also be sent to any other currency, just make sure that the `requested_currency` and the `type` matches, e.g for `NGN` you use `NGN::Balance`.

The response will always look like the following. It is very similar to the standard transaction response, but also contains details on how to handle the collection request:

{% capture data-raw %}
```javascript
{
  "object": {
    "id":"xxxxxxxx",
    "state": "approved",
    "input_amount": 724.0,
    "input_currency": "NGN",
    "payin_reference": "119394",
    "sender": {
      // sender details
    },
    "payin_methods": [
      {
        "id": "xxxxxxxx",
        "type":"NGN::Bank",
        "out_details": {
          // The out_details hash contains instructions on how to finish the payment.
          // These values might change for each request and should never be cached.
        },
        "in_details": {
          // The input details as sent in the request
        },
        "instructions": {
          // In case there are specific instructions to follow they will appear here.
          // Compared to the details in `out_details` the instructions here are static,
          // and don't contain dynamic details, like reference numbers
        }
      }
    ],
    "recipients": [
      // recipient details
    ]
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-response" raw=data-raw %}

Please note the `payin_reference` number, which should be used if the provider asks for a reference number whether it's bank, card or mobile payments. This number will be used to link together the collection with the transaction. Note that this might not always be a number - some providers will have alphanumeric values for example.

For the valid options in the `payin_methods` field please see the [collection details documentation]({{ "/docs/collection-details/" | prepend: site.baseurl }}).

# Auto cancellation and refund of transactions

By default the auto-cancel feature is enabled, which means we will automatically cancel and refund any transaction that couldn't be payed out in 24 hours from funding.

The feature can be disabled. When this happens, once a transaction has been paid we will constantly try to pay it out until we either succeed, or the transaction is cancelled by you. This is to allow you to decide how long you wish us to retry payouts, and so you can control the refund process.

To disable auto cancellation please disable the `auto_refund` trait during transaction creation:

{% capture data-raw %}
 ```javascript
POST /v1/transactions

{
   "transaction":{
      "traits": {
        "auto_refund": false
      },
      // (...) additional transaction details
   }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="auto-cancellation-trait" raw=data-raw %}

Auto refund is enabled by default across all transactions created by you. The feature can be disabled on a per-transaction basis by specifying `"auto_refund": false` in the `traits` section.

However if the trait is enabled and 24 hours have elapsed since the transaction has been funded without a successful payout, we will cancel the transaction. If the transaction was paid from the account balance, the funds will also be immediately returned to the account balance and can be used immediately to fund new transactions.

Please note that if the payout is pending when the 24 hour has been elapsed, we will wait for confirmation from our provider whether the payout was successful or not. If it wasn't, we will cancel the transaction immediately after we receive the confirmation. Note that this means that even if auto refund is enabled some transactions might take longer than 24 hours to get cancelled and refunded.

# Editing recipients

Occasionally there are errors on payouts that are because the recipient details are wrong, for example the account number entered is invalid. While you can simply cancel the transaction and create a new one with the updated details, occasionally it might be easier to update the recipient. You can also use this feature for cash pickup transactions to edit the recipient's details while keeping the pickup reference number the same.

To update the recipient you can use the `PATCH /v1/recipients/[TRANSFERZERO_RECIPIENT_ID]` endpoint. Please note that the ID you have to use is for the recipient and not the transaction (similarly to how you can cancel recipients)

To use the endpoint you need to set the fields you wish to update. For example to change the `bank_account` you have to do the following:

{% capture data-raw %}
```javascript
{
  "recipient": {
    "payout_method": {
      "details": {
        "bank_account": "12345679"
      }
    }
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="recipient-edit" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note!** For non-cash transactions recipients can only be updated when the `editable` flag on the recipient is set to `true`.
</div>

<div class="alert alert-info" markdown="1">
**Note!** For non-cash transactions if the payment is already pending to the bank account or mobile number the change will only be effective if there is an error during payment, in which case we'll use the new details to retry the transaction.
</div>

# Proof of payment

To get your proof of payment files you can use this endpoint:

`GET /v1/recipients/[TRANSFERZERO_RECIPIENT_ID]/proof_of_payments`

Please note that the ID you have to use is for the recipient and not the transaction (similarly to how you can cancel and update recipients)

The endpoint responds with a list of uploaded proof of payment files, e.g.:

{% capture data-raw %}
```javascript
{
  "object": [
    {
      "thumbnail": "(..)/my_file_thumb.jpg",
      "file_name": "my_file.jpg",
      "id": "xxxxxxxx",
      "url": "(..)/my_file.jpg"
    }
  ]
}
```
{% endcapture %}

{% include language-tabbar.html prefix="proof-of-payments" raw=data-raw %}
