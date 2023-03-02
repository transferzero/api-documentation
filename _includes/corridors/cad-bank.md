{% include corridors/recipient_name.md %}

## CAD::Bank

For Canadian bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_account": "123456789",
  "bank_code": "003",
  "branch_code": "01372" // Branch Transit Number (5 digits)
}
```
{% endcapture %}

{% include language-tabbar.html prefix="cad-bank-details" raw=data-raw %}

The current banks and their associated bank codes supported are:

{% capture data-raw %}
```
Airline Financial Credit Union Limited: 830
Alberta Treasury Branches: 219
All Trans Financial Services Credit Union Limited: 810
Alliance des caisses populaires de l'Ontario Limitée: 890
Alterna Savings and Credit Union: 842
Amex Bank of Canada: 303
Arnstein Community Credit Union Limited: 808
Atlantic Central: 839
B2B Bank: 618
Bank of America National Association: 241
Bank of Canada: 177
Bank of China (Canada): 308
Bank of Montreal: 001
Bank of Tokyo-Mitsubishi UFJ (Canada): 245
Bank West: 342
Barclay's Bank PLC Canada Branch: 360
BNP Paribas (Canada): 250
BofA Canada Bank: 311
Bridgewater Bank: 347
Canadian Imperial Bank of Commerce: 010
Canadian Tire Bank: 338
Canadian Western Bank: 030
Capital One Bank (Canada Branch): 323
Central 1 Credit Union British Columbia: 809
Central 1 Credit Union Ontario: 828
CIBC Trust Corporation: 548
Citibank Canada: 260
Citibank N.A: 328
Citizens Bank of Canada: 309
Comerica Bank: 330
Communication Technologies Credit Union Limited: 807
Community Trust Company: 507
Concentra Financial Services Association: 853
Credit Union Central Alberta Limited: 899
Credit Union Central of Manitoba Limited: 879
Credit Union Central of Saskatchewan: 889
CS Alterna Bank: 608
CTC Bank of Canada: 315
Deutsche Bank AG: 265
DirectCash Bank: 352
Dundalk District Credit Union Limited: 840
Dundee Bank of Canada: 343
Effort Trust Company: 532
Fifth Third Bank: 345
First Commercial Bank: 332
First Nations Bank of Canada: 310
General Bank of Canada: 344
Goderich Community Credit Union Limited: 844
Golden Horseshoe Credit Union Limited: 854
Habib Canadian Bank: 321
HomEquity Bank: 358
Household Trust Company: 630
HSBC Bank Canada: 016
HSBC Bank USA National Association: 333
HSBC Mortgage Corporation (Canada): 604
ICICI Bank Canada: 340
Industrial Alliance Trust Inc: 625
Industrial and Commercial Bank of China (Canada): 307
Investors Group Trust Co. Ltd: 536
J.P. Morgan Bank Canada: 314
Jameson Bank: 354
JPMorgan Chase Bank National Association: 270
Korea Exchange Bank of Canada: 275
La Caisse Centrale Desjardins Du Québec: 815
La Fédération des caisses populaires Acadiennes Limitée: 865
La Fédération des caisses populaires de l'Ontario Inc: 829
La Fédération des caisses populaires du Manitoba Inc: 819
Latvian Credit Union Limited: 803
Laurentian Bank of Canada: 039
Laurentian Trust of Canada Inc: 522
M&T Bank: 357
Manulife Bank of Canada: 540
Manulife Trust Company: 626
Maple Bank: 336
Mega International Commercial Bank (Canada): 269
Meridian Credit Union: 837
Mizuho Corporate Bank Ltd. Canada Branch: 277
motusbank: 374
MonCana Bank of Canada: 361
Montreal Trust Company of Canada: 550
National Bank of Canada: 006
National Trust Company: 590
Ontario Civil Service Credit Union Limited: 846
Pacific & Western Bank of Canada: 334
Peace Hills Trust Company: 568
Peoples Trust Company: 621
Rabobank Nederland: 322
ResMor Trust Company: 620
Royal Bank Mortgage Corporation: 592
Royal Bank of Canada: 003
Royal Bank of Scotland N.V. (Canada) Branch: 240
Royal Trust Company: 570
Royal Trust Corporation of Canada: 580
Scotia Mortgage Corporation: 606
Shinhan Bank Canada: 355
Société Générale (Canada Branch): 292
Société Générale (Canada Branch) Ontario: 346
State Bank of India (Canada) Alberta: 294
State Street: 327
Sumitomo Mitsui Banking Corporation of Canada: 301
Sun Life Financial Trust Inc: 551
Tangerine Bank: 614
TD Mortgage Corporation: 597
TD Pacific Mortgage Corporation: 603
The Bank of New York Mellon: 242
The Bank of Nova Scotia: 002
The Canada Trust Company: 509
The Equitable Trust Company: 623
The Northern Trust Company Canada Branch: 349
The Toronto-Dominion Bank: 004
U.S. Bank National Association: 318
UBS AG Canada Branch: 339
UBS Bank (Canada): 290
United Overseas Bank Limited: 335
Walmart Canada Bank: 359
```
{% endcapture %}

{% include language-tabbar.html prefix="cad-bank-options" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `CAD::Bank` payouts are currently in beta phase.
</div>