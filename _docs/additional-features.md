---
title: Additional features
permalink: /docs/additional-features/
---

* Table of contents
{:toc}

# Account name enquiry

Since it's easy to mistype the account number for a recipient, we provide a feature where you can
request more details about an account number, before creating a transaction.

To do this initiate a call to the following endpoint:

## For Bank Accounts:

```ruby
POST /v1/account_validations

{
  "bank_account": "12345678", # account number to query
  "bank_code": "000", # bank code to query - same codes are used as for creating the transactions
  "country": "NG",   # Only "NG" and "GH" is supported for now
  "currency": "NGN", # Only "NGN" and "GHS" is supported for now
  "method": "bank"
}
```

## For Mobile Accounts:

```ruby
POST /v1/account_validations

{
  "phone_number": "+233000000000", # mobile phone number to query
  "country": "GH",   # Only "GH" is supported for now
  "currency": "GHS", # Only "GHS" is supported for now
  "method": "mobile"
}
```

The response will either be a `200 OK`, and provide you with the account title:

```javascript
{
  "object": {
    "account_name": "Test User"
  }
}
```

Or a `422 Unprocessably Entity` status code, with an error description in the body:

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

Once you have the account title you can compare that with the recipient details you wish to provide us, and only create a transaction if they match.

Note that an error on name enquiry might both mean that the account doesn't exist, or that there is a connectivity issue with the banking system. Because of this if you get an error message you might need to retry the call a few minutes later.

Also note that GHS mobile validation currently only works for Airtel Tigo and MTN, so mobile numbers belonging to other operators will always return an error.

# Name validation in transactions

Another feature to limit mispayments because of mistyped account numbers is enabling name validation on transactions. This feature will block payouts if the account holder's name and the recipient name provided don't match. The feature is currently available for `NGN::Bank` and `GHS::Bank` payouts only.

To enable name validation please enable the `account_validation` trait during transaction creation:

```javascript
POST /v1/transactions

{
   "transaction":{
      "traits": {
        "account_validation": true
      },
      (...) // additional transaction details
   }
}
```

We can also enable name validation by default across all transactions created by you. If this is of interest please contact our team so we can configure your account as such. If the feature is enabled, then it can be disabled on a per-transaction basis by specifying `"account_validation": false` in the `traits` section.

Once the trait is enabled we will do a name enquiry from the bank and check if the name we get back matches the name received in the recipient details. If they match we will go ahead with the payout. If it doesn't we will stop the payout and return an error message describing that the transaction will not proceed unless the recipient details are updated to match the account holder name, or name validation is disabled on the transaction.

In both cases we will return the account holder name in the recipient's metadata. For example if you entered "JOHN SMITH" as the recipient name, but the account holder is in fact "JANE DOE" then you will receive a `recipient.error` webhook with the following details:

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
        (...)
      },
    }
    "state": "error",
    "state_reason": "The recipient name doesn't match the account holder's name. Please edit or cancel the transaction",
    (...)
  }
}
```

In case the account number doesn't exist at the bank or there is a connectivity issue with the banking system you will receive an error with the following message: "We could not verify that the account entered exists. This could be a temporary error with a bank, or it can mean the details entered were incorrect. We will retry the transaction". Unfortunately due to how the banking system works in the supported markets it is not always possible to differentiate an invalid account number from a connectivity issue, hence we will automatically retry the name enquiry until we get a valid response, or the transaction is cancelled.

# Collections from senders

The TransferZero API can also be used to collect money from various senders. We currently support the following automated ways to collect money from the user:

* GHS mobile collections
* TZS mobile collections
* UGX mobile collections
* NGN mobile collections
* NGN card collections
* GBP bank collections through IBAN
* EUR bank collections through IBAN

The collected money can then be used to fund any of the an automated payout types (see the [transaction flow]({{ "/docs/transaction-flow/" | prepend: site.baseurl }})), or it can be used to fund the user's internal balance. In the latter case payments will be aggregated and only sent out manually by our team once requested.

How to handle automated collection requests are based on the particular currency and type of collection.

You can also check the [API reference documentation](https://api.transferzero.com/documentation#fetching-possible-payin-methods) for more details.

The generic structure of a transaction that collects the equivalent of 100 USD from senders and pays out to the USD balance (that will be payed out manually by our team in bulk) looks like the following:

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

Please note that this is just an example, the `recipient` details, including the `requested_amount` and `requested_currency` can be modified based on the steps described at the [transaction flow]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}) documentation. You can also use any of the automated payout types instead of `USD::Balance`, in which case once we receive the funds the payment will be done automatically. The funds can also be sent to any other currency, just make sure that the `requested_currency` and the `type` matches, e.g for `NGN` you use `NGN::Balance`.

The response will always look like the following. It is very similar to the standard transaction response, but also contains details on how to handle the collection request:

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

Please note the `payin_reference` number, which should be used if the provider asks for a reference number whether it's bank, card or mobile payments. This number will be used to link together the collection with the transaction. Note that this might not always be a number - some providers will have alphanumeric values for example.

For the valid options in the `payin_methods` field please see the next sections

## NGN card collection requests through Interswitch

To initiate an NGN card collection through Interswitch please use the following details:

```javascript
"input_currency": "NGN",
"payin_methods": [
  {
    "type": "NGN::Bank",
    "in_details": {
      "redirect_url": "http://redirect.back.to"
    },
    "provider": "interswitch"
  }
],
```

Please note the `redirect_url` which has to be set to an URL where you wish the user to be redirected once the payment has either been done, or the request has been rejected by the user.

Once the transaction has been created the `out_details` will be:

```javascript
"out_details": {
  "style": "redirect",
  "url": "https://api.transferzero.com/payin/interswitch/xxxxxxxx/yyyyyyyy"
}
```

In this case the user needs to be redirected to the url described at `url`.

Once they are redireted there they need to fill out their card details on the following pages.

![Interswitch transaction page 1]({{ "/img/collections/isw_card_page_1.png" | prepend: site.baseurl }})

The first page will be pre-filled with the sender's email address which can be updated, and the `payin_reference` number, which however should not be changed by the user!

Once the details are filled out the user will be redirected to the card payment pages:

![Interswitch transaction page 2]({{ "/img/collections/isw_card_page_2.png" | prepend: site.baseurl }})

Please note that here the amount also includes the 100 NGN card transaction fee as well. Dependent on the card the user might be required to enter their PIN number as well:

![Interswitch transaction page 2b]({{ "/img/collections/isw_card_page_2b.png" | prepend: site.baseurl }})

Once the details are filled out dependent on the card, the user might also be required to fill out a second factor verification site:

![Interswitch transaction page 3]({{ "/img/collections/isw_card_page_3.png" | prepend: site.baseurl }})

Once the details have been entered the user will be redirected back to the `redirect_url` URL that was set up in the request. If the transaction was successful we will send a `transaction.paid_in` webhook as well.

## NGN card, bank or mobile collection requests through Paga

Paga supports collections through their own mobile wallet system. They also support collections through some banks and some debit cards in Nigeria. Regardless of collection method the user has to be registered with Paga on <https://www.mypaga.com> in order to use the system.

To initiate an NGN collection through Paga please use the following details:

```javascript
"input_currency": "NGN",
"payin_methods": [
  {
    "type": "NGN::Mobile",
    "provider": "paga"
  }
],
```

The `out_details` will be:

```javascript
"out_details":{
  "style": "info",
  "url": "https://www.mypaga.com/paga-web/customer/login",
  "Merchant": "BitPesa",
  "Reference": "187464"
}
```

Once the transaction is initated the user should either login to their Paga account on the website, or alternatively use the Paga mobile app. They have to send the specific amount of funds to the merchant (usually "BitPesa") and reference number (usually a 6 digit number) provided in the response.

Once the payment has been successfully done a `transaction.paid_in` webhook will be sent out.

The Paga payment process looks like the following on the website: (Paying through the mobile app has similar steps as well)

![Paga login page 1]({{ "/img/collections/paga_mobile_login_1.png" | prepend: site.baseurl }})

First the user has to log in if they are not already.

![Paga login page 2]({{ "/img/collections/paga_mobile_login_2.png" | prepend: site.baseurl }})

Once logged in they should select the "pay bill or merchant" option

![Paga login page 3]({{ "/img/collections/paga_mobile_login_3.png" | prepend: site.baseurl }})

Once selected, they should scroll to the bottom and search for the Merchant returned in the response above. This is usuall called "BitPesa".

![Paga transaction page 1]({{ "/img/collections/paga_mobile_page_1.png" | prepend: site.baseurl }})

Next the user has to enter the exact amount and reference number in the next page. These fields will not be pre-filled, so it's important that they are filled out by the customer properly otherwise the payments could not be linked to the transaction appropariately.

Once the details have been filled out there's a confirmation page:

![Paga transaction page 2]({{ "/img/collections/paga_mobile_page_2.png" | prepend: site.baseurl }})

Note that on the confirmation page there's an extra fee added to the amount. The customer should double check that the reference number and the amount (without the extra fee) matches the transaction details, otherwise the payment will not be linked properly.

Once the Pay button is pressed the user can choose how to pay the transaction. They can either use their Paga mobile wallet:

![Paga transaction page 3a]({{ "/img/collections/paga_mobile_page_3a.png" | prepend: site.baseurl }})

Or select bank collection (note that not all banks are supported by Paga for collection):

![Paga transaction page 3b]({{ "/img/collections/paga_mobile_page_3b.png" | prepend: site.baseurl }})

Or card payments (note that not all debit cards are supported by Paga for collection):

![Paga transaction page 3c]({{ "/img/collections/paga_mobile_page_3c.png" | prepend: site.baseurl }})

Finally once the payment goes through the customer will see a success page:

![Paga transaction page 4]({{ "/img/collections/paga_mobile_page_4.png" | prepend: site.baseurl }})

## GHS mobile collections through Interpay

To initiate a GHS mobile collections please use the following details:

```javascript
"input_currency": "GHS",
"payin_methods": [
  {
    "type": "GHS::Mobile",
    "in_details": {
      "phone_number": "+2569999999",
      "send_instructions": true
    },
    "provider": "interpay"
  }
],
```

Once the transaction is created the specified phone number will receive instructions on how to pay in the requested amount.

Please note that Interpay GHS Mobile collections does not work with Vodafone Cash. Also if the customer does not have enough funds to pay the transaction they might not receive the payment prompt to their phone. In this case the transaction request should be re-sent, once the customer has confirmed they have enough funds.

Once the payment has been successfully done a `transaction.paid_in` webhook will be sent out.

## TZS and UGX mobile collection using Beyonic

To initiate a GHS mobile collections please use the following details:

```javascript
"input_currency": "TZS", // or UGX
"payin_methods": [
  {
    "type": "TZS::Mobile", // or UGX::Mobile
    "in_details": {
      "phone_number": "+2559999999",
      "send_instructions": true
    },
    "provider": "beyonic"
  }
],
```

Once the transaction is created the specified phone number will receive instructions on how to pay in the requested amount.

If the user does not receive a prompt they are still able to finish the payment. Instructions can be found in the `payin_methods[0].instructions` hash in the following format:

(example instructions for TZS payments)

```javascript
"instructions": {
  "MPESA Code": "\\nDial *150*00#\\nSelect Option 4: Pay by M-Pesa\\nSelect Option 4: Enter Company Number\\nInput number: 400700\\nInput payment reference: 008transferzero\\nInput payment amount\\nInput password\\n",
  "TIGO PESA Code": "\\nDial *150*01#\\nSelect Option 4: Payments\\nSelect Option 3: Enter Company Number\\nInput number: 400700\\nInput payment reference: 008transferzero\\nInput payment amount\\nInput password\\n",
  "Airtel Code":"\\nDial *150*60#\\nChoose Number 5: Pay Bills\\nChoose Number 4: Input Company Name\\nInput name: Datavisint\\nInput payment amount\\nInput reference number: 008transferzero\\nInput password\\n"
}
```

Once the payment has been successfully done a `transaction.paid_in` webhook will be sent out.

## GBP and EUR IBAN collections

To initiate GBP or EUR IBAN collections please use the following details:

```javascript
"input_currency": "GBP", // or EUR
"payin_methods": [
  {
    "type": "GBP::Bank", // or EUR::Bank
    "provider": "lhv"
  }
],
```

The user will then need to follow the instructions as shown in the response's `out_details` hash:

```javascript
"out_details": {
  "style": "info",
  "BIC": "LHVBEE22",
  "Bank Address": "Tartu mnt 2, 10145 Tallinn, Estonia.",
  "Account Name": "B TRANSFER SERVICES LIMITED",
  "IBAN": "EE087700771002673049",
  "Beneficiary Address": "Tax Assist Accountants, 64 Southwark Bridge Road, London SE1 0AS",
  "Reference": "PDTWTACVNTPC"
}
```

The user will then need to send the appropriate funds to the IBAN shown above, with the reference number used as "payment details". Note that IBAN  payments can take up to 5 business days to arrive. Once the payment has been received a `transaction.paid_in` webhook will be sent out.

# Auto cancellation and refund of transactions

By default once a transaction has been paid we will constantly try to pay it out until we either succeed, or the transaction is cancelled by you. This is to allow you to decide how long you wish us to retry payouts, and so you can control the refund process.

However as this can become complicated, we also provide a feature where you can ask us to auto-cancel transactions in case they fail payouts. When the feature is enabled we will automatically cancel and refund any transaction that couldn't be payed out in 24 hours from funding.

To enable auto cancellation please enable the `auto_refund` trait during transaction creation:
 ```javascript
POST /v1/transactions
 {
   "transaction":{
      "traits": {
        "auto_refund": true
      },
      (...) // additional transaction details
   }
}
```

We can also enable auto refund by default across all transactions created by you. If this is of interest, please contact our team so we can configure your account as such. If the feature is enabled, then it can be disabled on a per-transaction basis by specifying `"auto_refund": false` in the `traits` section.

Once the trait is enabled and 24 hours have elapsed since the transaction has been funded without a successful payout, we will cancel the transaction. If the transaction was paid from the account balance, the funds will also be immediately returned to the account balance and can be used immediately to fund new transactions.

Please note that if the payout is pending when the 24 hour has been elapsed, we will wait for confirmation from our provider whether the payout was successful or not. If it wasn't, we will cancel the transaction immediately after we receive the confirmation. Note that this means that even if auto refund is enabled some transactions might take longer than 24 hours to get cancelled and refunded.

# Editing recipients

Occasionally there are errors on payouts that are because the recipient details are wrong, for example the account number entered is invalid. While you can simply cancel the transaction and create a new one with the updated details, occasionally it might be easier to update the recipient.

To update the recipient you can use the `PATCH /v1/recipients/{recipient_id}` endpoint. Please note that the ID you have to use is for the recipient and not the transaction (similarly to how you can cancel recipients)

To use the endpoint you need to set the fields you wish to update. For example to change the `bank_account` you have to do the following:

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

<div class="alert alert-info"><b>Note:</b> Recipients can only be updated when the `editable` flag on the recipient is set to `true`.</div>

<div class="alert alert-info"><b>Note:</b> If there no payouts pending then updating recipients will also trigger an immediate retry of a payout with the new details.</div>
