{% include corridors/recipient_name.md %}

## NGN::Bank

For Nigerian bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_code": "058",
  "bank_account": "123456789",
  "street": "1 Main Street"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-details" raw=data-raw %}

The valid `bank_code` values are:

{% capture data-raw %}
```
9 Payment Service Bank Limited: B97
AB Microfinance Bank: B16
Access Bank: 044
Accion Microfinance Bank: 602
Carbon / One Finance: 565
Citi Bank Group: 023
EcoBank: 050
Enterprise bank: 084
Fairmoney Microfinance Bank LTD: E30
FCMB Bank: 214
Fidelity Bank: 070
Fina Trust Microfinance Bank: 608
First Bank of Nigeria: 011
Globus Bank Limited: 103
Go Money: 326
Guaranty Trust Bank : 058
Hope PSBank: C12
Jaiz Bank: 301
Keystone: 082
Kuda Microfinance Bank: 611
Lapo Microfinance Bank: B23
Lotus Bank Limited: 303
Lovonus Microfinance Bank: B18
Moneymaster Payment Service Bank Limited: D86
Moniepoint Microfinance Bank: 993
Mutual Trust Microfinance Bank: A56
Opay: 305
Optimus bank: 105
Palmpay: B54
Parallex Bank Limited: 104
Polaris Bank: 076
Premium trust bank: 107
Prospa Capital Microfinance Bank: D50 (formerly known as GOODNEWS MFB)
Providus Bank: 101
Sparkle Microfinance Bank: B57
Stanbic IBTC Bank: 039
Standard Chartered Bank PLC: 068
Sterling bank: 232
Suntrust Bank: 100
Taj Bank Limited: 302
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

All senders trying to create Nigerian bank payouts need to have the `street` field present:
- `"street" => "1 Main Street"`

Please note that the field above is generally considered optional for senders for other payment corridors (WTR2 rules apply - kindly refer to the [sender WTR2 rules]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#wtr2) section for further details). If you wish to use an existing sender who's currently missing the `street` field you can provide it alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
    "sender": {
      "external_id": "<id of sender>",
      "street": "1 Main Street",
      (...)
    },
    (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ngn-bank-sender-details" raw=data-raw %}
