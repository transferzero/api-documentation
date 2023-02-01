{% include corridors/recipient_name.md %}

## XOF::Bank

For West African bank payments in selected countries please use the following:

{% capture data-raw %}
```javascript
"details" : {
  {{ recipient_name }},
  "iban": "BJ0610100100144390000769", // BBAN format: AA123 12345 123456789012 12
  "transfer_reason": "personal_account"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bank-details" raw=data-raw %}

The current banks supported and their `bank_code` values are:

{% capture data-raw %}
```
# Burkina Faso
United Bank for Africa Burkina: BF022
Banque Internationale pour le Commerce, l'Industrie et l'Agriculture du Burkina: BF023
Banque Commerciale du Burkina: BF056
Société Générale Burkina Faso: BF074
Ecobank Burkina Faso: BF083
Bank Of Africa Burkina Faso: BF084
Banque Sahélo-Saharienne pour l'Investissement et le Commerce - Burkina Faso: BF108
Banque Atlantique Burkina Faso: BF134
International Business Bank: BF139
Coris Bank International: BF148
CBAO, Groupe Attijariwafa bank, Succursale au Burkina: BF161
Orabank Côte d'Ivoire, Succursale du Burkina: BF171
Banque De l'Union Burkina Faso: BF179
Wendkuni Bank International: BF202
Banque Agricole du Faso: BF207

# Benin
Orabank Bénin: BJ058
Bank Of Africa Bénin: BJ061
Ecobank Bénin: BJ062
Banque Internationale du Benin: BJ063
United Bank for Africa Bénin: BJ067
NSIA BANQUE Bénin: BJ099
Société Générale - Benin: BJ104
Banque Sahélo-Saharienne pour l'Investissement et le Commerce - Bénin: BJ107
Banque Atlantique du Bénin: BJ115
BGFIBank Bénin: BJ157
CBAO, Groupe Attijariwafa bank, Succursale du Bénin: BJ177
CCEI BANK BENIN: BJ184
BANQUE AFRICAINE POUR L'INDUSTRIE ET LE COMMERCE - BENIN: BJ185
Coris Bank International Bénin: BJ212
Société Nigérienne de Banque, Succursale du Bénin: BJ199

# Ivory Coast
Banque Internationale pour le Commerce et l'Industrie de la Côte d'Ivoire: CI006
Societe Ivoirienne de Banque: CI007
Société Générale Côte d'Ivoire: CI008
Bank Of Africa Côte d'Ivoire: CI032
Banque Atlantique Côte d'Ivoire: CI034
NSIA Banque Côte d'Ivoire: CI042
Ecobank Côte d'Ivoire: CI059
Banque de l'Habitat de Côte d'Ivoire: CI068
Banque Nationale d'Investissement: CI092
Standard Chartered Bank Côte d'Ivoire: CI097
AFRILAND FIRST BANK Côte d'Ivoire: CI106
Versus Bank S.A: CI112
Citibank - Côte d'Ivoire: CI118
ORABANK Côte d'Ivoire: CI121
Bridge Bank Group Côte d'Ivoire: CI131
United Bank for Africa CI: CI150
Banque Sahélo-Saharienne pour l'Investissement et le Commerce Côte d'Ivoire: CI154
Banque Populaire de Côte d'Ivoire: CI155
Diamond Bank Côte d'Ivoire: CI158
BGFI BANK COTE D'IVOIRE: CI162
Guaranty Trust Bank Côte d'Ivoire: CI163
Coris Bank International Côte d'Ivoire: CI166
Banque De l'Union Côte d'Ivoire: CI180
Banque Malienne de Solidarité, Succursale de Côte d'Ivoire: CI188
Banque Régionale de Marchés, Succursale de Côte d'Ivoire: CI194
Stanbic Bank: CI198
Banque d'Abidjan: CI201
Mansa Bank: CI211
Orange Abidjan Compagnie: CI214

# Guinea-Bissau
Banco da Africa Ocidental: GW096
Banco Da União: GW128
Ecobank Guinée Bissau: GW143
Orabank Côte d'Ivoire, Succursale de la Guinée-Bissau: GW172
Banque Atlantique Côte d'Ivoire, Succursale de Guinée-Bissau: GW195

# Mali
Banque de Developpement du Mali: ML016
Banque Internationale pour le Mali: ML041
Banque Nationale pour le Dévéloppement Agricole: ML043
Banque Commerciale du Sahel: ML044
Bank Of Africa Mali: ML045
Banque Internationale pour le Commerce et l'Industrie du Mali: ML089
Ecobank Mali: ML090
Banque Malienne de Solidarité: ML102
Banque Sahélo-Saharienne pour l'Investissement et le Commerce Mali: ML109
Banque Atlantique Mali: ML135
Banque pour le Commerce et l'Industrie du Mali: ML147
Orabank Côte d'Ivoire, Succursale du Mali: ML173
CORIS BANK ML: ML181
United Bank for Africa Mali: ML206

# Niger
Bank Of Africa Niger: NE038
Banque Internationale pour l'Afrique au Niger: NE040
Banque Commerciale du Niger: NE057
Société Nigérienne de Banque: NE064
Banque Islamique du Niger: NE081
Ecobank Niger: NE095
Banque Sahélo-Saharienne pour l'Investissement et le Commerce Niger: NE110
Banque Atlantique Niger: NE136
Banque Agricole du Niger: NE164
CBAO, Groupe Attijariwafa bank, Succursale du Niger: NE168
Orabank Côte d'Ivoire, Succursale du Niger: NE174
Banque Régionale de Marchés, Succursale du Niger: NE193
Banque de l'Habitat du NIGER: NE208
Coris Bank International, Succursale du Niger: NE210

# Senegal
Banque Internationale pour le Commerce et l'Industrie du Sénégal: SN010
Société Générale Sénégal: SN011
CBAO, Groupe Attijariwafa bank: SN012
Banque de l'Habitat du Sénégal: SN039
La Banque Agricole du Sénégal: SN048
Crédit du Sénégal: SN060
Banque Islamique du Sénégal: SN079
Ecobank Sénégal: SN094
Bank Of Africa Sénégal: SN100
Banque Sahélo-Saharienne pour l'Investissement et le Commerce Sénégal: SN111
Banque des Institutions Mutualistes d'Afrique de l'Ouest: SN117
Banque Atlantique Sénégal: SN137
FBNBank Sénégal: SN140
Citibank - Sénégal: SN141
Banque Régionale de Marchés: SN144
United Bank for Africa Sénégal: SN153
Crédit International: SN156
NSIA Banque Bénin, Succursale du Sénégal: SN159
Banque Nationale pour le Développement Economique: SN169
Orabank Côte d'Ivoire, Succursale du Sénégal: SN175
Banque pour le Commerce et l'Industrie du Mali, Succursale au Sénégal: SN178
BGFIBank Sénégal: SN189
Banque de Dakar: SN191
Coris Bank International Sénégal: SN213
La Banque OUTARDE: SN200
Banque de Développement du Mali, Succursale du Sénégal: SN221

# Togo
Banque de Développement du Mali, Succursale du Togo: TG221
Banque Internationale pour l'Afrique au Togo: TG005
Union Togolaise de Banque: TG009
SUNU Bank: TG151
Société Générale Bénin, Succursale du Togo: TG187
Banque Togolaise pour le Commerce et l'Industrie: TG024
Société Interafricaine de Banque: TG027
Ecobank Togo: TG055
Orabank Togo: TG116
Banque Atlantique Togo: TG138
Banque Sahélo-Saharienne pour l'Investissement et le Commerce Togo: TG133
NSIA Banque Bénin, Succursale du Togo: TG160
Bank Of Africa Togo: TG167
Coris Bank International Togo: TG182
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bank-options" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

Please note that due to regulatory reasons senders trying to create `XOF::Bank` transactions are required to have the following fields on the sender present as well:
`street`, `city` and `postal_code`

<div class="alert alert-info" markdown="1">
**Note** `XOF::Bank` payouts are currently in beta phase.
</div>
