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

For Collection transactions with `mtn` as `mobile_provider` and `ussd_menu_approval` as `ux_flow`, the `out_details` will be:

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

And human readable instructions can be found in the `payin_methods[0].instructions` hash in the following format:

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

## Collections requiring OTPs

Collections with `ux_flow: otp_verified_ussd_popup` require that the sender validate an OTP sent to their phone number when the transaction is created.
For such transactions, the details would look like:

{% capture data-raw %}

```javascript
"input_currency": "GHS",
"payin_methods": [
  {
    "type": "GHS::Mobile",
    "ux_flow": "otp_verified_ussd_popup",
    "in_details": {
      "phone_number": "+233123456789"
      "mobile_provider": "mtn"
    }
  }
]
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ghs-mobile-otp" raw=data-raw %}

Once the transaction is created, an OTP is sent to the `phone_number` specified in the payload. The response would look like:

{% capture data-raw %}

```javascript
"payin_methods": [
  {
    "id": "9b25ca43-1812-46b2-ae0c-57acefec0a34",
    "type": "GHS::Mobile",
    "ux_flow": "otp_verified_ussd_popup",
    "in_details": {
      "phone_number": "+233123456789"
      "mobile_provider": "mtn"
    },
    "state": "incomplete",
    "state_reason_details": {
      "code": 23,
      "category": "user_action_required",
      "messages": [
        "User action required",
        "OTP verification required",
        "OTP verification required"
      ],
      "description": "This transaction is awaiting OTP validation by the user."
    },
  }
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ghs-mobile-otp-out" raw=data-raw %}

In order to validate the OTP, send a PATCH request for the PayinMethod with the OTP in the payload:

{% capture data-raw %}

```javascript
PATCH /v1/payin_methods/9b25ca43-1812-46b2-ae0c-57acefec0a34
{
  "in_details": {
    "phone_number": "+233123456789"
    "mobile_provider": "mtn",
    "otp": "123456"
  }
}
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ghs-mobile-otp-validate" raw=data-raw %}

If the OTP matches the one sent to the sender's phone number, the collection process starts, otherwise you get a validation error:

{% capture data-raw %}

```javascript
{
  "id": "9b25ca43-1812-46b2-ae0c-57acefec0a34",
  "type": "GHS::Mobile",
  "ux_flow": "otp_verified_ussd_popup",
  "in_details": {
    "phone_number": "+233123456789"
    "mobile_provider": "mtn",
    "otp": "123456"
  },
  "errors": {
    "otp": [
      {
        "error": "invalid"
      }
    ]
  }
}
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ghs-mobile-otp-validate-out" raw=data-raw %}

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

# XOF mobile collections

To initiate a XOF mobile collection, please use the following details (`phone_number` used below are examples):
At the moment, we only support collections in:

- Senegal(Orange) - this requires the sender to request an OTP auth code via USSD `#144#391\*ORANGE_MONEY_PIN_CODE#` . The auth code retrieved should be included in the `otp` parameter in `in_details`.

{% capture data-raw %}

```javascript
"input_currency": "XOF",
"payin_methods": [
  {
    "type": "XOF::Mobile",
    "ux_flow": "ussd_voucher",
    "in_details": {
      "phone_number": "+221123456789", // In international format
      "mobile_provider": "orange",
      "otp": "123456"
    }
  }
],
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-xof-mobile" raw=data-raw %}

If the OTP matches the auth code that the sender got, the collection process starts:

{% capture data-raw %}

```javascript
{
  "id": "9b25ca43-1812-46b2-ae0c-57acefec0a34",
  "type": "XOF::Mobile",
  "ux_flow": "ussd_voucher",
  "state": "pending",
  "state_reason_details": {
    "code": 14,
    "category": "pending",
    "messages": [
      "Pending",
      "Pending status update"
    ],
    "description": "This transaction is awaiting status update from provider."
  },
  "in_details": {
    "phone_number": "+221123456789",
    "mobile_provider": "orange",
    "otp": "123456"
  },
  "out_details": {
    "style": "info"
  },
  "instructions": {
  }
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-response" raw=data-raw %}

Otherwise you get an error response:
{% capture data-raw %}

```javascript
{
  "id": "9b25ca43-1812-46b2-ae0c-57acefec0a34",
  "type": "XOF::Mobile",
  "ux_flow": "ussd_voucher",
  "state": "error",
  "state_reason_details": {
    "code": 415,
    "category": "invalid_user_data_error",
    "messages": [
      "Invalid User Data Error",
      "Invalid OTP Error"
    ],
    "description": "The provided otp code is invalid or expired."
  },
  "in_details": {
    "phone_number": "+221123456789",
    "mobile_provider": "orange",
    "otp": "123456"
  },
  "out_details": {
    "style": "info"
  },
  "instructions": {
  }
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-otp-error" raw=data-raw %}

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

- If they support the Instant Payment network, then funds arrive within 2 hours (but usually within 5 minutes)
- If they support the SEPA network, then funds arrive within 1-2 business days
- If they only support the Swift network, then funds arrive within 2-5 business days

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
