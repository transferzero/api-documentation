---
title: Collection details
permalink: /docs/collection-details/
---

* Table of contents
{:toc}

This document lists the required details that needs to be sent for each of our collection corridor

# NGN card or bank collection requests through Providus (Beta)

To initiate an NGN bank or card collections through Providus, use the following details:

{% capture data-raw %}
```javascript
"input_currency": "NGN",
"payin_methods": [
  {
    "type": "NGN::Bank",
    "in_details": {
      "payment_method": "bank",
      "redirect_url": "http://redirect.back.to"
    },
    "provider": "providus"
  }
],
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-ngn-card-bank" raw=data-raw %}

Please note both `redirect_url` and `payment_method` are **optional** and:
- The `redirect_url` is the URL where you wish the user to be redirected once the payment has either been done, or the request has been rejected by the user.
- The `payment_method` options are `bank` or `card`. Leaving this empty or omitting entirely will default to support both methods.

Once the transaction has been created the `out_details` will be:

{% capture data-raw %}
```javascript
"out_details": {
  "Bank Name": "Providus Bank",
  "Account Number": "yyyyyyyy",
  "url": "https://sdk.monnify.com/checkout/xxxxxxxx"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-ngn-card-bank-out" raw=data-raw %}

Depending on the payment method:
- If `bank` payment method, the user won't need to be redirected as the needed details, `Bank Name` and `Account Number`, should be enough to enable the user to deposit funds into the account.
- If `card` payment method, the user needs to be redirected to the url described at `url`.

<div class="alert alert-warning" markdown="1">
**Warning!** The account number returned will be different for each transaction. Make sure you never cache that value between transactions, and that you also explicitly tell your customers to double check that number and send the funds to the proper account number shown. Repet customers should be aware not to send the funds to an old account number they have already used in a previous transaction by mistake. Funds sent to an account number that is assigned to an old account number will not be marked as received, and it might take days for those funds to be recovered and refunded.
</div>

Once they are redirected, they will land on the first page where they shall choose which payment method to use.

![Providus choose payment method]({{ "/img/collections/providus_choose_method.png" | prepend: site.baseurl }})

If **Pay with Bank Transfer** method is chosen,

![Providus bank payment]({{ "/img/collections/providus_bank.png" | prepend: site.baseurl }})

This page contains information about the amount and bank account the user should deposit the amount into.

If **Pay with Card** method is chosen,

![Providus card payment]({{ "/img/collections/providus_card.png" | prepend: site.baseurl }})

This page contains information about the amount. The user should fill in their card details.

Once the card details are filled out, dependent on the card, the user might also be redirected to fill out a second factor verification page:

![Providus OTP]({{ "/img/collections/providus_final.png" | prepend: site.baseurl }})


# GHS mobile collections through Interpay

To initiate a GHS mobile collections please use the following details:

{% capture data-raw %}
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
{% endcapture %}

{% include language-tabbar.html prefix="collection-ghs" raw=data-raw %}

Once the transaction is created the specified phone number will receive instructions on how to pay in the requested amount.

Please note that Interpay GHS Mobile collections does not work with Vodafone Cash. Also if the customer does not have enough funds to pay the transaction they might not receive the payment prompt to their phone. In this case the transaction request should be re-sent, once the customer has confirmed they have enough funds.

Once the payment has been successfully done a `transaction.paid_in` webhook will be sent out.

# TZS and UGX mobile collection using Beyonic

To initiate a GHS mobile collections please use the following details:

{% capture data-raw %}
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
{% endcapture %}

{% include language-tabbar.html prefix="collection-beyonic" raw=data-raw %}

Once the transaction is created the specified phone number will receive instructions on how to pay in the requested amount.

If the user does not receive a prompt they are still able to finish the payment. Instructions can be found in the `payin_methods[0].instructions` hash in the following format:

(example instructions for TZS payments)

{% capture data-raw %}
```javascript
"instructions": {
  "MPESA Code": "\\nDial *150*00#\\nSelect Option 4: Pay by M-Pesa\\nSelect Option 4: Enter Company Number\\nInput number: 400700\\nInput payment reference: 008transferzero\\nInput payment amount\\nInput password\\n",
  "TIGO PESA Code": "\\nDial *150*01#\\nSelect Option 4: Payments\\nSelect Option 3: Enter Company Number\\nInput number: 400700\\nInput payment reference: 008transferzero\\nInput payment amount\\nInput password\\n",
  "Airtel Code":"\\nDial *150*60#\\nChoose Number 5: Pay Bills\\nChoose Number 4: Input Company Name\\nInput name: Datavisint\\nInput payment amount\\nInput reference number: 008transferzero\\nInput password\\n"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-beyonic-out" raw=data-raw %}

Once the payment has been successfully done a `transaction.paid_in` webhook will be sent out.

# EUR IBAN collections

To initiate EUR IBAN collections please use the following details:

{% capture data-raw %}
```javascript
"input_currency": "EUR",
"payin_methods": [
  {
    "type": "EUR::Bank",
    "provider": "lhv"
  }
],
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-iban" raw=data-raw %}

The user will then need to follow the instructions as shown in the response's `out_details` hash:

{% capture data-raw %}
```javascript
"out_details": {
  "style": "info",
  "Account Name": "B TRANSFER SERVICES LIMITED",
  "IBAN": "EE087700771002673049",
  "BIC": "LHVBEE22",
  "Bank Address": "Tartu mnt 2, 10145 Tallinn, Estonia.",
  "Beneficiary Address": "Tax Assist Accountants, 64 Southwark Bridge Road, London SE1 0AS",
  "Reference": "PDTWTACVNTPC"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-iban-out" raw=data-raw %}

The user will then need to send the appropriate funds to the IBAN shown above, with the reference number used as "payment details" (the reference will be different for each collection request, the one above is just an example).

Settlement times are dependent on what payment network the sender's bank supports:
* If they support the Instant Payment network funds arrive within 2 hours (but usually within 5 minutes)
* If they support the SEPA network, then funds arrive within 1-2 business days
* If they only support the Swift network, then funds arrive within 2-5 business days

Once the payment has been received a `transaction.paid_in` webhook will be sent out.

# GBP Faster Payments bank collections

To initiate GBP Faster Payments collections please use the following details:

{% capture data-raw %}
```javascript
"input_currency": "GBP", // or EUR
"payin_methods": [
  {
    "type": "GBP::Bank", // or EUR::Bank
    "provider": "lhv"
  }
],
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-fp" raw=data-raw %}

The user will then need to follow the instructions as shown in the response's `out_details` hash:

{% capture data-raw %}
```javascript
"out_details": {
  "style": "info",
  "Account Name": "B TRANSFER SERVICES LIMITED",
  "Account Number": "00000478",
  "Sort Code": "04-03-00",
  "IBAN": "GB41LHVB04030000000478",
  "BIC": "LHVBGB2L",
  "Bank Address": "1 Old Street Yard, London, EC1Y 8AF, United Kingdom",
  "Beneficiary Address": "Tax Assist Accountants, 64 Southwark Bridge Road, London SE1 0AS",
  "Reference": "PDTWTACVNTPC"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-fp-out" raw=data-raw %}

The user will then need to send the appropriate funds to the account details shown above, with the reference number used as "payment details" (the reference will be different for each collection request, the one above is just an example). If the payment was sent as a Faster Payments transfer then the collection should arrive within 2 hours (but usually instantly) If Faster Payments transfer is not used, or the funds are sent from outside the UK then however this will be a Swift payment, which can take up to 5 business days to arrive. Once the payment has been received a `transaction.paid_in` webhook will be sent out.
