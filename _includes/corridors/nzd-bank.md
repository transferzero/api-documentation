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
AMP
ANZ Bank
ASB Bank
Bank Of Baroda
Bank Of China (New Zealand) Limited (BOC)
Bank Of India
Bank of New Zealand
China Construction Bank (New Zealand) Limited
China Construction Bank Corporation (CCB)
Citibank
Commonwealth Bank Of Australia
Cooperatieve Rabobank UA
Fonterra Co-Operative Group Limited
Heartland Bank
HSBC
ICBC (New Zealand) Limited
Industrial and Commercial Bank of China
JPMorgan Chase Bank
Kiwibank
Kookmin Bank
MUFG Bank Ltd
NBS (Nelson Building Society)
Rabobank New Zealand Limited
SBS Bank (Southland Building Society)
The Cooperative Bank
TSB Bank
Westpac Banking Corporation
Westpac New Zealand Limited (WNZL)

```
{% endcapture %}

{% include language-tabbar.html prefix="nzd-bank-options" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `NZD::Bank` payouts are currently in beta phase.
</div>