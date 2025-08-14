## XOF::Mobile

For mobile payouts to countries in the WAEMU region please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "orange", // lowercase, see provider values below
  "phone_number": "+221774044436", // mobile number in E.164 international format
  "country": "SN"
  "transfer_reason": "personal_account" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-details" raw=data-raw %}

The available `country`s are:

{% capture data-raw %}
```
BJ: Benin
BF: Burkina Faso
CI: Ivory Coast
SN: Senegal
TG: Togo
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Benin are:

{% capture data-raw %}
```
mtn
moov
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Burkina Faso are:

{% capture data-raw %}
```
orange
moov
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Ivory Coast are:

{% capture data-raw %}
```
moov
mtn
orange
wave
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Senegal are:

{% capture data-raw %}
```
expresso
orange
free
wave
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Togo are:

{% capture data-raw %}
```
moov
tmoney
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

All senders trying to create XOF::mobile Togo payouts need to have the `phone_number` field present:
- `"phone_number" => "+15555551234"`

Please note that the field above is generally considered optional for senders for other payment corridors (WTR2 rules apply - kindly refer to the [sender WTR2 rules]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#wtr2) section for further details). If you wish to use an existing sender who's currently missing the `phone_number` field you can provide it alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
    "sender": {
      "external_id": "<id of sender>",
      "phone_number": "+15555551234",
      (...)
    },
    (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-sender-details" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

<div class="alert alert-info" markdown="1">
**Note** Amounts for `XOF::Mobile` payouts to **Ivory Coast 'Orange'** mobile numbers should be multiples of 5.
</div>

<div class="alert alert-warning" markdown="1">
**Warning** `XOF::Mobile` payouts to **Ivory Coast** are currently in beta phase.
</div>
