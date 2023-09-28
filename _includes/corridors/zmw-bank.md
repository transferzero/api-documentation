{% include corridors/recipient_name.md %}

## ZMW::Bank

For Zambian bank payments please use:

{% capture data-raw %}
```javascript
 "details": {
  {{ recipient_name }},
  "bank_account": "1234567890",
  "branch_code": "ZM210003",
  "transfer_reason": "personal_account"
}
```
{% endcapture %}

{% include language-tabbar.html prefix= zmw-bank-details  raw=data-raw %}

The currently supported banks and their available branches are:

{% capture data-raw %}
```
AB Bank Zambia Limited, AB Bank Zambia Limited Matero, ZM210003
AB Bank Zambia Limited, Chelston Branch, ZM210005
AB Bank Zambia Limited, Chilenje Branch, ZM210002
AB Bank Zambia Limited, Garden Branch, ZM210006
AB Bank Zambia Limited, Head Office, ZM210000
AB Bank Zambia Limited, Kalingalinga Branch, ZM210004
AB Bank Zambia Limited, KITWE, ZM210207
AB Bank Zambia Limited, Main Cairo Road Branch, ZM210001

ABSA Bank, Livingstone, Zambia, ZM21012

Access Bank, ACACIA BRANCH, ZM350003
Access Bank, CAIRO ROAD, ZM350001
Access Bank, CAROUSEL CASH CENTRE, ZM350006
Access Bank, CHILILABOMBWE BRANCH, ZM350409
Access Bank, CHINGOLA BRANCH, ZM350310
Access Bank, CHIPATA BRANCH, ZM351611
Access Bank, DANGOTE AGENCY, ZM350104
Access Bank, GARDEN BRANCH, ZM350012
Access Bank, HEAD OFFICE, ZM350000
Access Bank, KALIINGALINGA BRANCH,, ZM350013
Access Bank, KASAMA BRANCH, ZM350814
Access Bank, KITWE BRANCH, ZM350205
Access Bank, LONGACRES BRANCH, ZM350002
Access Bank, LUSAKA SQUARE, ZM350008
Access Bank, MAKENI MALL BRANCH, ZM350006
Access Bank, MANSA BRANCH, ZM351915
Access Bank, MBALA BRANCH, ZM351416
Access Bank, MUFUMBWE BRANCH, ZM352817
Access Bank, NDOLA BRANCH, ZM350104
Access Bank, SOLWEZI BRANCH, ZM352807
Access Bank, TAZARA BRANCH, ZM350018

Atlas Mara, Arcades, ZM200009
Atlas Mara, Chililabombwe, ZM200443
Atlas Mara, Chingola, ZM200315
Atlas Mara, Chinsali, ZM201728
Atlas Mara, Chipata, ZM201108
Atlas Mara, Chirundu, ZM203514
Atlas Mara, Choma, ZM201205
Atlas Mara, Chongwe, ZM204638
Atlas Mara, Down Town, ZM200032
Atlas Mara, East Park Mall, ZM200050
Atlas Mara, Head Office, ZM200000
Atlas Mara, Industrial, ZM200033
Atlas Mara, Isoka, ZM201627
Atlas Mara, Kabompo, ZM202919
Atlas Mara, Kabwe, ZM200925
Atlas Mara, Kafubu Mall, ZM200149
Atlas Mara, Kalomo, ZM204110
Atlas Mara, Kamwala, ZM200007
Atlas Mara, Kaoma, ZM204430
Atlas Mara, Kasama, ZM200804
Atlas Mara, Kasumbalesa, ZM200434
Atlas Mara, Katete, ZM201116
Atlas Mara, Kitwe, ZM200203
Atlas Mara, Livingstone, ZM201023
Atlas Mara, Longacres, ZM200006
Atlas Mara, Luanshya, ZM200731
Atlas Mara, Lundazi, ZM202541
Atlas Mara, Lusaka Main, ZM200001
Atlas Mara, Mansa Branch, ZM201942
Atlas Mara, Mbala, ZM201421
Atlas Mara, Mongu, ZM203145
Atlas Mara, Monze, ZM203724
Atlas Mara, Mpika, ZM201826
Atlas Mara, Mpulungu, ZM201329
Atlas Mara, Mufulira, ZM200513
Atlas Mara, Mukuba Mall, ZM200251
Atlas Mara, Mumbwa, ZM205339
Atlas Mara, Mwinilunga, ZM202718
Atlas Mara, Nakonde, ZM201520
Atlas Mara, Ndola, ZM200102
Atlas Mara, Nyumba Yanga, ZM200036
Atlas Mara, Pyramid Plaza, ZM200044
Atlas Mara, Samfya, ZM202012
Atlas Mara, Serenje, ZM202211
Atlas Mara, Sesheke, ZM203217
Atlas Mara, Sinazeze, ZM201247
Atlas Mara, Solwezi, ZM202822
Atlas Mara, UTH, ZM200052

Bank of China, Bank Of China (Zambia) lusaka, ZM190001
Bank of China, Bank of China KITWE, ZM190202

Citibank, Citibank Natsave, ZM030007
Citibank, Citibank Zambia Lusaka, ZM030001
Citibank, Citibank Zambia Mcommerce Branch, ZM030003
Citibank, Citibank Zambia Ndola, ZM030102
Citibank, Citibank ZNBS Branch, ZM030008

Ecobank, Cairo road, ZM360002
Ecobank, Chibombo, ZM365506
Ecobank, Copperbelt University, ZM360208
Ecobank, Ecobank Ndola Branch, ZM360109
Ecobank, ECOBANK ZAMBIA, ZMNG001
Ecobank, Ecobank Zambia Ltd Kitwe, ZM360205
Ecobank, Industrial Branch, ZM360007
Ecobank, Kitwe, ZM360004
Ecobank, Lumumba Branch, ZM360010
Ecobank, Mazabuka Branch, ZM363611
Ecobank, System Branch-Head Office, ZM360000
Ecobank, Thabo Mbeki, ZM360001
Ecobank, Woodlands, ZM360003

First Alliance Bank, East Park Branch, ZM340007
First Alliance Bank, First Alliance Bank Kitwe, ZM340204
First Alliance Bank, First Alliance Bank Lusaka H O, ZM340005
First Alliance Bank, First Alliance Bank Northend, ZM340103
First Alliance Bank, First Alliance Bank Zambia H O, ZM340001
First Alliance Bank, First Alliance Bank Zambia Industial Br, ZM340006

First Capital Bank, First Capital Bank, ZM280000
First Capital Bank, First Capital Bank, ZM280002
First Capital Bank, First Capitalbank  Zambia Limited, ZM280003
First Capital Bank, First Capitalbank Zambia Kamwala Branch, ZM280006
First Capital Bank, Makeni Branch, ZM280004
First Capital Bank, Ndola Branch, ZM280105

First National Bank, Agriculture Center, ZM260040
First National Bank, Cash centre, ZM260048
First National Bank, Chilenje Branch, ZM260046
First National Bank, Chingola, ZM260322
First National Bank, Choma Branch, ZM261238
First National Bank, Corporate Investment Banking, ZM260042
First National Bank, First National Bank Comm Suite Lusaka, ZM260001
First National Bank, First National Bank Electronic Banking, ZM260006
First National Bank, First National Bank H O Branch, ZM260005
First National Bank, First National Bank Industrial Branch, ZM260002
First National Bank, First National Bank Kitwe, ZM260212
First National Bank, First National Bank Makeni Mall, ZM260016
First National Bank, First National Bank Manda Hill, ZM260014
First National Bank, First National Bank Mazabuka, ZM263613
First National Bank, First National Bank Ndola Branch, ZM260104
First National Bank, First National Bank Ndola Branch, ZM260103
First National Bank, FNB  Kabulonga Branch, ZM260072
First National Bank, FNB - BranchlSouth Sudan Banking, ZM260025
First National Bank, FNB - CIB (Corporate), ZM260029
First National Bank, FNB - Government and Public Sector, ZM260036
First National Bank, FNB Cairo Road Branch, ZM260050
First National Bank, FNB Livingstone Branch, ZM261061
First National Bank, FNB Operations, ZM260004
First National Bank, Homes Loans, ZM260020
First National Bank, Jacaranda Mall, ZM260118
First National Bank, Kabwe Branch, ZM260937
First National Bank, Kitwe Industrial, ZM260247
First National Bank, Luanshya, ZM260741
First National Bank, Mkushi, ZM262319
First National Bank, Mufulira Branch, ZM260544
First National Bank, Mukuba Mall Branch, ZM260243
First National Bank, PHI Branch, ZM260049
First National Bank, POS – FNB, ZM260033
First National Bank, POS-Visa, ZM260031
First National Bank, Premier Banking - Lusaka, ZM260039
First National Bank, Solwezi, ZM262823
First National Bank, Treasury Branch, ZM260011
First National Bank, Vehicle and Asset Finance, ZM260015

Indo Zambia Bank, Chilenje Branch, ZM090028
Indo Zambia Bank, Chinsali, ZM091721
Indo Zambia Bank, Choma Branch, ZM091218
Indo Zambia Bank, Copperhill, ZM090225
Indo Zambia Bank, Cross Roads Shopping Mall, ZM090023
Indo Zambia Bank, Indo Zambia Bank Chandwe Musonda, ZM090016
Indo Zambia Bank, Indo Zambia Bank Chawama, ZM090013
Indo Zambia Bank, Indo Zambia Bank Chilanga, ZM090003
Indo Zambia Bank, Indo Zambia Bank Chingola, ZM090309
Indo Zambia Bank, Indo Zambia Bank Chipata, ZM091112
Indo Zambia Bank, Indo Zambia Bank H O, ZM090000
Indo Zambia Bank, Indo Zambia Bank Kabwe, ZM090906
Indo Zambia Bank, Indo Zambia Bank Kamwala, ZM090004
Indo Zambia Bank, Indo Zambia Bank Kitwe, ZM090208
Indo Zambia Bank, Indo Zambia Bank Livingstone, ZM091010
Indo Zambia Bank, Indo Zambia Bank Ltd Kasama, ZM090820
Indo Zambia Bank, Indo Zambia Bank Ltd Solwezi, ZM092819
Indo Zambia Bank, Indo Zambia Bank Lusaka Industrial, ZM090011
Indo Zambia Bank, Indo Zambia Bank Lusaka Main, ZM090001
Indo Zambia Bank, Indo Zambia Bank Manda Hill, ZM090014
Indo Zambia Bank, Indo Zambia Bank Ndola, ZM090107
Indo Zambia Bank, Indo Zambia Bank North end, ZM090005
Indo Zambia Bank, Indo Zambia Bank Nyimba Branch, ZM095415
Indo Zambia Bank, Jacaranda Mall, ZM090122
Indo Zambia Bank, Kafue Branch, ZM093427
Indo Zambia Bank, Kasumbalesa Branch, ZM090417
Indo Zambia Bank, Lundazi Agency, ZM092531
Indo Zambia Bank, Mansa Branch, ZM091924
Indo Zambia Bank, MONGU BRANCH, ZM093126
Indo Zambia Bank, Mungwi Agency, ZM095632
Indo Zambia Bank, Serenje Branch, ZM092230
Indo Zambia Bank, Zimba Branch, ZM094229

Investrust, Buteko Branch, ZM170123
Investrust, Chingola Branch, ZM170326
Investrust, Choma branch, ZM171220
Investrust, Copperbelt - CBU Branch, ZM170227
Investrust, Investrust Bank Chirundu Branch, ZM173515
Investrust, Investrust Bank Head Office Branch, ZM170099
Investrust, Investrust Bank Lusaka Industrial Br, ZM170012
Investrust, Investrust Bank Plc Arcades, ZM170005
Investrust, Investrust Bank Plc Chililabombwe, ZM170407
Investrust, Investrust Bank Plc Chipata, ZM171103
Investrust, Investrust Bank Plc Chirundu, ZM173514
Investrust, Investrust Bank Plc Kafue Road, ZM170014
Investrust, Investrust Bank Plc Kitwe, ZM170202
Investrust, Investrust Bank Plc Livingstone, ZM171010
Investrust, Investrust Bank Plc Luangwa, ZM171104
Investrust, Investrust Bank Plc Lumwana, ZM174809
Investrust, Investrust Bank Plc Lusaka, ZM170001
Investrust, Investrust Bank Plc Odys Branch, ZM170011
Investrust, Investrust Bank Plc Savings Center, ZM170006
Investrust, Investrust Bank Plc Solwezi, ZM172808
Investrust, Investrust Bank Plc VSTRZMLU Kabwe, ZM170919
Investrust, Investrust Bank Soweto Branch, ZM170013
Investrust, Kitwe Freedom Avenue Branch, ZM170225
Investrust, Levy BusinSouth Sudan Branch, ZM170018
Investrust, Manda Hill Branch, ZM170016
Investrust, Mongu Branch, ZM173124
Investrust, Mulungushi Branch, ZM170017
Investrust, Mumbwa Road Branch, ZM170022
Investrust, President Avenue, ZM170121

Stanbic Bank, Cosmopolitan Mall, ZM040093
Stanbic Bank, East Park Mall, ZM040094
Stanbic Bank, Soweto, ZM040023
Stanbic Bank, Stanbic bank Kabulonga, ZM040029
Stanbic Bank, Stanbic Bank Kafubu Mall, ZM040195
Stanbic Bank, Stanbic bank Mukuba Mall, ZM040296
Stanbic Bank, Stanbic bank Woodlands, ZM040030
Stanbic Bank, Stanbic Bank Zambia Arcades, ZM040010
Stanbic Bank, Stanbic Bank Zambia Chingola, ZM040309
Stanbic Bank, Stanbic Bank Zambia Chipata, ZM041116
Stanbic Bank, Stanbic Bank Zambia Choma Branch, ZM041218
Stanbic Bank, Stanbic Bank Zambia H O, ZM040000
Stanbic Bank, Stanbic Bank Zambia Kabwe Branch, ZM040922
Stanbic Bank, Stanbic Bank Zambia Kitwe, ZM040206
Stanbic Bank, Stanbic Bank Zambia Livingstone, ZM041017
Stanbic Bank, Stanbic Bank Zambia Ltd Soweto, ZM045225
Stanbic Bank, Stanbic Bank Zambia Ltd Soweto, ZM040224
Stanbic Bank, Stanbic Bank Zambia Lumwana Branch, ZM044821
Stanbic Bank, Stanbic Bank Zambia Lusaka, ZM040002
Stanbic Bank, Stanbic Bank Zambia Lusaka Industrial, ZM040007
Stanbic Bank, Stanbic Bank Zambia Matero, ZM040011
Stanbic Bank, Stanbic Bank Zambia Mazabuka, ZM043613
Stanbic Bank, Stanbic Bank Zambia Mkushi, ZM042308
Stanbic Bank, Stanbic Bank Zambia Mufulira, ZM040514
Stanbic Bank, Stanbic Bank Zambia Mulungushi, ZM040015
Stanbic Bank, Stanbic Bank Zambia Ndola Main, ZM040103
Stanbic Bank, Stanbic Bank Zambia Ndola South, ZM040105
Stanbic Bank, Stanbic Bank Zambia Solwezi, ZM042812
Stanbic Bank, Stanbic Private Banking, ZM040027

Standard Chartered Bank, Standard  Chartered  Bank  Levy Park, ZM060021
Standard Chartered Bank, Standard Chartered Buteko, ZM060171
Standard Chartered Bank, Standard Chartered Chililabombwe, ZM060444
Standard Chartered Bank, Standard Chartered Chingola, ZM060336
Standard Chartered Bank, Standard Chartered Choma, ZM061237
Standard Chartered Bank, Standard Chartered Cross Roads, ZM060015
Standard Chartered Bank, Standard Chartered Cust Services Centre, ZM060002
Standard Chartered Bank, Standard Chartered Financial Control, ZM060011
Standard Chartered Bank, Standard Chartered Kabulonga, ZM060014
Standard Chartered Bank, Standard Chartered Kasama, ZM060813
Standard Chartered Bank, Standard Chartered Livingstone, ZM061018
Standard Chartered Bank, Standard Chartered Luanshya, ZM060732
Standard Chartered Bank, Standard Chartered Lusaka Main, ZM060017
Standard Chartered Bank, Standard Chartered Manda Hill, ZM060030
Standard Chartered Bank, Standard Chartered Mazabuka, ZM063619
Standard Chartered Bank, Standard Chartered Mongu, ZM063148
Standard Chartered Bank, Standard Chartered Ndola South, ZM060120
Standard Chartered Bank, Standard Chartered North end, ZM060043
Standard Chartered Bank, Standard Chartered Solwezi, ZM062816
Standard Chartered Bank, Standard Chartered Zambia Way, ZM060228

United Bank of Africa, Kitwe, ZM370204
United Bank of Africa, The United Bank of Zambia Ltd - Lusaka, ZM180001
United Bank of Africa, United Bank for Africa Zambia Cairo, ZM370003
United Bank of Africa, United Bank for Africa Zambia H O, ZM370099
United Bank of Africa, United Bank for Africa Zambia H O Br, ZM370001
United Bank of Africa, United Bank for Africa Zambia Kamwala, ZM370002
United Bank of Africa, United Bank of Africa, ZM370105

Zambia Industrial Commercial Bank, ECL Mall Branch, ZM140002
Zambia Industrial Commercial Bank, Head Office, ZM140000
Zambia Industrial Commercial Bank, Lusaka Main Branch, ZM140001

Zambia National Commercial Bank, Acacia Park Branch, ZM010086
Zambia National Commercial Bank, Mukuba branch, ZM010298
Zambia National Commercial Bank, Zambia National Comm Govt Complex, ZM010084
Zambia National Commercial Bank, Zambia National Comm Kapiri Mposhi, ZM012461
Zambia National Commercial Bank, Zambia National Comm Kitwe Industrial, ZM010256
Zambia National Commercial Bank, Zambia National Comm Luanshya, ZM010763
Zambia National Commercial Bank, Zambia National Comm Lusaka City Market, ZM010074
Zambia National Commercial Bank, Zambia National Comm Lusaka CivicCentre, ZM010067
Zambia National Commercial Bank, Zambia National Comm Lusaka Premium, ZM010066
Zambia National Commercial Bank, Zambia National Comm Ndola Industrial, ZM010164
Zambia National Commercial Bank, Zambia National Comm Woodlands, ZM010085
Zambia National Commercial Bank, Zambia National Comm. Debt Recovery, ZM010055
Zambia National Commercial Bank, Zambia National Comm. Human Resources, ZM010007
Zambia National Commercial Bank, Zambia National Comm. Intl. Banking, ZM010002
Zambia National Commercial Bank, Zambia National Comm. Lusaka Centre, ZM010052
Zambia National Commercial Bank, Zambia National Comm. Lusaka Kwacha, ZM010053
Zambia National Commercial Bank, Zambia National Comm. Lusaka North end, ZM010041
Zambia National Commercial Bank, Zambia National Comm. Ndola West, ZM010154
Zambia National Commercial Bank, Zambia National Commercial Avondale, ZM010073
Zambia National Commercial Bank, Zambia National Commercial Chingola, ZM010349
Zambia National Commercial Bank, Zambia National Commercial Chipata, ZM011160
Zambia National Commercial Bank, Zambia National Commercial Chirundu, ZM013582
Zambia National Commercial Bank, Zambia National Commercial Chisamba, ZM014508
Zambia National Commercial Bank, Zambia National Commercial Choma, ZM011259
Zambia National Commercial Bank, Zambia National Commercial Digital Banking, ZM010093
Zambia National Commercial Bank, Zambia National Commercial H O, ZM010001
Zambia National Commercial Bank, Zambia National Commercial Itezhi-Tezhi, ZM014779
Zambia National Commercial Bank, Zambia National Commercial Kabwe, ZM010946
Zambia National Commercial Bank, Zambia National Commercial Kafue, ZM013458
Zambia National Commercial Bank, Zambia National Commercial Kasama, ZM010862
Zambia National Commercial Bank, Zambia National Commercial Kawambwa, ZM012104
Zambia National Commercial Bank, Zambia National Commercial Kitwe Obote, ZM010245
Zambia National Commercial Bank, Zambia National Commercial Livingstone, ZM011044
Zambia National Commercial Bank, Zambia National Commercial Lundazi, ZM012571
Zambia National Commercial Bank, Zambia National Commercial Maamba, ZM014070
Zambia National Commercial Bank, Zambia National Commercial Manda Hill, ZM010078
Zambia National Commercial Bank, Zambia National Commercial Mansa, ZM011948
Zambia National Commercial Bank, Zambia National Commercial Mazabuka, ZM013647
Zambia National Commercial Bank, Zambia National Commercial Mfuwe, ZM012606
Zambia National Commercial Bank, Zambia National Commercial Mkushi, ZM012309
Zambia National Commercial Bank, Zambia National Commercial Mongu, ZM013151
Zambia National Commercial Bank, Zambia National Commercial Monze, ZM013757
Zambia National Commercial Bank, Zambia National Commercial Mpika, ZM011865
Zambia National Commercial Bank, Zambia National Commercial Mufulira, ZM010543
Zambia National Commercial Bank, Zambia National Commercial Namwala, ZM013372
Zambia National Commercial Bank, Zambia National Commercial North mead, ZM010075
Zambia National Commercial Bank, Zambia National Commercial Petauke, ZM014305
Zambia National Commercial Bank, Zambia National Commercial Plc Nakonde, ZM011596
Zambia National Commercial Bank, Zambia National Commercial Senanga2, ZM015181
Zambia National Commercial Bank, Zambia National Commercial Siavonga, ZM013869
Zambia National Commercial Bank, Zambia National Commercial Solwezi, ZM012868
Zambia National Commercial Bank, Zambia National Commercial Treasury, ZM010018
Zambia National Commercial Bank, Zambia National Commercial Xapit, ZM010083
Zambia National Commercial Bank, Zambia National Commercial ZACC, ZM010016
Zambia National Commercial Bank, ZM National Comm. Cairo BusinSouth Sudan Centre, ZM010040
Zambia National Commercial Bank, ZM National Comm. Govt BusinSouth Sudan Centre, ZM010050
Zambia National Commercial Bank, ZM National Comm. Kitwe Clearing Centre, ZM010217
Zambia National Commercial Bank, ZM National Comm. Lusaka BusinSouth SudanCenter, ZM010003
Zambia National Commercial Bank, ZM National Comm. Ndola BusinSouth Sudan Centre, ZM010142
```
{% endcapture %}

{% include language-tabbar.html prefix=zmw-bank-options  raw=data-raw %}

{% include corridors/transfer_reasons.md %}

<div class="alert alert-info" markdown="1">
**Note:** Both Individual and Business senders can be used for Zambian bank payouts.
</div>

Individual senders trying to create Zambian bank payouts need to have the following details present:
- `"identification_type" => "ID"`
- `"identification_number" => "AB12345678"`
- `"street" => "1, Main Street"`
- `"city" => "Lusaka"`

The accepted `identification_type`s are:

{% capture data-raw %}
```
DL (Driving License)
PP (Passport)
ID (National ID)
OT (Other)
```
{% endcapture %}

{% include language-tabbar.html prefix="zmw-bank-identification-types" raw=data-raw %}

Please note that the fields above are generally considered optional for senders for other payment corridors. If you wish to use an existing sender who has some of these fields missing you can provide them alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
    "sender": {
      "external_id": "<id of sender>",
      "identification_type": "ID",
      "identification_number": "AB12345678",
      "street": "1, Main Street",
      "city": "Lusaka",
      (...)
    },
    (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zmw-bank-individual-sender-details" raw=data-raw %}

Business senders trying to create Zambian bank payouts need to have the following details present:
- `"first_name" => "First"` - First name of Company Representative
- `"last_name" => "Last"` - Last name of Company Representative
- `"phone_number" => "+260961234567"` - Phone number of Company Representative
- `"registration_number" => "RN123456789"`
- `"legal_entity_type" => "partnership"`
- `"street" => "1, Main Street"`
- `"city" => "Lusaka"`

The valid values for `legal_entity_type` are the following:

{% capture data-raw %}
```markdown
- sole_proprietorship: Sole Proprietorship
- partnership: Partnership
- privately_owned_company: Privately Owned Company (Limited Company)
- publicly_owned_company: Publicly Listed Company (PLC)
- government_owned_entity: Government Owned Entity Trusts
- trust: Foundations & Similar Entities
- ngo: Non-Government Organisations / Charities inc Religious bodies and place of worship
- club_and_society: Clubs and Societies
- go: GO (Majority Owned Subsidiary of State-Owned Company)
- financial_institution: Financial Institution
```
{% endcapture %}

{% include language-tabbar.html prefix="legal-entity-type-details" raw=data-raw %}

Please note that the fields above are generally considered optional for senders for other payment corridors. If you wish to use an existing sender who has some of these fields missing you can provide them alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
    "sender": {
      "external_id": "<id of sender>",
      "type": "business",
      "first_name": "First",
      "last_name": "Last",
      "phone_number": "+260961234567",
      "registration_number": "RN123456789",
      "legal_entity_type": "partnership",
      "street": "1, Main Street",
      "city": "Lusaka",
      (...)
    },
    (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zmw-bank-business-sender-details" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note:** `ZMW::Bank` payouts are currently in beta phase.
</div>
