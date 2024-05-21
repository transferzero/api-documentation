---
title: Handling ZAR Mandates pre-transaction
permalink: /docs/handling-zar-mandates/
---

* Table of Contents
{:toc}

You can validate if a Mandate is already in place for a specific `ZAR::Bank` transaction using the validation endpoint (please refer to [/transactions/validate](https://specification.transferzero.com/#/Transactions/validate-transactions) in our API documentation for further details).

If the mandate doesn’t exist, we will trigger a new process on your behalf.

## Validate API request example

{% capture data-raw %}
```javascript
{
  "transaction": {
    "input_currency": "USD",
    "sender": {
      "country": "US",
      "phone_number": "+12124567890",
      "email": "test@example.com",
      "first_name": "First",
      "last_name": "Last",
      "city": "City",
      "street": "Street",
      "postal_code": "12345",
      "birth_date": "1970-01-01",
      "documents": [],
      "ip": "127.0.0.1",
      "metadata": {
        "sendRef": "SENDER-1234"
      }
    },
    "recipients": [
      {
        "requested_amount": "7040",
        "requested_currency": "ZAR",
        "payout_method": {
          "type": "ZAR::Bank",
          "details": {
            "first_name": "First",
            "middle_name": "Middle",
            "last_name": "Last",
            "street": "14 Main Street",
            "postal_code": "AB0001",
            "city": "Cape Town",
            "email": "recipient@email.com",
            "bank_code": "632005",
            "bank_account": "12345678",
            "phone_number": "+27119785313",
            "transfer_reason": "personal_account",
            "narration": "Birthday Gift"
          }
        }
      }
    ],
    "metadata": {
      "sendRef": "LOCAL-ID-1234"
    },
    "external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-details" raw=data-raw %}

## Validate API response examples

### Mandate already signed (HTTP `200`)
{% capture data-raw %}
```javascript
{
  "object": {
    "input_amount": 0.42,
    "input_currency": "USD",
    "metadata": {
    },
    "state": "approved",
    "sender": {
      "id": "043844c0-614c-4eca-bc40-466b78e5b855",
      // (...)
    },
    "payin_methods": [],
    "paid_amount": 0.0,
    "due_amount": 0.42,
    "recipients": [
      {
        "editable": true,
        "metadata": {
        },
        "state": "initial",
        "transaction_state": "initial",
        "type": "person",
        "retriable": true,
        "payout_method": {
          "type": "ZAR::Bank",
          "details": {
            "first_name": "First",
            "last_name": "Last",
            "bank_code": "632005",
            "bank_account": "12345678",
            "phone_number": "+27119785313",
            "transfer_reason": "personal_account",
            "street": "14 Main Street",
            "postal_code": "AB0001",
            "city": "Cape Town",
            "email": "recipient@email.com",
            "bank_name": "ABSA",
            "app_name": "MTO",
            "app_id": "649d6f5a-421e-48f6-beea-896f180a3e2b",
            "international_phone_number": "+27119785313",
            "nationalized_phone_number": "119785313"
          },
          "metadata": {
          },
          "provider": "bitpesa_auto",
          // (...)
          }
        },
        "exchange_rate": 23.80952380952381,
        "fee_fractional": 0,
        "transaction_external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026",
        "requested_amount": 10.0,
        "requested_currency": "ZAR",
        "input_amount": 0.42,
        "input_currency": "USD",
        "output_amount": 10.0,
        "output_currency": "ZAR"
      }
    ],
    "updated_at": "2024-05-16T13:04:26.888Z",
    "traits": {
    },
    "external_id": "04f14901-0554-402e-96e6-2958ca624871"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-details" raw=data-raw %}

### Mandate in progress (HTTP `422`)
{% capture data-raw %}
```javascript
{
  "object": {
    "input_amount": 0.42,
    "input_currency": "USD",
    "metadata": {
    },
    "state": "approved",
    "sender": {
      "id": "043844c0-614c-4eca-bc40-466b78e5b855",
      // (...)
    },
    "payin_methods": [],
    "paid_amount": 0.0,
    "due_amount": 0.42,
    "recipients": [
      {
        "editable": true,
        "metadata": {
        },
        "state": "initial",
        "transaction_state": "initial",
        "type": "person",
        "retriable": true,
        "payout_method": {
          "type": "ZAR::Bank",
          "details": {
            "first_name": "First",
            "last_name": "Last",
            "bank_code": "632005",
            "bank_account": "12345678",
            "phone_number": "+27119785313",
            "transfer_reason": "personal_account",
            "street": "14 Main Street",
            "postal_code": "AB0001",
            "city": "Cape Town",
            "email": "recipient@email.com",
            "bank_name": "ABSA",
            "app_name": "MTO",
            "app_id": "649d6f5a-421e-48f6-beea-896f180a3e2b",
            "international_phone_number": "+27119785313",
            "nationalized_phone_number": "119785313"
          },
          "metadata": {
          },
          "provider": "bitpesa_auto",
          // (...)
          }
        },
        "exchange_rate": 23.80952380952381,
        "fee_fractional": 0,
        "transaction_external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026",
        "requested_amount": 10.0,
        "requested_currency": "ZAR",
        "input_amount": 0.42,
        "input_currency": "USD",
        "output_amount": 10.0,
        "output_currency": "ZAR"
      }
    ],
    "updated_at": "2024-05-16T13:04:26.888Z",
    "errors": {
      "base": [
        {
          "error": "Mandate is in progress"
        }
      ],
      "main_error": [
        {
          "error": "Transaction details are invalid: Mandate is in progress"
        }
      ]
    },
    "traits": {
    },
    "external_id": "04f14901-0554-402e-96e6-2958ca624871"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-details" raw=data-raw %}

### Mandate failed to initiate (HTTP `422`)
{% capture data-raw %}
```javascript
{
  "object": {
    "input_amount": 0.42,
    "input_currency": "USD",
    "metadata": {
    },
    "state": "approved",
    "sender": {
      "id": "043844c0-614c-4eca-bc40-466b78e5b855",
      // (...)
    },
    "payin_methods": [],
    "paid_amount": 0.0,
    "due_amount": 0.42,
    "recipients": [
      {
        "editable": true,
        "metadata": {
        },
        "state": "initial",
        "transaction_state": "initial",
        "type": "person",
        "retriable": true,
        "payout_method": {
          "type": "ZAR::Bank",
          "details": {
            "first_name": "First",
            "last_name": "Last",
            "bank_code": "632005",
            "bank_account": "12345678",
            "phone_number": "+27119785313",
            "transfer_reason": "personal_account",
            "street": "14 Main Street",
            "postal_code": "AB0001",
            "city": "Cape Town",
            "email": "recipient@email.com",
            "bank_name": "ABSA",
            "app_name": "MTO",
            "app_id": "649d6f5a-421e-48f6-beea-896f180a3e2b",
            "international_phone_number": "+27119785313",
            "nationalized_phone_number": "119785313"
          },
          "metadata": {
          },
          "provider": "bitpesa_auto",
          // (...)
          }
        },
        "exchange_rate": 23.80952380952381,
        "fee_fractional": 0,
        "transaction_external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026",
        "requested_amount": 10.0,
        "requested_currency": "ZAR",
        "input_amount": 0.42,
        "input_currency": "USD",
        "output_amount": 10.0,
        "output_currency": "ZAR"
      }
    ],
    "updated_at": "2024-05-16T13:09:56.848Z",
    "errors": {
      "base": [
        {
          "error": "Mandate signing failed to initiate, please retry"
        }
      ],
      "main_error": [
        {
          "error": "Transaction details are invalid: Mandate signing failed to initiate, please retry"
        }
      ]
    },
    "traits": {
    },
    "external_id": "04f14901-0554-402e-96e6-2958ca624871"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
  **Warning:** Getting a successful validate response before instructing a transaction might be a requirement depending on your configurations in AZA.
</div>
