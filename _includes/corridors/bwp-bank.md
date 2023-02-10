{% include corridors/recipient_name.md %}

## BWP::Bank

For Botswana bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "bank_account": "12345678912345678",
  "bank_name": "Banc ABC",
  "branch_code": "550067"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="bwp-bank-details" raw=data-raw %}

The current banks supported and their associated branch codes are:

{% capture data-raw %}
```
Banc ABC, Airport Junction, 550567
Banc ABC, Fair ground Branch, 550267
Banc ABC, Game City, 550467
Banc ABC, Head Office/Corporate, 552067
Banc ABC, Insurance Branch, 552267
Banc ABC, Item Processing, 552167
Banc ABC, Maun Branch, 550667
Banc ABC, Selibe Phikwe, 550767
Banc ABC, Francistown, 550367
Banc ABC, Palapye, 550867
Banc ABC, Squaremart, 550167
Bank Gaborone, Airport Junction, 201867
Bank Gaborone, Central Processing Centre, 200567
Bank Gaborone, Game City, 201367
Bank Gaborone, Ghanzi Branch, 201767
Bank Gaborone, Head Office, 200167
Bank Gaborone, Home Loans, 200367
Bank Gaborone, Mall & Molepolole Branches, 200667
Bank Gaborone, Francistown, 201467
Bank Gaborone, Gaborone, 200467
Bank Gaborone, Kang, 201767
Bank Gaborone, Treasury, 200267
Bank Of Botswana, Francistown, 910267
Bank Of Botswana, Gaborone, 910167
Bank of Baroda, Gaborone West, 110367
Bank of Baroda, Main Mall, 110167
Bank of Baroda, Francistown, 110267
Bank of India, Gaborone Branch, 450167
Barclays Bank, Airport Junction, 293467
Barclays Bank, Barclays House, 290267
Barclays Bank, Blue Jacket, 294667
Barclays Bank, Carbo Centre, 290767
Barclays Bank, Gaborone Industrial, 290367
Barclays Bank, Gaborone Mall, 290167
Barclays Bank, Gaborone Savings Branch, 296467
Barclays Bank, Gaborone Station, 293867
Barclays Bank, Galo Prestige, 293767
Barclays Bank, Game City, 293567
Barclays Bank, Head Office, 297867
Barclays Bank, Personal Prestige, 294467
Barclays Bank, Selibe Phikwe Prestige, 294567
Barclays Bank, Selibe Phikwe, 291667
Barclays Bank, Tati Nickel, 294167
Barclays Bank, BOFEX, 290667
Barclays Bank, Bobonong, 292367
Barclays Bank, Botshabelo, 294367
Barclays Bank, Broadhurst, 290467
Barclays Bank, Francistown, 291767
Barclays Bank, Galagwe, 294067
Barclays Bank, Ghanzi, 291167
Barclays Bank, Gumare, 293267
Barclays Bank, Jwaneng, 291067
Barclays Bank, Kanye, 291267
Barclays Bank, Kasane, 292067
Barclays Bank, Letlhakane, 293967
Barclays Bank, Lobatse, 290867
Barclays Bank, Mahalapye, 291367
Barclays Bank, Masunga, 292267
Barclays Bank, Maun, 291967
Barclays Bank, Merafhe/Gemvas, 290567
Barclays Bank, Mochudi, 292467
Barclays Bank, Mogoditshane, 292967
Barclays Bank, Molepolole, 292567
Barclays Bank, Moshupa, 292867
Barclays Bank, Orapa, 290967
Barclays Bank, Palapye, 291567
Barclays Bank, Phakalane, 293667
Barclays Bank, Ramotswa, 292767
Barclays Bank, Serowe, 291467
Barclays Bank, Shakawe, 293367
Barclays Bank, Sowa, 293067
Barclays Bank, Tlokweng, 292667
Barclays Bank, Tsabong, 292167
Barclays Bank, Tutume, 291867
Capital Bank, Gaborone Main Branch, 800267
Capital Bank, Head Office, 800167
Capital Bank, Broadhurst, 800467
Capital Bank, Francistown, 800367
Capital Bank, Mogoditshane, 800567
First National Bank, Airport Junction, 288267
First National Bank, Code Line Clearing, 284367
First National Bank, Electronic Banking, 283767
First National Bank, First Card, 282767
First National Bank, First Funding Motor, 284767
First National Bank, Gaborone Industrial, 281667
First National Bank, Gaborone Main, 281467
First National Bank, Gaborone Mall, 282867
First National Bank, Head Office, 282067
First National Bank, Kgale View, 284567
First National Bank, Private Clients, 285467
First National Bank, Property Division, 281067
First National Bank, Rail Park Mall, 288067
First National Bank, Selebi Phikwe, 285067
First National Bank, Wes Bank, 281567
First National Bank, WesBank Francistown, 283467
First National Bank, WesBank Motor, 283367
First National Bank, West Bank Corporate, 283267
First National Bank, Broadhurst, 281267
First National Bank, Corporate, 282267
First National Bank, Francistown, 281867
First National Bank, Ghanzi, 286067
First National Bank, Jwaneng, 283067
First National Bank, Kanye, 281967
First National Bank, Kasane, 285167
First National Bank, Letlhakane, 285567
First National Bank, Lobatse, 281767
First National Bank, Mahalapye, 282467
First National Bank, Maun, 282367
First National Bank, Molepolole, 285667
First National Bank, Palapye, 283167
First National Bank, RMB, 287867
First National Bank, Rverwalk, 285267
First National Bank, Serowe, 285367
First National Bank, Treasury, 282167
Stanbic Bank, CBD Square, 065167
Stanbic Bank, CPS Credit Card, 065667
Stanbic Bank, Credit card, 065567
Stanbic Bank, Fair grounds, 064967
Stanbic Bank, Gaborone Industrial, 061967
Stanbic Bank, Gaborone West, 060167
Stanbic Bank, Head Office, 060467
Stanbic Bank, Selebi Phikwe, 065767
Stanbic Bank, Work Place Banking, 065867
Stanbic Bank, Broadhurst, 060367
Stanbic Bank, Francistown, 064067
Stanbic Bank, Kgale, 060267
Stanbic Bank, Maun, 064767
Stanbic Bank, Mogoditshane, 065367
Stanbic Bank, Molepolole, 065467
Stanbic Bank, Palapye, 065067
Stanbic Bank, VAF, 060567
Standard Chartered Bank, Airport Junction, 662567
Standard Chartered Bank, Francistown Nzamo, 662667
Standard Chartered Bank, Gaborone Industrial, 662367
Standard Chartered Bank, Gaborone Mall, 662167
Standard Chartered Bank, Gaborone Standard House, 662267
Standard Chartered Bank, Game City/Gaborone West, 662867
Standard Chartered Bank, Head Office, 660167
Standard Chartered Bank, Hemamo Centre, 662767
Standard Chartered Bank, Selibe Phikwe, 661667
Standard Chartered Bank, Broadhurst, 662467
Standard Chartered Bank, Francistown, 661767
Standard Chartered Bank, Jwaneng, 660967
Standard Chartered Bank, Lobatse, 660867
Standard Chartered Bank, Mahalapye, 661367
Standard Chartered Bank, Maun, 661967
Standard Chartered Bank, Orapa, 661867
Standard Chartered Bank, Palapye, 661567
Standard Chartered Bank, Serowe, 661467
State Bank of India, CBD Gaborone, 500167
```
{% endcapture %}

{% include language-tabbar.html prefix="bwp-bank-options" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `BWP::Bank` payouts are currently in beta phase.
</div>