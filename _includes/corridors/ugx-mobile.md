{% include corridors/recipient_name.md %}

## UGX::Mobile

For Ugandan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "phone_number": "+256772123456", // E.164 international format
  "mobile_provider": "airtel"
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

<div class="alert alert-info" markdown="1">
**Note!** The provider might check the name against the registered holder of the mobile number and block transactions if they don't match.
</div>
