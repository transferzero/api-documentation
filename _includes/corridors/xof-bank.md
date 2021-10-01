{% include corridors/recipient_name.md %}

## XOF::Bank

For West African bank payments in selected countries please use the following:

{% capture data-raw %}
```javascript
"details" : {
  {{ recipient_name }},
  "iban": "BJ0610100100144390000769", // BBAN format: AA123 12345 123456789012 12
  "bank_name": "Bank Of Africa Bénin" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bank-details" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note** `XOF::Bank` payouts are currently in beta phase.
</div>
