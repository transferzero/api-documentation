---
title: Additional features
permalink: /docs/additional-features/
---

* Table of contents
{:toc}

# Collections from senders

The AZA Finance API can also be used to collect money from various senders.

For the supported collection corridors please see the [collection details documentation]({{ "/docs/collection-details/" | prepend: site.baseurl }}).

<div class="alert alert-warning" markdown="1">
**Warning!** Our system only allows fully KYC'd senders to send in funds, this includes using our collection systems as well. Please read more about our KYC requirements in the [KYC documentation](({{ "/docs/kyc/" | prepend: site.baseurl }})). Also please contact our team for more information so we can assess your KYC processess to know if they are adequate or not.
</div>

The collected money can then be used to fund any of the an automated payout types (see the [transaction flow]({{ "/docs/transaction-flow/" | prepend: site.baseurl }})), or it can be used to fund the user's internal balance. In the latter case payments will be aggregated and only sent out manually by our team once requested.

How to handle automated collection requests are based on the particular currency and type of collection.

You can also check the [API reference documentation](https://api.transferzero.com/documentation#fetching-possible-payin-methods) for more details.

## Collection transaction
The generic structure of a transaction that collects the equivalent of 100 USD from senders and pays out to the USD balance (that will be payed out manually by our team in bulk) looks like the following:

{% capture data-raw %}
```javascript
{
  "input_currency": "XOF",
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
    "id":"1f7e1e99-5572-414d-a5dd-83f4728efff8",
    "state": "approved",
    "input_amount": 724.0,
    "input_currency": "NGN",
    "payin_reference": "119394",
    "sender": {
      // sender details
    },
    "payin_methods": [
      {
        "id": "1f7e1e99-5572-414d-a5dd-83f4728efff8",
        "type":"XOF::Mobile",
        "ux_flow": "ussd_popup",
        "state": "pending",
        "state_reason_details": {
          "code": "1",
          "category": "pending",
          "messages": ["Pending", "Pending", "Pending"],
          "description": "Awaiting funds from the sender."
        }
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


## Collection flow discovery
Collection requests present the sender with different user experience flows based on the particular currency, type of collection and availability.

You can validate your preferred flow by sending a request to the transaction validate endpoint with a list of payin methods and your preferred flow for each:

{% capture data-raw %}
```javascript
POST /v1/transactions/validate
{
  "input_currency": "XOF",
  "payin_methods": [
    {
      "type": "XOF::Mobile",
      "ux_flow": "ussd_popup",
      "in_details": {
        "mobile_provider": "mtn"
      }
    },
    {
      "type": "XOF::Mobile",
      "ux_flow": "ussd_popup",
      "in_details": {
        "mobile_provider": "vodafone"
      }
    },
  ],
  "sender": {
    // sender details
  },
  "recipients": [
   // recipient details
  ],
  "metadata": {},
  "external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-flow-discovery" raw=data-raw %}

The response would look like the following:

{% capture data-raw %}
```javascript
{
  "input_currency": "XOF",
  "payin_methods": [
    {
      "type": "XOF::Mobile",
      "ux_flow": "ussd_popup",
      "in_details": {
        "mobile_provider": "vodafone"
      },
      "errors": {
        "mobile_provider": "invalid"
      }
    },
    {
      "type": "XOF::Mobile",
      "ux_flow": "ussd_popup",
      "in_details": {
        "mobile_provider": "mtn"
      },
      "errors": {}
    }
  ],
  "sender": {
    // sender details
  },
  "recipients": [
   // recipient details
  ],
  "metadata": {},
  "external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-flow-response" raw=data-raw %}

For the above example, it shows that `vodafone` is not available and you can only use `mtn` to initiate the collection.


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
      "id": "1f7e1e99-5572-414d-a5dd-83f4728efff8",
      "url": "(..)/my_file.jpg"
    }
  ]
}
```
{% endcapture %}

{% include language-tabbar.html prefix="proof-of-payments" raw=data-raw %}

# Balance enquiry

To obtain your current account balance you can use following two endpoints:

`GET /v1/accounts` to obtain your balance for all currencies or

`GET /v1/accounts/[CURRENCY_NAME]` to obtain for a single currency.

The response in both cases look like the following (with only one currency returned in the latter instance)

```javascript
{
  "meta": {
    "negative_balance": false // returns if you are allowed to go beyond your account balance
  },
  "object": [
    {
      "amount": 123.45,
      "currency": "USD"
    },
    {
      "amount": 1000,
      "currency": "XOF"
    }
    // [...]
  ]
}
```

<div class="alert alert-warning" markdown="1">
**Warning!** Refrain from using this endpoint more than once in every five minutes.
</div>

<div class="alert alert-info" markdown="1">
**Note!** Currencies are case-sensitive, please keep them in uppercase.
</div>

<div class="alert alert-info" markdown="1">
**Note!** if you are operating ZAR market via our partnership with Bidvest, you can either fetch all balances or balances for a single currency using USD::Bidvest , GBP::Bidvest or EUR::Bidvest as the currency name. Please be aware that the returned balances reflect deductions for any transaction amounts currently in transit.
</div>

# Get current exchange rates

To obtain the current exchange rates in the system you can call the following endpoint:

`GET /v1/info/currencies/in`

The response will contain all possible currency pairs. For example the current rate to convert funds from `NGN` to `XOF` will appear the following way:

```javascript
{
  "object": [
    {
      "code": "NGN",
      "opposites": [
        {
          "code": "XOF",
          "rate": 1.5132,
        },
        // [...]
      ]
    },
    // [...]
  ]
}
```

<div class="alert alert-warning" markdown="1">
**Warning!** Refrain from using this endpoint more than once in every five minutes.
</div>

If you need to verify the rate before creating transactions you can use the `POST /v1/transactions/calculate` endpoint when sent a full transaction request object will return the specific rates that will be used in the response, but will not actually create the transaction.

You can also separate the transaction creation and funding by using `POST /v1/transactions` and `POST /v1/accounts/debits` separately (as opposed to using `POST /v1/transactions/create_and_fund`), as this will allow you to have a transaction with the exact rates that will be used, before actually committing to posting them. Please only use this strategy if you plan on actually committing to the transactions most of the time, as all of the unfunded transactions will appear as a failed transaction on your account report.
