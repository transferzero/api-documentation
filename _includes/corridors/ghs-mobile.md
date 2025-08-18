## GHS::Mobile

For Ghanan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "+233302123456" // E.164 international format
  "mobile_provider": "vodafone",
  "transfer_reason": "third_party_person_account",
  "gender": "M" // options are M or F
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-mobile-details" raw=data-raw %}

The available `mobile_providers` are:

{% capture data-raw %}
```
airteltigo
mtn
vodafone
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-mobile-providers" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

<div class="alert alert-info" markdown="1">
**Note:** Kindly be informed that Airtel has merged with Millicom's Tigo in Ghana to become AirtelTigo
</div>
