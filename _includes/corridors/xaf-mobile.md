## XAF::Mobile

For mobile payouts in the CEMAC Region, please use:

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
CM: Cameroon
GA: Gabon
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Cameroon are:

{% capture data-raw %}
```
orange
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
