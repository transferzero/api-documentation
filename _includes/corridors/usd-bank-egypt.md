{% include corridors/recipient_name.md %}

## USD::Bank

For USD bank payments in Egypt please use:

{% capture data-raw %}
```javascript
 "details": {
  {{ recipient_name }},
  "street": "1 Main Street",
  "phone_number": "+201023456789", // optional, must be EG number
  "iban": "EG380019000500000000263180002",
  "transfer_reason": "personal_account",
  "country": "EG"
}
```
{% endcapture %}

{% include language-tabbar.html prefix=usd-bank-egypt-details  raw=data-raw %}

{% if include.recipient_type == 'individual' %}
Although the `middle_name` field is optional, having the full name (first, middle and last name as stated on the government issued ID) of the beneficiary is a regulatory requirement and will ensure faster settlement due to less regulatory screening time.
{% endif %}

The currently supported banks and their bank codes are:

{% capture data-raw %}
```
ABU DHABI COMMERCIAL BANK EGYPT: 0027
ABU DHABI ISLAMIC BANK: 0030
AHLY UNITED BANK: 0020
AL AHLI BANK OF KUWAIT - EGYPT S.A.E: 0018
AL BARAKA BANK EGYPT: 0022
ARAB AFRICAN INTERNATIONAL BANK: 0057
ARAB BANK: 0044
ARAB BANKING CORPORATION: 0040
ARAB INVESTMENT BANK: 0058
ARAB INTERNATIONAL BANK: 0056
ATTIJARIWAFA BANK - EGYPT S.A.E: 0034
BANK OF ALEXANDRIA: 0005
BANQUE DU CAIRE: 0004
BANQUE MISR: 0002
BLOM BANK EGYPT: 0013
CITIBANK: 0043
COMMERCIAL INTERNATIONAL BANK: 0010
CREDIT AGRICOLE EGYPT: 0036
EGYPT POST: 9002
EGYPTIAN ARAB LAND BANK: 0007
EGYPTIAN GULF BANK: 0029
EMIRATES NATIONAL BANK OF DUBAI: 0014
EXPORT DEVELOPMENT BANK OF EGYPT: 0061
FAISAL ISLAMIC BANK OF EGYPT: 0059
FIRST ABU DHABI BANK (formerly NATIONAL BANK OF ABU DHABI): 0019
HOUSING AND DEVELOPMENT BANK: 0038
HSBC: 0025
INDUSTRIAL DEVELOPMENT BANK OF EGYPT: 0008
MASHREQ BANK: 0046
MISR IRAN DEVELOPMENT BANK: 0033
NATIONAL BANK OF EGYPT: 0003
NATIONAL BANK OF GREECE: 0048
NATIONAL BANK OF KUWAIT-EGYPT: 0023
PRINCIPAL BANK FOR DEVELOPMENT AND AGRI.: 0009
QATAR NATIONAL BANK ALAHLI: 0037
SOCIETE ARABE INTER. DE BANQUE: 0035
SUEZ CANAL BANK: 0017
UNITED BANK: 0031
```
{% endcapture %}

{% include language-tabbar.html prefix=usd-bank-egypt-options  raw=data-raw %}

{% include corridors/transfer_reasons.md %}

{% if include.recipient_type == 'individual' %}
  <div class="alert alert-info" markdown="1">
  **Note:** Both Individual and Business senders (C2C, B2C) can be used for USD bank payouts in Egypt.
  </div>

  **Individual Senders** trying to create USD bank payouts in Egypt need to have the following details present:
  - `"identification_type" => "ID"`
  - `"identification_number" => "AB12345678"`
  - `"street" => "1, Main Street"`
  - `"birth_date" => "1983-01-01"`

  {% include corridors/identification_types.md %}

  {% include language-tabbar.html prefix="usd-bank-egypt-identification-types" raw=data-raw %}

  **Business Senders** trying to create USD bank payouts in Egypt need to have the following details present:
  - `"registration_number" => "AB12345678"`
  - `"registration_date" => "2020-01-01"`
  - `"street" => "1, Main Street"`

{% else %}
  <div class="alert alert-info" markdown="1">
  **Note:** Only Individual senders (C2B) can be used for USD bank payouts in Egypt. Support for business senders (B2B) is coming soon!
  </div>

  **Individual Senders** trying to create USD bank payouts in Egypt need to have the following details present:
  - `"identification_type" => "ID"`
  - `"identification_number" => "AB12345678"`
  - `"street" => "1, Main Street"`
  - `"birth_date" => "1983-01-01"`

  {% include corridors/identification_types.md %}

  {% include language-tabbar.html prefix="usd-bank-egypt-identification-types" raw=data-raw %}
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

  {% include language-tabbar.html prefix="usd-bank-egypt-sender-details" raw=data-raw %}

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

{% include language-tabbar.html prefix="usd-bank-egypt-sender-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `USD::Bank` payouts in Egypt are currently in beta phase.
</div>
