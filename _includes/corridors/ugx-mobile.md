{% include corridors/recipient_name.md %}

## UGX::Mobile

For Ugandan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "phone_number": "+256772123456", // E.164 international format
  "mobile_provider": "airtel",
  "transfer_reason": "third_party_person_account"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ugx-mobile-details" raw=data-raw %}

The available `mobile_provider`s are:

{% capture data-raw %}
```
airtel
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="ugx-mobile-providers" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

All senders trying to create Ugandan mobile payouts need to have the following details present:
- `"identification_type" => "ID"` - Values: `"PP"`: Passport, `"ID"`: National ID, `'DL'`: Driver's License, `"OT"`: Other
- `"identification_number" => "AB12345678"`
- `"nationality" => "FR"`
- `"phone_number" => "+15555551234"`
- `"country" => "US"`

Please note that the fields above are generally considered optional for senders for other payment corridors. If you wish to use an existing sender who has some of these fields missing you can provide them alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
    "sender": {
      "external_id": "<id of sender>",
      "identification_type": "ID",
      "identification_number": "AB12345678",
      "nationality" => "FR",
      "phone_number" => "+15555551234",
      "country" => "US",
      (...)
    },
    (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ugx-mobile-sender-details" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note!** The provider might check the name against the registered holder of the mobile number and block transactions if they don't match.
</div>
