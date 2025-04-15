---
title: Collection details
permalink: /docs/collection-details/
---

* Table of contents
{:toc}

This document lists the required details that need to be sent for each of our collection corridors.

# XOF mobile collections

To initiate a XOF mobile collection, please use the following details (`phone_number` used below are examples):
At the moment, we only support collections in:

- Senegal(Orange) - this requires the sender to request an OTP auth code via USSD `#144#391*ORANGE_MONEY_PIN_CODE#` . The auth code retrieved should be included in the `otp` parameter in `in_details`. Uses `ussd_voucher` in `ux_flow` parameter.
- Ivory Coast(Orange) - this requires the sender to request an OTP auth code via USSD `#144*82#`. The auth code retrieved should be included in the `otp` parameter in `in_details`. Uses `ussd_voucher` in `ux_flow` parameter.
- Ivory Coast(MTN) - On receipt of collection request, Sender dials a USSD code `*133#`  & selects option 1 (Validate withdrawal & payment) 2. Sender selects option to confirm 3. Sender enters secret code to confirm withdrawal 4. Sender receives sms that confirms debit is completed. Uses `ussd_popup` in `ux_flow` parameter


{% capture data-raw %}

```javascript
"input_currency": "XOF",
"payin_methods": [
  {
    "type": "XOF::Mobile",
    "ux_flow": "ussd_voucher",
    "in_details": {
      "phone_number": "+221123456700", // E.164 international format
      "mobile_provider": "orange",
      "country": "SN", // "SN" for Senegal, "CI" for Ivory Coast
      "otp": "123456"
    }
  }
],
```

 Or in MTN


```javascript
"input_currency": "XOF",
"payin_methods": [
  {
    "type": "XOF::Mobile",
    "ux_flow": "ussd_popup",
    "in_details": {
      "phone_number": "+2250506369100", // E.164 international format
      "mobile_provider": "mtn",
      "country": "CI", // "SN" for Senegal, "CI" for Ivory Coast
    }
  }
],
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-xof-mobile" raw=data-raw %}

If the payin method details are valid, you get back an `initial` response.

{% capture data-raw %}

```javascript
{
  "id": "1625c534-6db4-4f3a-adf2-62a8bec89080",
  "type": "XOF::Mobile",
  "ux_flow": "ussd_voucher",
  "state": "initial",
  "in_details": {
    "otp": "1234",
    "phone_number": "+221771234700", // E.164 international format
    "mobile_provider": "orange",
    "country": "SN"
  },
  "out_details": {
    "style": "info"
  },
  "instructions": {}
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-response" raw=data-raw %}

The collection process is handled **asynchronously**.

When the collection process starts, a `payin_method.pending` webhook is sent:

{% capture data-raw %}

```javascript
{
  "webhook": "ddef6199-6171-43ba-bbb5-29fb06c9df9f",
  "event": "payin_method.pending",
  "object": {
    "id": "1625c534-6db4-4f3a-adf2-62a8bec89080",
    "type": "XOF::Mobile",
    "ux_flow": "ussd_voucher",
    "state": "pending",
    "state_reason_details": {
      "code": "14",
      "category": "pending",
      "messages": [
        "Pending",
        "Pending status update",
        "Pending status update"
      ],
      "description": "This transaction is awaiting a status update from the provider."
    },
    "in_details": {
      "otp": "1234",
      "ux_flow": "ussd_voucher",
      "phone_number": "+221771234700", // E.164 international format
      "mobile_provider": "orange",
      "country": "SN"
    },
    "out_details": {
      "style": "info"
    },
    "instructions": {
    },
    "transaction_id": "0d59466a-dc2f-4aca-bad1-d4a98da37697",
    "transaction_external_id": "510c4e28-fe33-4c06-bd79-49d52d5b3094"
  }
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-pending" raw=data-raw %}

Once the funds have been successfully received from the sender, a `payin_method.paid_in` webhook is sent:
{% capture data-raw %}

```javascript
{
  "webhook": "ddef6199-6171-43ba-bbb5-29fb06c9df9f",
  "event": "payin_method.paid_in",
  "object": {
    "id": "1625c534-6db4-4f3a-adf2-62a8bec89080",
    "type": "XOF::Mobile",
    "ux_flow": "ussd_voucher",
    "state": "success",
    "state_reason_details": {
      "code": "0",
      "category": "paid",
      "messages": [
        "Success",
        "Success",
        "Success"
      ],
      "description": "The transaction was successfully completed."
    },
    "in_details": {
      "otp": "1234",
      "ux_flow": "ussd_voucher",
      "phone_number": "+221771234700", // E.164 international format
      "mobile_provider": "orange",
      "country": "SN"
    },
    "out_details": {
      "style": "info"
    },
    "instructions": {
    },
    "transaction_id": "0d59466a-dc2f-4aca-bad1-d4a98da37697",
    "transaction_external_id": "510c4e28-fe33-4c06-bd79-49d52d5b3094"
  }
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-paid-in" raw=data-raw %}

If there was an issue with the collection, a `payin_method.error` webhook is sent:
{% capture data-raw %}

```javascript
{
  "webhook": "ddef6199-6171-43ba-bbb5-29fb06c9df9f",
  "event": "payin_method.error",
  "object": {
    "id": "10bcee73-2c39-4c0d-9e00-7540c4d34a91",
    "type": "XOF::Mobile",
    "ux_flow": "ussd_voucher",
    "state": "error",
    "state_reason_details": {
      "code": "412",
      "category": "invalid_user_data_error",
      "messages": [
        "User Error",
        "Invalid user details",
        "Invalid mobile number"
      ],
      "description": "Mobile details are invalid. Please update the mobile details. You can also cancel this transaction."
    },
    "in_details": {
      "otp": "1234",
      "ux_flow": "ussd_voucher",
      "phone_number": "+221771234709", // E.164 international format
      "mobile_provider": "orange",
      "country": "SN"
    },
    "out_details": {
      "style": "info"
    },
    "instructions": {
    },
    "transaction_id": "b83f38d6-fc4c-49de-b512-f45ac914bbea",
    "transaction_external_id": "9b5f3c64-9b6b-41b8-9658-168999961b70"
  }
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-error" raw=data-raw %}

# NGN Bank collections

To initiate NGN bank collection, please use the following details (`phone_number` used below is an example):

{% capture data-raw %}

```javascript
"input_currency": "NGN",
"payin_methods": [
  {
    "type": "NGN::Bank",
    "ux_flow": "bank_transfer",
    "in_details": {
      "phone_number": "+234787221236", // E.164 international format
    }
  }
],
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ngn-bank" raw=data-raw %}

You will receive bank transfer information in the `out_details`:

{% capture data-raw %}

```javascript
"out_details": {
  "style": "bank_transfer",
  "amount": 0,
  "currency": "NGN",
  "bank_code": "bank code",
  "bank_name": "bank name",
  "created_at": "created at",
  "account_name": "account name",
  "account_number": "account number",
  "account_reference": "account reference"
}
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ngn-bank-out" raw=data-raw %}

And human readable instructions can be found in the `payin_methods[0].instructions` hash in the following format:

(instructions for NGN Bank payment)

{% capture data-raw %}

```javascript
"instructions": {
  "bank_transfer": "\\nTransfer the exact amount specified to the provided virtual account number.\\nMake sure to complete the payment within one day from the time you receive these instructions.\\n"
}
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ngn-bank-instructions" raw=data-raw %}

Once the funds have been successfully received from the sender, `payin_method.paid_in` and `transaction.paid_in` webhooks will be sent out.
