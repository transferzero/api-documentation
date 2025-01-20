## EGP::Cash

For Egyptian cash payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "middle_name": "Middle",
  "last_name": "Last",
  "phone_number": "+201023456789", // must be EG number
  "street": "1 Main Street",
  "transfer_reason": "personal_account",
  "email": "recipient@email.com" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix=egp-cash-details  raw=data-raw %}

{% include corridors/transfer_reasons.md %}

{% if include.recipient_type == 'individual' %}
  <div class="alert alert-info" markdown="1">
  **Note:** Both Individual and Business senders (C2C, B2C) can be used for Egyptian cash payouts.
  </div>

  **Individual Senders** trying to create Egyptian cash payouts need to have the following details present:
  - `"identification_type" => "ID"`
  - `"identification_number" => "AB12345678"`
  - `"street" => "1, Main Street"`
  - `"birth_date" => "1983-01-01"`

  {% include corridors/identification_types.md %}

  {% include language-tabbar.html prefix="egp-cash-identification-types" raw=data-raw %}

  **Business Senders** trying to create Egyptian cash payouts need to have the following details present:
  - `"registration_number" => "AB12345678"`
  - `"registration_date" => "2020-01-01"`
  - `"street" => "1, Main Street"`

{% else %}
  <div class="alert alert-info" markdown="1">
  **Note:** Only Individual senders (C2B) can be used for Egyptian cash payouts. Support for business senders (B2B) is coming soon!
  </div>

  **Individual Senders** trying to create Egyptian cash payouts need to have the following details present:
  - `"identification_type" => "ID"`
  - `"identification_number" => "AB12345678"`
  - `"street" => "1, Main Street"`
  - `"birth_date" => "1983-01-01"`

  {% include corridors/identification_types.md %}

  {% include language-tabbar.html prefix="egp-cash-identification-types" raw=data-raw %}
{% endif %}

Please note that the fields above are generally considered optional for senders for other payment corridors. If you wish to use an existing sender who has some of these fields missing you can provide them alongside the `id` or `external_id` field in the sender details. For example:

{% if include.recipient_type == 'individual' %}
  **For Individual Senders:**
  {% capture data-raw %}
  ```javascript
  {
    "transaction": {
      "sender": {
        "external_id": "<id of sender>",
        "identification_type": "ID",
        "identification_number": "AB12345678",
        "street" => "1, Main Street",
        "birth_date" => "1983-01-01",
        (...)
      },
      (...)
    }
  }
  ```
  {% endcapture %}

  {% include language-tabbar.html prefix="egp-cash-sender-details" raw=data-raw %}

  **For Business Senders:**
  {% capture data-raw %}
  ```javascript
  {
    "transaction": {
      "sender": {
        "external_id": "<id of sender>",
        "registration_number": "AB12345678",
        "registration_date": "2020-01-01",
        "street" => "1, Main Street",
        (...)
      },
      (...)
    }
  }
  ```
  {% endcapture %}
{% else %}
  {% capture data-raw %}
  ```javascript
  {
    "transaction": {
      "sender": {
        "external_id": "<id of sender>",
        "identification_type": "ID",
        "identification_number": "AB12345678",
        "phone_number" => "+201023456789",
        "email" => "test.sender@email.com",
        "street" => "1, Main Street",
        "birth_date" => "1983-01-01",
        (...)
      },
      (...)
    }
  }
  ```
  {% endcapture %}
{% endif %}

{% include language-tabbar.html prefix="egp-cash-sender-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `EGP::Cash` payouts are currently in beta phase.
</div>
