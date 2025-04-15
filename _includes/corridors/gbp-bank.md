{% include corridors/recipient_name.md %}

## GBP::Bank

For GBP::Bank there are two payout options available:

1. GBP Payments with account number and sort code
2. GBP IBAN transfers

For GBP Payments with account number and sort code please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_account": "12345678",
  "sort_code": "123456",
  "bank_name": "Lloyds Bank", // Optional
  "narration": "Birthday Gift" // Payment reference (max 30 characters) - Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="gbp-bank-details" raw=data-raw %}

For GBP IBAN transfers please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "iban": "GB29LOYD60161331926819",
  "bic": "LOYDGB2L", // Optional
  "bank_name": "Lloyds Bank", // Optional
  "narration": "Birthday Gift" // Payment reference (max 30 characters) - Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="gbp-bank-iban-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning!** If the recipient account is not an `GBP` account then the recipient's bank might charge for converting the received funds from `GBP` to the local currency.
</div>

<div class="alert alert-info" markdown="1">
**Note!**

* The customer needs to enter either an IBAN (and an optional BIC), or an account number and sort code.
* Transfer is done using the fastest method available on the recipient's bank.
* If the recipient's bank is in the UK, and supports the Faster Payment network funds will arrive within 2 hours (but usually within a couple minutes)
* If the recipient's bank supports the SEPA system, funds will arrive within 1-2 business days
* If the recipient's bank only supports the Swift system, funds will arrive within 2-5 business days
</div>
