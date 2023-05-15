## GNF::Mobile

For mobile payouts to Guinea, please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "mtn", // lowercase, see provider values below
  "phone_number": "+224612345678" // E.164 international format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="gnf-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Guinea are:

{% capture data-raw %}
```
orange
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="gnf-mobile-providers" raw=data-raw %}
