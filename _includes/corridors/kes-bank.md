{% include corridors/recipient_name.md %}

## KES::Bank

For Kenyan bank payments please use:

{% capture data-raw %}
```javascript
 "details": {
  {{ recipient_name }},
  "street": "1 Main Street",
  "city": "Nairobi", // optional
  "bank_code": "68",
  "bank_account": "1234567890",
  {% if include.recipient_type == 'individual' -%}
  "identity_card_type": "ID", // optional, refers to the recipient's ID details; Values: "PP": Passport, "ID": National ID, "DL": Driver's License or "OT": Other
  "identity_card_id": "12345678", // optional, refers to the recipient's ID details
  "transfer_reason": "third_party_person_account", // optional
  {% endif -%}
  "relationship_to_sender": "Aunt" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix= kes-bank-details  raw=data-raw %}

The currently supported banks and their bank codes are:

{% capture data-raw %}
```
Absa Bank: 03
African Banking Corporation: 35
Bank of Africa Kenya: 19
Bank of Baroda: 06
Citibank: 16
Co-operative Bank of Kenya: 11
Consolidated Bank of Kenya: 23
Credit Bank Ltd: 25
Diamond Trust Bank: 63
DIB Bank: 75
ECO Bank Kenya: 43
Equity Bank Limited: 68
Family Bank: 70
First Community Bank: 74
Guaranty Trust Bank Kenya: 53
Guardian Bank: 55
Gulf African Bank : 72
Housing Finance Co. Kenya: 61
I&M Bank: 57
Kingdom Bank: 51
Kenya Commercial Bank: 01
KWFT Bank: 78
Mayfair Bank: 65
M-Oriental Commercial Bank Limited: 14
Middle East Bank: 18
National Bank of Kenya: 12
NCBA Bank: 07
Paramount Universal Bank Limited: 50
Prime Bank: 10
Sidian Bank: 66
Stanbic Bank Kenya: 31
Standard Chartered Bank: 02
UBA Kenya Bank Ltd: 76
Victoria Bank Limited: 54
```
{% endcapture %}

{% include language-tabbar.html prefix= kes-bank-options  raw=data-raw %}

{% include corridors/transfer_reasons.md %}

All senders trying to create Kenyan bank payouts need to have the following details present:
- `"identification_type" => "ID"` - Values: `"PP"`: Passport, `"ID"`: National ID, `'DL'`: Driver's License, `"OT"`: Other
- `"identification_number" => "AB12345678"`
- `"source_of_funds" => "Salary"`
- `"country" => "US"`
- `"birth_date" => "1993-07-23`

Please note that the fields above are generally considered optional for senders for other payment corridors. If you wish to use an existing sender who has some of these fields missing you can provide them alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
      "sender": {
        "external_id": "<id of sender>",
        "identification_type": "ID",
        "identification_number": "AB12345678",
        "source_of_funds": "Salary",
        "country" => "US",
        "birth_date" => "1993-07-23",
        (...)
      },
      (...)
    }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="kes-bank-sender-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `KES::Bank` payouts are currently in beta phase.
</div>
