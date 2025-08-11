{% include corridors/recipient_name.md %}

## GHS::Bank

All senders trying to create Ghanian bank payouts need to have the following details present:
- `"country" => "US"`

Please note that the field above is generally considered optional for senders for other payment corridors (WTR2 rules apply - kindly refer to the <a href="{{ "/docs/transaction-flow/#wtr2" | prepend: site.baseurl }}" class="link">sender WTR2 rules</a> section for further details). If you wish to use an existing sender who’s currently missing the country field you can provide it alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
      "sender": {
        "external_id": "<id of sender>",
        "country" => "US",
        (...)
      },
      (...)
    }
}
```
{% endcapture %}

For Ghanan bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_code": "030100",
  "bank_account": "123456789",
  "transfer_reason": "third_party_person_account"
  "gender": "M" // options are M or F
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-details" raw=data-raw %}

The current banks supported and their `bank_code` values are:

{% capture data-raw %}
```
ABSA Ghana Bank (formerly Barclays): 030100
Access Bank: 280100
Agricultural Development Bank: 080100
Apex Bank: 070100
Bank of Africa: 210100
Bank of Ghana: 010100
CAL Bank: 140100
Consolidated Bank Ghana: 340100
Ecobank: 130100
Fidelity Bank: 240100
First Atlantic Bank: 170100
First Bank Nigeria: 200100
First National Bank: 330100
GCB Bank: 040100
GHL Bank: 390100
Guaranty Trust Bank: 230100
National Investment Bank: 050100
OmniBSIC: 360100   // SAHEL - Sahara Bank (BSIC) and OmniBank merged to form OmniBSIC
Prudential Bank: 180100
Republic HFC Bank: 110100
Societe Generale Ghana: 090100
Stanbic Bank: 190100
Standard Chartered Bank: 020100
United Bank for Africa: 060100
Universal Merchant Bank: 100100
Zenith Bank: 120100
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-options" raw=data-raw %}

The codes above are the GHIPSS bank codes. If you have GHIPSS branch codes or sort codes you can obtain the bank code by adding `"100"` to the first three digits of the branch/sort code.

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

{% include corridors/transfer_reasons.md %}
