{% include corridors/recipient_name.md %}

## EUR::Bank

For EUR IBAN transfers please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "iban": "DE89370400440532013000",
  "bic": "DEUTDEBBXXX", // Optional
  "bank_name": "Deutsche Bank", // Optional
  "narration": "Birthday Gift" // Payment reference (max 30 characters) - Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="eur-bank-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning!** If the recipient account is not an `EUR` account then the recipient's bank might charge for converting the received funds from `EUR` to the local currency.
</div>

<div class="alert alert-info" markdown="1">
**Note!** Transfer is done using the fastest method available on the recipient's bank.

* If the recipient's bank supports the Instant Payment network funds will arrive within 2 hours (but usually within a couple minutes)
* If the recipient's bank supports the SEPA system, funds will arrive within 1-2 business days
* If the recipient's bank only supports the Swift system, funds will arrive within 2-5 business days
</div>
