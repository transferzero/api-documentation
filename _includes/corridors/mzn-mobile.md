## MZN::Mobile

For Mozambican mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "+258123456789", // E.164 international format
  "mobile_provider": "mpesa",
  "transfer_reason": "personal_account"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="mzn-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Mozambique are:

{% capture data-raw %}
```
mpesa
emola
mkesh
```
{% endcapture %}

{% include language-tabbar.html prefix="mzn-mobile-providers" raw=data-raw %}

{% include corridors/transfer_reasons.md %}
