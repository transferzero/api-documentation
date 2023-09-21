{% include corridors/recipient_name.md %}

## EGP::Bank

For Egyptian bank payments please use:

{% capture data-raw %}
```javascript
 "details": {
  {{ recipient_name }},
  "street": "1 Main Street",
  "phone_number": "+201023456789",
  "bank_code": "0030",
  "bank_account": "1234567890",
  "transfer_reason": "personal_account",
}
```
{% endcapture %}

{% include language-tabbar.html prefix=egp-bank-details  raw=data-raw %}

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

{% include language-tabbar.html prefix=egp-bank-options  raw=data-raw %}

{% include corridors/transfer_reasons.md %}

Senders trying to create Egyptian bank payouts need to have the following details present:
- `"identification_type" => "ID"` - Values: `"PP"`: Passport, `"ID"`: National ID, `'DL'`: Driver's License, `"OT"`: Other
- `"identification_number" => "AB12345678"`
- `"street" => "1, Main Street"`
- `"birth_date" => "1983-01-01`

Please note that the fields above are generally considered optional for senders for other payment corridors. If you wish to use an existing sender who has some of these fields missing you can provide them alongside the `id` or `external_id` field in the sender details. For example:

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

{% include language-tabbar.html prefix="egp-bank-sender-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `EGP::Bank` payouts are currently in beta phase.
</div>
