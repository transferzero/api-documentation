{% include corridors/recipient_name.md %}

## XAF::Bank

For bank payments in Central Africa please use:

{% capture data-raw %}
```javascript
"details" : {
  {{ recipient_name }},
  "iban": "CM2110033052090901100045910", // IBAN format: CM21 10033 05209 0901 1000459 10
  "transfer_reason": "personal_account"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-bank-details" raw=data-raw %}

The current banks supported and their `bank_code` values are:

{% capture data-raw %}
```
# Cameroon
Banque Internationale du Cameroun pour l'Epargne et le Crédit: 10001
Societe Commerciale de Banque - Cameroun: 10002
Société Générale de Banques au Cameroun: 10003
Standard Chartered Bank Cameroon: 10004
Afriland First Bank: 10005
Amity Bank Cameroon Plc.: 10006
Citibank Cameroon SA: 10007
Commercial Bank - Cameroun: 10008
Crédit Foncier du Cameroun: 10019
Société Camerounaise d'Equipement: 10020
Société Camerounaise de Crédit Automobile: 10021
Société Camerounaise de Crédit Bail: 10022
Union Bank of Cameroon Plc.: 10023
National Financial Credit Bank: 10025
Fonds de Garantie des Petites et Moyennes Entreprises: 10026
Société de Recouvrement des Créances du Cameroun: 10027
Société Nationale d'Investissement: 10028
Ecobank Cameroun: 10029
PRO-PME Financement: 10030
Africa Leasing Company: 10031
Société Financière Africaine: 10032
United Bank for Africa - Cameroon: 10033
Banque Atlantique Cameroun: 10034
BGFIBANK Cameroun SA: 10035
Banque Camerounaise des Petites et Moyennes Entreprises: 10036
WAFACASH CENTRAL AFRICA: 10037
CREDIT COMMUNAUTAIRE D'AFRIQUE BANK: 10039
BANGE BANK CAMEROUN: 10040
Crédit du Sahel: 16010
Fonds Provinciale de Refinancement: 16012
Crédit pour l'Agriculture l'Industrie et le Commerce: 30004
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-bank-options" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

<div class="alert alert-info" markdown="1">
**Note** `XAF::Bank` payouts are currently in beta phase.
</div>
