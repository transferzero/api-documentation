## XOF::Mobile

For mobile payouts to countries in the WAEMU region please use :

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
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Mali are:

{% capture data-raw %}
```
orange
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Senegal are:

{% capture data-raw %}
```
expresso
orange
free
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

{% include corridors/transfer_reasons.md %}

<div class="alert alert-info" markdown="1">
**Note** Amounts for `XOF::Mobile` payouts to **Ivory Coast 'Orange'** mobile numbers should be multiples of 5.
</div>

<div class="alert alert-warning" markdown="1">
**Warning** `XOF::Mobile` payouts to **Ivory Coast** are currently in beta phase.
</div>
