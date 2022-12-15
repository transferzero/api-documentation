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

# Gabon
RECUEIL CERBER REVISE: 19001
Banque Internationale pour le Commerce et l'Industrie du Gabon: 40001
Union Gabonaise de Banque: 40002
BGFIBANK S.A. Gabon: 40003
Banque Gabonaise de Développement: 40004
Citibank Gabon SA: 40005
Société Gabonaise de Crédit Automobile: 40013
Société Gabonaise de Crédit Bail: 40014
Financiere Transafricaine: 40015
BICI-Bail: 40017
BGFI-Bail: 40018
Societe Nationale d'Investissement du Gabon: 40019
Orabank Gabon: 40021
BGFI-Participations: 40022
Banque de l'Habitat du Gabon: 40023
ECOBANK Gabon: 40024
United Bank for Africa - Gabon: 40025
PosteBank Gabon S.A.: 40026
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-bank-options" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

<div class="alert alert-info" markdown="1">
**Note** `XAF::Bank` payouts are currently in beta phase.
</div>
