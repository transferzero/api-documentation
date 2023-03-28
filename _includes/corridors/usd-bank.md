{% include corridors/recipient_name.md %}

## USD::Bank

For United States bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_account": "1234567890",
  "bank_account_type": "20", // 10 for Savings, 20 for Checking
  "bank_name": "US Bank",
  "routing_number": "091000022", // ABA routing number (9 digits)
  "swift_code": "USBKUS44IMT",
  "country": "US"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `USD::Bank` payouts are currently in beta phase.
</div>
