---
title: Additional features
permalink: /docs/additional-features/
---

* Table of contents
{:toc}

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
