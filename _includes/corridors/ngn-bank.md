{% include corridors/recipient_name.md %}

## NGN::Bank

For Nigerian bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_code": "058", 
  "bank_account": "123456789"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-details" raw=data-raw %}

The valid `bank_code` values are:

{% capture data-raw %}
```
Access Bank: 044
Carbon / One Finance: 565
Citi Bank Group: 023
EcoBank: 050
Fairmoney Microfinance Bank LTD: E30
FCMB Bank: 214
Fidelity Bank: 070
First Bank of Nigeria: 011
Globus Bank Limited: 103
Go Money: 326
Guaranty Trust Bank : 058
Heritage Bank: 030
Hope PSBank: C12
Jaiz Bank: 301
Keystone: 082
Kuda Microfinance Bank: 611
Lotus Bank Limited: 303
Moneymaster Payment Service Bank Limited: D86
Moniepoint Microfinance Bank: 993
Opay: 305
Palmpay: B54
Parallex Bank Limited: 104
Polaris Bank: 076
Providus Bank: 101
Stanbic IBTC Bank: 039
Standard Chartered Bank PLC: 068
Sterling bank: 232
Suntrust Bank: 100
Taj Bank Limited, 76: 302
Titan Trust Bank Limited: 102
Union Bank: 032
United Bank for Africa: 033
Unity Bank: 215
VFD Microfinance Bank: 566
Wema Bank: 035
Zenith International: 057
```
{% endcapture %}

{% include language-tabbar.html prefix="ngn-bank-details" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note!** Diamond Bank was merged with Access Bank in 2019. For Diamond Bank recipients please use Access Bank as the bank code
</div>
