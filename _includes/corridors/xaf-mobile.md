## XAF::Mobile

For mobile payouts to countries in the CEMAC region, please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "orange", // lowercase, see provider values below
  "phone_number": "+237674044436", // E.164 international format
  "country": "CM"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-details" raw=data-raw %}

The available `country`s are:

{% capture data-raw %}
```
CF: Central African Republic
CG: Congo
CM: Cameroon
GA: Gabon
TD: Chad
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for the Central African Republic are:

{% capture data-raw %}
```
orange
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Chad are:

{% capture data-raw %}
```
moov
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Cameroon are:

{% capture data-raw %}
```
orange
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Congo are:

{% capture data-raw %}
```
airtel
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Gabon are:

{% capture data-raw %}
```
airtel
moov
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-providers" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `XAF::Mobile` payouts to **Central African Republic, Chad, Congo and Gabon** are currently in Beta phase.
</div>
