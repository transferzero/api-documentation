---
title: Collection details
permalink: /docs/collection-details/
---

* Table of contents
{:toc}

This document lists the required details that need to be sent for each of our collection corridors.

# GHS mobile collections

To initiate a GHS mobile collection, please use the following details (phone_number and mobile_provider used below are examples):

{% capture data-raw %}
```javascript
"input_currency": "GHS",
"payin_methods": [
  {
    "type": "GHS::Mobile",
    "ux_flow": "ussd_popup",
    "in_details": {
      "phone_number": "+2339999999", // In international format
      "mobile_provider": "vodafone" // Mandatory. One of 'airtel', 'tigo', 'mtn', 'vodafone'
    }
  }
],
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-ghs-mobile" raw=data-raw %}

Once the transaction has been created the `out_details` will be:

{% capture data-raw %}
```javascript
"out_details": {
  "style": "ussd_menu_approval",
  "menu_option": "6",
  "requires_pin": true,
  "dialing_number": "*170#"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-ghs-mobile-out" raw=data-raw %}

Human readable instructions can be found in the `payin_methods[0].instructions` hash in the following format:

(example instructions for GHS Mobile payments)

{% capture data-raw %}
```javascript
"instructions": {
  'ussd_menu_approval': '\\nDial *170# to access mobile money menu.\\nSelect option 6 (My Wallet) and send.\\nChoose option 3 to check "my approvals".\\nChoose the transaction to approve and send.\\nConfirm transaction by choosing option1 (Yes) and send.\\nEnter mobile money pin and send.\\nYou will receive a new message on your mobile phone about the transaction.\\n'
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-ghs-mobile-instructions" raw=data-raw %}

Once the transaction is created, instructions for completing payment will be sent to the specified phone number.

Once the funds have been successfully received from the sender, `payin_method.paid_in` and `transaction.paid_in` webhooks will be sent out.

# UGX mobile collections

To initiate a UGX mobile collection, please use the following details (`phone_number` used below are examples):

{% capture data-raw %}
```javascript
"input_currency": "UGX",
"payin_methods": [
  {
    "type": "UGX::Mobile",
    "ux_flow": "ussd_popup",
    "in_details": {
      "phone_number": "+2569999999" // In international format
    }
  }
],
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-ugx-mobile" raw=data-raw %}

Once the transaction is created, instructions for completing payment will be sent to the specified phone number.

Once the funds have been successfully received from the sender, `payin_method.paid_in` and `transaction.paid_in` webhooks will be sent out.

# EUR bank collections

To initiate EUR IBAN collections please use the following details:

{% capture data-raw %}
```javascript
"input_currency": "EUR",
"payin_methods": [
  {
    "type": "EUR::Bank",
    "ux_flow": "bank_transfer"
  }
],
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-eur-bank" raw=data-raw %}

Payment should be made by the sender using the bank details returned in the response's `out_details` hash:

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

{% include language-tabbar.html prefix="collection-eur-bank-out" raw=data-raw %}

Funds should be sent to the IBAN shown above, with the reference number used as "payment details" (the reference will be different for each collection request, the one above is just an example).

Settlement times are dependent on what payment network the sender's bank supports:
* If they support the Instant Payment network, then funds arrive within 2 hours (but usually within 5 minutes)
* If they support the SEPA network, then funds arrive within 1-2 business days
* If they only support the Swift network, then funds arrive within 2-5 business days

Once the funds have been successfully received from the sender, `payin_method.paid_in` and `transaction.paid_in` webhooks will be sent out.

# GBP bank collections (including Faster Payments)

To initiate GBP Faster Payments collections please use the following details:

{% capture data-raw %}
```javascript
"input_currency": "GBP",
"payin_methods": [
  {
    "type": "GBP::Bank",
    "ux_flow": "bank_transfer"
  }
],
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-gbp-bank" raw=data-raw %}

Payment should be made by the sender using the bank details returned in the response's `out_details` hash:

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

{% include language-tabbar.html prefix="collection-gbp-bank-out" raw=data-raw %}

Funds should be sent to the Account Number and Sort Code shown above for domestic UK transfers (or to the IBAN value for international transfers), with the reference number used as "payment details" (the reference will be different for each collection request, the one above is just an example).

If the payment was sent as a Faster Payments transfer then the collection should arrive within 2 hours (but usually instantly). If Faster Payments transfer is not used, or the funds are sent from outside the UK, this will be a Swift payment which can take up to 5 business days to arrive.

Once the funds have been successfully received from the sender, `payin_method.paid_in` and `transaction.paid_in` webhooks will be sent out.
