{% include corridors/recipient_name.md %}

## NZD::Bank

For New Zealand bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_account": "1212341234567123",
  "bank_name": "ASB Bank"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="nzd-bank-details" raw=data-raw %}

The current banks supported are:

{% capture data-raw %}
```
ANZ Bank
ASB Bank
Bank of New Zealand
Citibank
HSBC
Industrial and Commercial Bank of China
Kiwibank
TSB Bank
Westpac
```
{% endcapture %}

{% include language-tabbar.html prefix="nzd-bank-options" raw=data-raw %}