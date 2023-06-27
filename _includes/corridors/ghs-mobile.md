## GHS::Mobile

For Ghanan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "+233302123456" // E.164 international format
  "mobile_provider": "vodafone" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-mobile-details" raw=data-raw %}

Although the `mobile_provider` field is optional, if you send us the proper value we can provide a quicker and faster settlement. The valid values are:

{% capture data-raw %}
```
airteltigo
mtn
vodafone
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-mobile-providers" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note:** Kindly be informed that Airtel has merged with Millicom's Tigo in Ghana to become AirtelTigo
</div>
