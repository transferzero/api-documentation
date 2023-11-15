{% include corridors/recipient_name.md %}

## USD::Bank

For USD bank payments in Nigeria please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "phone_number": "+2347087661234", // optional - E.164 international format
  "bank_code": "057",
  "bank_account": "1234567890",
  "country": "NG"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-details" raw=data-raw %}

The valid `bank_code` values are:

{% capture data-raw %}
```
Access Bank: 044
FCMB Bank: 214
Fidelity Bank: 070
Union Bank: 032
United Bank for Africa: 033
Zenith International: 057
Polaris Bank: 076
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-details" raw=data-raw %}

The valid `country` values are:

{% capture data-raw %}
```
NG
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-countries" raw=data-raw %}

{% if include.recipient_type == 'individual' %}
All individual senders trying to create Nigerian USD bank or cash payouts need to have the following details present:

- `"birth_date" => "1993-07-23"`
{% endif %}

<div class="alert alert-warning" markdown="1">
**Warning** `USD::Bank` payouts in Nigeria are currently in beta phase.
</div>

