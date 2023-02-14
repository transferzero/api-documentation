{% include corridors/recipient_name.md %}

## ZMW::Bank

For Zambian bank payments please use:

{% capture data-raw %}
```javascript
 "details": {
  {{ recipient_name }},
  "branch_code": "ZM210003"
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
AB Bank Zambia Limited, Main Cairo Road Branch, ZM210001
AB Bank Zambia Limited, KITWE, ZM210207

ABSA Bank, Livingstone, Zambia, 021012

AccSouth Sudan Bank, AccSouth Sudan Bank Zambia Ltd Arcades, ZM350003
AccSouth Sudan Bank, AccSouth Sudan Bank Zambia Ltd H O, ZM350000
AccSouth Sudan Bank, AccSouth Sudan Bank Zambia Ltd Kitwe, ZM350205
AccSouth Sudan Bank, AccSouth Sudan Bank Zambia Ltd Longacres, ZM350002
AccSouth Sudan Bank, AccSouth Sudan Bank Zambia Ltd Ndola Broadway, ZM350104
AccSouth Sudan Bank, AccSouth Sudan Bank Zambia Ltd Northend, ZM350001
AccSouth Sudan Bank, Makeni, ZM350006

Banc ABC, African Banking Corporation Kasumbalesa, ZM200407
Banc ABC, African Banking Corporation Livingstone, ZM201006
Banc ABC, African Banking Corporation Ndola, ZM200103
Banc ABC, BancABC H O, ZM200000
Banc ABC, BancABC Kitwe Branch, ZM200202
Banc ABC, BancABC Lumumba Branch, ZM200004
Banc ABC, BancABC Pyramid Plaza, ZM200001
Banc ABC, BancABC Zambia Ltd Chingola, ZM200318
Banc ABC, BancABC Zambia Ltd FINDECO House, ZM200021
Banc ABC, BancABC Zambia Ltd Kasama, ZM200817
Banc ABC, BancABC Zambia Ltd Mongu, ZM203111
Banc ABC, Chinsali Branch, ZM201710
Banc ABC, Chipata Branch, ZM201119
Banc ABC, Choma Branch, ZM201214
Banc ABC, East Park Mall, ZM200025
Banc ABC, Kafubu Mall, ZM200122
Banc ABC, Mansa Branch, ZM201909
Banc ABC, Mpika Branch, ZM201816
Banc ABC, Mukuba Mall, ZM200226
Banc ABC, Solwezi Branch, ZM202808
Banc ABC, UTH Agency, ZM200024
Banc ABC, KABWE, ZM200913
Banc ABC, Sinazeze, ZM201227

Bank Of Zambia Lusaka Bank Of Zambia Lusaka, ZM000001
Bank Of Zambia Lusaka Bank Of Zambia Ndola, ZM000102

Bank of China, Bank Of China (Zambia) lusaka, ZM190001
Bank of China, Bank of China KITWE, ZM190202

Barclays Bank, Barclays Bank ZM Lusaka BusinSouth Sudan Centre, ZM020016
Barclays Bank, Barclays Bank ZM Ndola BusinSouth Sudan Centre, ZM020125
Barclays Bank, Barclays Bank ZM Plc Kitwe ChimwMalawie, ZM020210
Barclays Bank, Barclays Bank ZM Plc Lusaka - Industrial, ZM020019
Barclays Bank, Barclays Bank ZM Plc Lusaka - Kamwala, ZM020008
Barclays Bank, Barclays Bank Zambia H O, ZM020001
Barclays Bank, Barclays Bank Zambia Manda Hill, ZM020049
Barclays Bank, Barclays Bank Zambia Plc Chambishi, ZM025247
Barclays Bank, Barclays Bank Zambia Plc Chilenje, ZM020018
Barclays Bank, Barclays Bank Zambia Plc Chipata, ZM021104
Barclays Bank, Barclays Bank Zambia Plc Chirundu, ZM023542
Barclays Bank, Barclays Bank Zambia Plc Choma, ZM021205
Barclays Bank, Barclays Bank Zambia Plc Chongwe, ZM024637
Barclays Bank, Barclays Bank Zambia Plc Kabwata, ZM020043
Barclays Bank, Barclays Bank Zambia Plc Kabwe, ZM020906
Barclays Bank, Barclays Bank Zambia Plc Kafue, ZM023407
Barclays Bank, Barclays Bank Zambia Plc Kalomo, ZM024127
Barclays Bank, Barclays Bank Zambia Plc Kalulushi, ZM020648
Barclays Bank, Barclays Bank Zambia Plc Kapiri Mposhi, ZM022411
Barclays Bank, Barclays Bank Zambia Plc Kasama, ZM020832
Barclays Bank, Barclays Bank Zambia Plc Katete, ZM024928
Barclays Bank, Barclays Bank Zambia Plc Luanshya, ZM020713
Barclays Bank, Barclays Bank Zambia Plc Lundazi, ZM022531
Barclays Bank, Barclays Bank Zambia Plc Lusaka - Matero, ZM020015
Barclays Bank, Barclays Bank Zambia Plc Lusaka Northend, ZM020014
Barclays Bank, Barclays Bank Zambia Plc Lusaka-Soweto, ZM020033
Barclays Bank, Barclays Bank Zambia Plc Manda Hill, ZM021349
Barclays Bank, Barclays Bank Zambia Plc Mansa, ZM021920
Barclays Bank, Barclays Bank Zambia Plc Mazabuka, ZM023621
Barclays Bank, Barclays Bank Zambia Plc Mbala, ZM021451
Barclays Bank, Barclays Bank Zambia Plc Mfuwe, ZM022622
Barclays Bank, Barclays Bank Zambia Plc Mkushi, ZM022338
Barclays Bank, Barclays Bank Zambia Plc Mongu, ZM023135
Barclays Bank, Barclays Bank Zambia Plc Monze, ZM023724
Barclays Bank, Barclays Bank Zambia Plc Mpika, ZM021845
Barclays Bank, Barclays Bank Zambia Plc Mufulira, ZM020523
Barclays Bank, Barclays Bank Zambia Plc Mumbwa, ZM025334
Barclays Bank, Barclays Bank Zambia Plc Nakonde, ZM021540
Barclays Bank, Barclays Bank Zambia Plc Petauke, ZM024330
Barclays Bank, Barclays Bank Zambia Plc Solwezi, ZM022829
Barclays Bank, Barclays Chililabombwe, ZM020453
Barclays Bank, Barclays Chingola & Chingola Prestige, ZM020303
Barclays Bank, Barclays Elunda Premium Banking Centre, ZM020055
Barclays Bank, Barclays Kitwe Ops ProcSouth Sudaning Centre, ZM020252
Barclays Bank, Barclays Kitwe Parklands Center, ZM020241
Barclays Bank, Barclays Livingstone & Prestige, ZM021012
Barclays Bank, Barclays Lusaka - Chawama, ZM020044
Barclays Bank, Barclays Lusaka Chelston&Airport Agency, ZM020036
Barclays Bank, Barclays Lusaka KabelNigeriaa, ZM020054
Barclays Bank, Barclays Lusaka Ops & ProcSouth Sudaning Centre, ZM020050
Barclays Bank, Barclays Ndola - Masala, ZM020146
Barclays Bank, Barclays Ndola Ops & ProcSouth Sudaning Centre, ZM020139
Barclays Bank, Barclays Plc Kitwe BusinSouth Sudan Centre, ZM020209
Barclays Bank, Barclays University of Zambia Lusaka, ZM020026
Barclays Bank, Barclays ZM Lusaka Longacres & Prestige, ZM020017
Barclays Bank, Barclays Zambia H O -Elunda, ZM020002

Cavmont Bank, Bread of Life, ZM130030
Cavmont Bank, Cavmont Capital Bank Chingola, ZM130304
Cavmont Bank, Cavmont Capital Bank Chipata, ZM131114
Cavmont Bank, Cavmont Capital Bank Corporate, ZM130010
Cavmont Bank, Cavmont Capital Bank Garden, ZM130012
Cavmont Bank, Cavmont Capital Bank H O, ZM130000
Cavmont Bank, Cavmont Capital Bank Kalingalinga, ZM130009
Cavmont Bank, Cavmont Capital Bank Kasama, ZM130813
Cavmont Bank, Cavmont Capital Bank Kitwe, ZM130207
Cavmont Bank, Cavmont Capital Bank Lusaka South end, ZM130002
Cavmont Bank, Cavmont Capital Bank Lusaka Square, ZM130001
Cavmont Bank, Cavmont Capital Bank Makumbi, ZM130017
Cavmont Bank, Cavmont Capital Bank Mansa, ZM131911
Cavmont Bank, Cavmont Capital Bank Mbala, ZM131405
Cavmont Bank, Cavmont Capital Bank Mpulungu, ZM131306
Cavmont Bank, Cavmont Capital Bank Mufumbwe, ZM135416
Cavmont Bank, Cavmont Capital Bank Mwense, ZM135518
Cavmont Bank, Cavmont Capital Bank Ndola, ZM130103
Cavmont Bank, Cavmont Capital Bank Solwezi, ZM132815
Cavmont Bank, Chililabombwe Branch, ZM130220
Cavmont Bank, Kitwe Agency, ZM130219

Citibank, Citibank Natsave, ZM030007
Citibank, Citibank ZNBS Branch, ZM030008
Citibank, Citibank Zambia Lusaka, ZM030001
Citibank, Citibank Zambia Mcommerce Branch, ZM030003
Citibank, Citibank Zambia Ndola, ZM030102

Ecobank, Cairo road, ZM360002
Ecobank, Copperbelt University, ZM360208
Ecobank, Ndola Branch, ZM360109
Ecobank, Zambia Ltd Kitwe, ZM360205
Ecobank, Industrial Branch, ZM360007
Ecobank, Lumumba Branch, ZM360010
Ecobank, Mazabuka Branch, ZM363611
Ecobank, System Branch-Head Office, ZM360000
Ecobank, Thabo Mbeki, ZM360001
Ecobank, Chibombo, ZM365506
Ecobank, Kitwe, ZM360004
Ecobank, Woodlands, ZM360003
Ecobank, ECOBANK ZAMBIA, ZMNG001

FinanceBank, Embassy Branch, ZM110040
FinanceBank, Finance Bank - Jacaranda Branch, ZM110135
FinanceBank, Finance Bank Zambia Arcades, ZM110009
FinanceBank, Finance Bank Zambia Chililabombwe, ZM110443
FinanceBank, Finance Bank Zambia Chingola, ZM110315
FinanceBank, Finance Bank Zambia Chinsali, ZM111728
FinanceBank, Finance Bank Zambia Chipata, ZM111108
FinanceBank, Finance Bank Zambia Chirundu, ZM113514
FinanceBank, Finance Bank Zambia Choma, ZM111205
FinanceBank, Finance Bank Zambia Down Town, ZM110032
FinanceBank, Finance Bank Zambia H O, ZM110000
FinanceBank, Finance Bank Zambia Industrial, ZM110033
FinanceBank, Finance Bank Zambia Isoka, ZM111627
FinanceBank, Finance Bank Zambia Kabompo, ZM112919
FinanceBank, Finance Bank Zambia Kabwe, ZM110925
FinanceBank, Finance Bank Zambia Kalomo, ZM114110
FinanceBank, Finance Bank Zambia Kamwala, ZM110007
FinanceBank, Finance Bank Zambia Kaoma, ZM114430
FinanceBank, Finance Bank Zambia Kasama, ZM110804
FinanceBank, Finance Bank Zambia Kasumbalesa, ZM110434
FinanceBank, Finance Bank Zambia Katete, ZM111116
FinanceBank, Finance Bank Zambia Kitwe, ZM110203
FinanceBank, Finance Bank Zambia Livingstone, ZM111023
FinanceBank, Finance Bank Zambia Longacres, ZM110006
FinanceBank, Finance Bank Zambia Luanshya, ZM110731
FinanceBank, Finance Bank Zambia Lusaka Corporate, ZM110001
FinanceBank, Finance Bank Zambia Mbala, ZM111421
FinanceBank, Finance Bank Zambia Monze, ZM113724
FinanceBank, Finance Bank Zambia Mpika, ZM111826
FinanceBank, Finance Bank Zambia Mpulungu, ZM111329
FinanceBank, Finance Bank Zambia Mufulira, ZM110513
FinanceBank, Finance Bank Zambia Mwinilunga, ZM112718
FinanceBank, Finance Bank Zambia Nakonde, ZM111520
FinanceBank, Finance Bank Zambia Ndola Corporate, ZM110102
FinanceBank, Finance Bank Zambia Samfya, ZM112012
FinanceBank, Finance Bank Zambia Serenje, ZM112211
FinanceBank, Finance Bank Zambia SeshKenya, ZM113217
FinanceBank, Finance Bank Zambia Solwezi, ZM112822
FinanceBank, Finance bank Zambia Chongwe Branch, ZM114638
FinanceBank, Livonia Branch, ZM110037
FinanceBank, Lundazi Branch, ZM112541
FinanceBank, Mansa Branch, ZM111942
FinanceBank, Mumbwa Branch, ZM115339
FinanceBank, Nyumba Yanga Branch, ZM110036

First Alliance Bank, East Park Branch, ZM340007
First Alliance Bank, First Alliance Bank Kitwe, ZM340204
First Alliance Bank, First Alliance Bank Lusaka H O, ZM340005
First Alliance Bank, First Alliance Bank Northend, ZM340103
First Alliance Bank, First Alliance Bank Zambia H O, ZM340001
First Alliance Bank, First Alliance Bank Zambia Industial Br, ZM340006

First Capital Bank, First Capital Bank, ZM280000
First Capital Bank, First Capital Bank, ZM280001
First Capital Bank, First Capital Bank, ZM280002
First Capital Bank, First Capitalbank  Zambia Limited, ZM280003
First Capital Bank, First Capitalbank Zambia Kamwala Branch, ZM280006
First Capital Bank, Makeni Branch, ZM280004
First Capital Bank, Ndola Branch, ZM280105

First National Bank, Agriculture Center, ZM260040
First National Bank, Cash centre, ZM260048
First National Bank, Chilenje Branch, ZM260046
First National Bank, Choma Branch, ZM261238
First National Bank, Corporate Investment Banking, ZM260042
First National Bank, Kabulonga Branch, ZM260072
First National Bank, BranchlSouth Sudan Banking, ZM260025
First National Bank, CIB (Corporate), ZM260029
First National Bank, Government and Public Sector, ZM260036
First National Bank, Cairo Road Branch, ZM260050
First National Bank, Livingstone Branch, ZM261061
First National Bank, Operations, ZM260004
First National Bank, First National Bank Comm Suite Lusaka, ZM260001
First National Bank, First National Bank Electronic Banking, ZM260006
First National Bank, First National Bank H O Branch, ZM260005
First National Bank, First National Bank Industrial Branch, ZM260002
First National Bank, First National Bank Kitwe, ZM260212
First National Bank, First National Bank Makeni Mall, ZM260016
First National Bank, First National Bank Manda Hill, ZM260014
First National Bank, First National Bank Mazabuka, ZM263613
First National Bank, First National Bank Ndola Branch, ZM260103
First National Bank, First National Bank Ndola Branch, ZM260104
First National Bank, Homes Loans, ZM260020
First National Bank, Jacaranda Mall, ZM260118
First National Bank, Kabwe Branch, ZM260937
First National Bank, Kitwe Industrial, ZM260247
First National Bank, Mufulira Branch, ZM260544
First National Bank, Mukuba Mall Branch, ZM260243
First National Bank, PHI Branch, ZM260049
First National Bank, POS – FNB, ZM260033
First National Bank, Premier Banking - Lusaka, ZM260039
First National Bank, Treasury Branch, ZM260011
First National Bank, Vehicle and Asset Finance, ZM260015
First National Bank, Chingola, ZM260322
First National Bank, Luanshya, ZM260741
First National Bank, Mkushi, ZM262319
First National Bank, POS-Visa, ZM260031
First National Bank, Solwezi, ZM262823

Indo Zambia Bank, Chilenje Branch, ZM090028
Indo Zambia Bank, Choma Branch, ZM091218
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
Indo Zambia Bank, MONGU BRANCH, ZM093126
Indo Zambia Bank, Mansa Branch, ZM091924
Indo Zambia Bank, Mungwi Agency, ZM095632
Indo Zambia Bank, Serenje Branch, ZM092230
Indo Zambia Bank, Zimba Branch, ZM094229
Indo Zambia Bank,Chinsali, ZM091721
Indo Zambia Bank,Copperhill, ZM090225

Intermarket Banking Corporation, Intermarket Banking Corp Manda Hill, ZM150017
Intermarket Banking Corporation, Intermarket Banking Corp NIPA Agency, ZM150015
Intermarket Banking Corporation, Intermarket Banking Corp Soweto, ZM150016
Intermarket Banking Corporation, Intermarket Banking Corp. H O, ZM150000
Intermarket Banking Corporation, Intermarket Banking Corp. Independence, ZM150003
Intermarket Banking Corporation, Intermarket Banking Corp. Kitwe, ZM150002
Intermarket Banking Corporation, Intermarket Banking Corp. Lusaka, ZM150001
Intermarket Banking Corporation, Intermarket Banking Corporation Chawama, ZM150014
Intermarket Banking Corporation, Intermarket Banking Corporation Kitwe, ZM150202

Investrust, Buteko Branch, ZM170123
Investrust, Chingola Branch, ZM170326
Investrust, Choma branch, ZM171220
Investrust, Copperbelt – CBU Branch, ZM170227
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
Stanbic Bank, Stanbic Bank Kafubu Mall, ZM040195
Stanbic Bank, Stanbic Bank Zambia Arcades, ZM040010
Stanbic Bank, Stanbic Bank Zambia Chingola, ZM040309
Stanbic Bank, Stanbic Bank Zambia Chipata, ZM041116
Stanbic Bank, Stanbic Bank Zambia Choma Branch, ZM041218
Stanbic Bank, Stanbic Bank Zambia H O, ZM040000
Stanbic Bank, Stanbic Bank Zambia Kabwe Branch, ZM040922
Stanbic Bank, Stanbic Bank Zambia Kitwe, ZM040206
Stanbic Bank, Stanbic Bank Zambia Livingstone, ZM041017
Stanbic Bank, Stanbic Bank Zambia Ltd Soweto, ZM040224
Stanbic Bank, Stanbic Bank Zambia Ltd Soweto, ZM045225
Stanbic Bank, Stanbic Bank Zambia Lumwana Branch, ZM044821
Stanbic Bank, Stanbic Bank Zambia Lusaka Industrial, ZM040007
Stanbic Bank, Stanbic Bank Zambia Lusaka, ZM040002
Stanbic Bank, Stanbic Bank Zambia Matero, ZM040011
Stanbic Bank, Stanbic Bank Zambia Mazabuka, ZM043613
Stanbic Bank, Stanbic Bank Zambia Mkushi, ZM042308
Stanbic Bank, Stanbic Bank Zambia Mufulira, ZM040514
Stanbic Bank, Stanbic Bank Zambia Mulungushi, ZM040015
Stanbic Bank, Stanbic Bank Zambia Ndola Main, ZM040103
Stanbic Bank, Stanbic Bank Zambia Ndola South, ZM040105
Stanbic Bank, Stanbic Bank Zambia Solwezi, ZM042812
Stanbic Bank, Stanbic Private Banking, ZM040027
Stanbic Bank, Stanbic bank Kabulonga, ZM040029
Stanbic Bank, Stanbic bank Mukuba Mall, ZM040296
Stanbic Bank, Stanbic bank Woodlands, ZM040030
Stanbic Bank, Soweto, ZM040023

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

United Bank of Africa, The United Bank of Zambia Ltd - Lusaka, ZM180001
United Bank of Africa, United Bank for Africa Zambia Cairo, ZM370003
United Bank of Africa, United Bank for Africa Zambia H O Br, ZM370001
United Bank of Africa, United Bank for Africa Zambia H O, ZM370099
United Bank of Africa, United Bank for Africa Zambia Kamwala, ZM370002
United Bank of Africa, United Bank of Africa, ZM370105
United Bank of Africa, Kitwe, ZM370204

Zambia National Commercial Bank, Acacia Park Branch, ZM010086
Zambia National Commercial Bank, Mukuba branch, ZM010298
Zambia National Commercial Bank, ZM National Comm. Cairo BusinSouth Sudan Centre, ZM010040
Zambia National Commercial Bank, ZM National Comm. Govt BusinSouth Sudan Centre, ZM010050
Zambia National Commercial Bank, ZM National Comm. Kitwe Clearing Centre, ZM010217
Zambia National Commercial Bank, ZM National Comm. Lusaka BusinSouth SudanCenter, ZM010003
Zambia National Commercial Bank, ZM National Comm. Ndola BusinSouth Sudan Centre, ZM010142
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
```
{% endcapture %}

{% include language-tabbar.html prefix= zmw-bank-options  raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note** `ZMW::Bank` payouts are currently in beta phase.
</div>
