{% include corridors/recipient_name.md %}

## GHS::Bank

For Ghanan bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_code": "030100",
  "bank_account": "123456789"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-details" raw=data-raw %}

The current banks supported and their `bank_codes` values are:

{% capture data-raw %}
```
ABSA Ghana Bank (formerly Barclays): 030100
Access Bank: 280100
Agricultural Development Bank: 080100
Bank of Africa: 210100
CAL Bank: 140100
Ecobank: 130100
Fidelity Bank: 240100
First Atlantic Bank: 170100
First Bank Nigeria: 200100
First National Bank: 330100
GCB Bank: 040100
Guaranty Trust Bank: 230100
Heritage Bank: 370100
National Investment Bank: 050100
Prudential Bank: 180100
Republic HFC Bank: 110100
Stanbic Bank: 190100
Standard Chartered Bank: 020100
United Bank for Africa: 060100
Zenith Bank: 120100
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-options" raw=data-raw %}

Please note that there is no standard format across banks for account numbers in this corridor. If you wish to check for correctness you can see the following list:

{% capture data-raw %}
```
ABSA Ghana Bank (formerly Barclays): 10 or 13 digits
Access Bank: 13 digits
Agricultural Development Bank: 16 digits
Bank of Africa: 11 digits
CAL Bank: 13 digits
Ecobank: 13 or 16 digits
Fidelity Bank: 13 digits
First Atlantic Bank: 13 digits
First Bank Nigeria: 13 digits
First National Bank: 11 digits
GCB Bank: 13 digits
Guaranty Trust Bank: 13 digits
Heritage Bank: 13 digits
National Investment Bank: 13 digits
Prudential Bank: 13 digits
Republic HFC Bank: 13 digits
Stanbic Bank: 13 digits
Standard Chartered Bank: 13 digits
United Bank for Africa: 13 or 14 digits
Zenith Bank: 10 digits
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-digits" raw=data-raw %}
