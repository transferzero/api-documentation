## KES::Mobile

For Kenyan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "street": "1 Linford Street",
  "city": "Nairobi", // optional
  "phone_number": "+254123456789", // E.164 international format
  "identity_card_type": "ID", // refers to the recipient's ID details; Values: "PP": Passport, "ID": National ID or "O": Other
  "identity_card_id": 'AB12345678', // refers to the recipient's ID details
  "transfer_reason": "personal_account",
  "mobile_provider": "mpesa",
  "relationship_to_sender": "Aunt" // Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="kes-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Kenya are:

{% capture data-raw %}
```
mpesa
```
{% endcapture %}

{% include language-tabbar.html prefix="kes-mobile-providers" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

All senders trying to create Kenyan mobile payouts need to have the following details present:
- `"identification_type" => "ID"` - Values: `"PP"`: Passport, `"ID"`: National ID, `'DL'`: Driver's License, `"OT"`: Other
- `"identification_number" => "AB12345678"`
- `"source_of_funds" => "Salary"`
- `"street" => "Avenue Park"`
- `"city" => "Nairobi"`
- `"country" => "KE"`
- `"birth_date" => "1993-07-23"`

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
        "street" => "Avenue Park",
        "city" => "Nairobi",
        "country" => "KE",
        "birth_date" => "1993-07-23",
        (...)
      },
      (...)
    }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="kes-mobile-sender-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `KES::Mobile` payouts are currently in beta phase.
</div>

<div class="alert alert-info" markdown="1">
**Note!** The provider might check the name against the registered holder of the mobile number and block transactions if they don't match.
</div>
