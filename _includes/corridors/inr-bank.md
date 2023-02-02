{% include corridors/recipient_name.md %}

## INR::Bank

For bank payments in India please use:

{% capture data-raw %}
```javascript
"details" : {
  {{ recipient_name }},
  "city": "New Delhi",
  "street": "1, Akbar Road",
  "postal_code": "110016",
  "phone_number": "+919876543210", // recipient phone number in international format
  "bank_name": "Bank of India"
  "bank_account": "1234567890",
  "ifsc_code": "BKID0006005"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="inr-bank-details" raw=data-raw %}

The current supported banks and their available branches (with the respective `ifsc_code` values) are:

{% capture data-raw %}
```
Bank name: Abhyudaya Cooperative Bank Limited

(Branch name: IFSC code)
Rtgs-ho: ABHY0065001
Abhyudaya Nagar: ABHY0065002
Bail Bazar: ABHY0065003
Bhandup: ABHY0065004
Darukhana: ABHY0065005
Fort: ABHY0065006
Ghatkopar: ABHY0065007
Kanjur: ABHY0065008
Nehru Nagar: ABHY0065009
Parel: ABHY0065010
Sewri: ABHY0065011
Wadala: ABHY0065012
Worli: ABHY0065013
Mumbra: ABHY0065014
Turbhe: ABHY0065015
Vashi: ABHY0065016
Mobile Bank: ABHY0065017
New Panvel: ABHY0065018
Kalamboli: ABHY0065019
Dharavi: ABHY0065020
Malad East: ABHY0065021
Cbd Belapur: ABHY0065022
Bhiwandi: ABHY0065023
Borivali: ABHY0065024
Hill Road: ABHY0065025
Kher Nagar: ABHY0065026
Kandivli-east: ABHY0065027
Sherly Rajan: ABHY0065028
Ganesh Nagar: ABHY0065029
Malad West: ABHY0065030
Nerul: ABHY0065031
Airoli: ABHY0065032
Andheri: ABHY0065034
Nhava Sheva: ABHY0065035
Banking Complex: ABHY0065036
Koparkhairne: ABHY0065037
Dadar: ABHY0065038
Mulund: ABHY0065039
Charai: ABHY0065040
Lokmanya Nagar: ABHY0065041
Kharghar: ABHY0065042
Vasai: ABHY0065043
Ghansoli: ABHY0065044
Kamothe: ABHY0065045
Bhayandar: ABHY0065046
Dahisar East: ABHY0065047
Kalyan-west: ABHY0065048
Dombivli East: ABHY0065049
Old Panvel: ABHY0065050
Kandivali (west): ABHY0065051
Mira Road (east): ABHY0065052
Badlapur (east): ABHY0065053
Chembur: ABHY0065054
Virar: ABHY0065055
Seawood: ABHY0065056
Ghodbunder Road: ABHY0065057
Antop Hill: ABHY0065058
Nallasopara: ABHY0065059
Divale Cbd: ABHY0065060
Khanda Colony: ABHY0065061
Kalwa: ABHY0065062
Dombivli (west): ABHY0065063
Goregaon West: ABHY0065064
Jogeshwari (east): ABHY0065065
Kalyan (east): ABHY0065066
Diva (east): ABHY0065067
Anjur Phata: ABHY0065068
Marve Link Road: ABHY0065069
Lower Parel: ABHY0065070
Lalbaug: ABHY0065071
Vikhroli (east): ABHY0065072
Vikhroli West: ABHY0065073
Kausa Mumbra: ABHY0065074
Ulwe: ABHY0065075
Kurla (west): ABHY0065076
Pen: ABHY0065077
Nana Peth: ABHY0065102
Laxmi Road: ABHY0065103
Yerwada: ABHY0065104
Pimpri: ABHY0065105
Paud Phata: ABHY0065106
Baner Road: ABHY0065107
Dhankawadi: ABHY0065108
Wagholi: ABHY0065109
Sinhagad Road: ABHY0065110
Deccan Gymkhana: ABHY0065111
Nagpur: ABHY0065112
Aurangabad: ABHY0065113
Kankavli: ABHY0065114
Nashik: ABHY0065115
Chakan Branch: ABHY0065116
Ambad: ABHY0065117
Nashik Road: ABHY0065118
Garkheda: ABHY0065119
Ashok Nagar: ABHY0065120
C.a. Road: ABHY0065121
Dabhade Talegaon: ABHY0065122
Samrat Nagar: ABHY0065123
Indira Nagar: ABHY0065124
Panchavati: ABHY0065125
Ahmednagar: ABHY0065126
Mandvi: ABHY0065201
Mithakhali: ABHY0065202
Manekchowk: ABHY0065203
Raipur: ABHY0065204
Odhav: ABHY0065205
Ghatlodiya: ABHY0065208
Main Br Udupi: ABHY0065301
City: ABHY0065302
Shirva: ABHY0065304
Padubidri: ABHY0065305
Mangalore: ABHY0065306

Bank name: The Akola District Central Cooperative Bank

(Branch name: IFSC code)
Rtgs-ho: ADCC0000001
Market Yard Branch - Akola: ADCC0000002
Kapad Bazar Branch - Akola: ADCC0000003
Shri Rajeshwar Branch - Akola: ADCC0000004
Zp Branch - Akola: ADCC0000005
Civil Lines Branch - Akola: ADCC0000006
Mahila Branch - Akola: ADCC0000007
Sah.mah.dr.annasaheb Korpe Ngr Br-akola: ADCC0000008
Dr.pdkv Branch - Akola: ADCC0000009
Dabki Road Branch - Akola: ADCC0000010
Tukaram Square Branch - Akola: ADCC0000011
Borgaon Manju Branch: ADCC0000012
Palso Badhe Branch: ADCC0000013
Mhaisang Branch: ADCC0000014
Kanshivani Branch: ADCC0000015
Gandhigram Branch: ADCC0000016
Chikhalgaon Branch: ADCC0000017
Dahihanda Â branch: ADCC0000018
Patur Nandapur Branch: ADCC0000019
Kurankhed Branch: ADCC0000020
Goregaon Khurd Branch: ADCC0000021
Umri Branch: ADCC0000022
Khadaki-chandur Branch: ADCC0000023
Ranpise Nagar Branch - Akola: ADCC0000024
Aagar Branch: ADCC0000025
Ratanlal Plots Branch - Akola: ADCC0000026
Barshitakli Branch: ADCC0000028
Pinjar Branch: ADCC0000029
Mahan Branch: ADCC0000030
Kanheri Sarap Branch: ADCC0000031
Dhaba Branch: ADCC0000032
Akot Main Branch: ADCC0000033
Akot City Branch: ADCC0000034
Akot Narsing Mandir Branch: ADCC0000035
Savara Branch: ADCC0000036
Raundala Branch: ADCC0000037
Chohotta Bazar Branch: ADCC0000038
Warul Jaulka Branch: ADCC0000039
Akolkhed Branch: ADCC0000040
Kutasa Branch: ADCC0000041
Mundgaon Branch: ADCC0000042
Telhara Main Branch: ADCC0000043
Telhara City Branch: ADCC0000044
Hiwarkhed Branch: ADCC0000045
Danapur Branch: ADCC0000046
Pathardi Branch: ADCC0000047
Belkhed Branch: ADCC0000048
Aadsul Â branch: ADCC0000049
Adgaon Bujruk Branch: ADCC0000050
Balapur Branch: ADCC0000051
Ural Branch: ADCC0000052
Wadegaon Branch: ADCC0000053
Nimba Â branch: ADCC0000054
Paras Branch: ADCC0000055
Hatrun Branch: ADCC0000056
Vyala Branch: ADCC0000057
Patur Â branch: ADCC0000058
Channi Â branch: ADCC0000059
Aalegaon Branch: ADCC0000060
Viwara Babhulgaon Branch: ADCC0000061
Sasti Branch: ADCC0000062
Murtijapur Main Branch: ADCC0000064
Murtijapur Market Yard Branch: ADCC0000065
Murtijapur City Branch: ADCC0000066
Mana Branch: ADCC0000067
Kurum Branch: ADCC0000068
Karanja Main Branch: ADCC0000070
Karanja City Branch: ADCC0000071
Kamargaon Branch: ADCC0000072
Umbarda Bazar Branch: ADCC0000073
Dhanaj Bujruk Branch: ADCC0000074
Manbha Branch: ADCC0000075
Poha Branch: ADCC0000076
Kajaleshwar Branch: ADCC0000077
Mangrulpir Main Branch: ADCC0000078
Mangrulpir City Branch: ADCC0000079
Mohari Â branch: ADCC0000080
Shelu Bazar Branch: ADCC0000081
Wanoja Branch: ADCC0000082
Dhanora Branch: ADCC0000083
Manora Branch: ADCC0000084
Shendurjana Branch: ADCC0000085
Poharadevi Branch: ADCC0000086
Sakhardoh Branch: ADCC0000087
Washim Main Branch: ADCC0000088
Washim City Branch: ADCC0000089
Ansing Branch: ADCC0000090
Tondgaon Branch: ADCC0000091
Pardi Takmor Branch: ADCC0000092
Malegaon Branch: ADCC0000093
Kinhiraja Branch: ADCC0000094
Shirpur Jain Branch: ADCC0000095
Medshi Branch: ADCC0000096
Pangrikute Branch: ADCC0000097
Jaulka Railway Branch: ADCC0000098
Risod Main Branch: ADCC0000099
Risod City Branch: ADCC0000100
Rithad Branch: ADCC0000101
Kenwad Branch: ADCC0000102
Mangulzanak Branch: ADCC0000103
Haral Branch: ADCC0000104
Mop Branch: ADCC0000105
Keshav Nagar: ADCC0000106
Wakad: ADCC0000107
Chikhali Extension Counter: ADCC0000108
Kasola: ADCC0000109
Bordi Extension Counter: ADCC0000110
Patni Chowk Branch Washim: ADCC0000111
Asegaon Extension Counter: ADCC0000112
Zp Washim Branch: ADCC0000113
Hiwarkhed Extension Counter: ADCC0000114
Inzori: ADCC0000115
Karanja Market Yard: ADCC0000116

Bank name: The Ahmednagar District Central Co-operative Bank Ltd

(Branch name: IFSC code)
Head Office: AHDC0000001
Adhalgaon: AHDC0000002
Ahmednagar Town: AHDC0000003
Akola: AHDC0000004
Head Office: AHDC00000SC

Bank name: Airtel Payments Bank Limited

(Branch name: IFSC code)
Airtel Payments Branch: AIRP0000001

Bank name: The Ajara Urban Co Op Bank Ltd Ajara

(Branch name: IFSC code)
Rtgs-ho: AJAR0000001
Uttur: AJAR0000002
Gargoti: AJAR0000003
Nesari: AJAR0000004
Deliel Road: AJAR0000005
Chandgad: AJAR0000006
Malakapur: AJAR0000007
Kapshi: AJAR0000008
Pratibhanagar: AJAR0000009
Radhanagari: AJAR0000010
Kabnoor: AJAR0000011
Gadhinglaj: AJAR0000012
Bindu Chowk: AJAR0000013
Tarale: AJAR0000014
Sangav: AJAR0000015
Borivali: AJAR0000016
Bambavade: AJAR0000017
Karve: AJAR0000018
Malavan: AJAR0000019
Thane: AJAR0000020
Koparkhairne: AJAR0000021
Dombivali: AJAR0000022
Chinchwad: AJAR0000023
Rankala: AJAR0000024
Gokul Shirgaon: AJAR0000025
Karad: AJAR0000026
Mudhal Titta: AJAR0000027
Dhankawadi: AJAR0000028
Kadagaon: AJAR0000029
Belgavi: AJAR0000030
Haliyal: AJAR0000031
Nippani: AJAR0000032
Ajara: AJAR0000099

Bank name: Ambarnath Jaihind Coop Bank Ltd Ambarnath

(Branch name: IFSC code)
Rtgs-ho: AJHC0000001
Main Branch: AJHC0001002
Shivaji Nagar: AJHC0001003
Kulgaon Badlapur: AJHC0001004
Wimco Naka Branch: AJHC0001005
Kalyan Branch: AJHC0001006
Manpada: Dombivali Branch: AJHC0001007
Navre Nagar Branch: AJHC0001008
Ambarnath East: Branch: AJHC0001009
Thane Branch: AJHC0001010
Kalyan Chinchpada Branch: AJHC0001011
Vangani Branch: AJHC0001012
Katrap: Badlapur Branch: AJHC0001013
Pune Erandawane Branch: AJHC0001014
Vasind Branch: AJHC0001015
Dhankawadi Pune: AJHC0001016
Pisavali: AJHC0001017
Neral Branch: AJHC0001018
Kohojgaon Branch: AJHC0001099

Bank name: Akola Janata Commercial Cooperative Bank

(Branch name: IFSC code)
Rtgs-ho: AKJB0000001
Malegaon: AKJB0000002
Risod: AKJB0000003
Washim: AKJB0000004
Mangrulpir: AKJB0000005
Karanja: AKJB0000006
Telhara: AKJB0000007
Tajnapeth: AKJB0000008
Tapadia Nagar: AKJB0000009
Gorakshan Road: AKJB0000010
Murtizapur: AKJB0000011
Akot: AKJB0000012
Shirpur: AKJB0000013
Manora: AKJB0000014
Amravati: AKJB0000015
Khamgaon: AKJB0000016
Old City: AKJB0000017
Jalgaon: AKJB0000018
Yavatmal: AKJB0000019
Nagpur: AKJB0000020
Digras: AKJB0000021
Malkapur Road: AKJB0000022
Akot Road: AKJB0000023
Malkapur: AKJB0000024
Parbhani: AKJB0000025
Nanded: AKJB0000026
Kalbadevi: AKJB0000027
Paratwada: AKJB0000028
Chandur Rly: AKJB0000029
Aurangabad: AKJB0000030
Pusad: AKJB0000031
Burhanpur: AKJB0000032
Indore: AKJB0000033
Nasik: AKJB0000035
Shelu Bazar: AKJB0000036
Sindhi Camp: AKJB0000037
Vashi: AKJB0000038
Lonar: AKJB0000039
Wani: AKJB0000040
Mehkar: AKJB0000041

Bank name: Ahmedabad Mercantile Cooperative Bank

(Branch name: IFSC code)
Relief Road: AMCB0660002
Maninagar: AMCB0660003
Naranpura: AMCB0660004
Girdharnagar: AMCB0660005
Mahendikua: AMCB0660007
Panchkuva: AMCB0660008
Paldi: AMCB0660009
Ambawadi: AMCB0660010
Odhav: AMCB0660011
Delhichakla: AMCB0660012
Pankornaka: AMCB0660013
Vatva: AMCB0660014
Latibazar: AMCB0660015
Navrangpura: AMCB0660016
Isanpur: AMCB0660017
Satelite: AMCB0660018
Memnagar: AMCB0660019
Ayojannagar: AMCB0660020
Bapunagar: AMCB0660021
Solaroad: AMCB0660022
Dehgam: AMCB0660023
Mumbai: AMCB0660024
Chandkheda: AMCB0660025
Chandlodia: AMCB0660026
Vadodara: AMCB0660027
Makarpura: AMCB0660028
Changodar: AMCB0660029
Naroda: AMCB0660030
Boriwali: AMCB0660031
Rakhial: AMCB0660032
Nikol Road: AMCB0660033
Rakanpur: AMCB0660034
South Bopal: AMCB0660035
Textile Market Ring Road: AMCB0660036
Rtgs-ho: AMCB0RTGS4S

Bank name: Ahmednagar Merchants Co-op Bank Ltd

(Branch name: IFSC code)
Rtgs-ho: AMDN0000001
Dalmandai: AMDN0000101
Market Yard: AMDN0000102
Kapad Bazar: AMDN0000103
Gulmohar Road: AMDN0000104
Chitale Road: AMDN0000105
Midc: AMDN0000106
Jamkhed: AMDN0000107
Aurangabad: AMDN0000108
Pune: AMDN0000109
Shrigonda: AMDN0000110
Tarakpur: AMDN0000111
Shevgaon: AMDN0000112
Pathardi: AMDN0000113
Sonai: AMDN0000114
Shirur: AMDN0000115
Kada: AMDN0000116
Aurangabad Mondha: AMDN0000117
Narayangaon: AMDN0000118

Bank name: Andhra Bank

(Branch name: IFSC code)
Achanta: ANDB0000001
Adoni: ANDB0000002
Agiripalli: ANDB0000003
Ahmedabad: ANDB0000004
Akiveedu: ANDB0000005
Alamuru: ANDB0000006
Amadalavalasa: ANDB0000007
Amalapuram: ANDB0000008
Amaravathi: ANDB0000009
Amrathalur: ANDB0000010
Ambajipeta: ANDB0000011
Anakapalli: ANDB0000012
Ananthapur: ANDB0000013
Anaparthi: ANDB0000014
Arundelpet: ANDB0000015
Aswaraopet: ANDB0000016
Attili: ANDB0000017
Aska: ANDB0000018
Ashoknagar-chennai: ANDB0000019
Allagadda: ANDB0000020
Alcot Gardens(rajah: ANDB0000021
Adilabad: ANDB0000022
Aryapuram(rajahmundry: ANDB0000023
Gandhinagar(bangalore): ANDB0000024
Asaf Ali Road: ANDB0000025
Atmakur: ANDB0000026
Addanki: ANDB0000027
Andheri: ANDB0000028
Annavaram: ANDB0000029
Indalwai: ANDB0000030
Padma Rao Nagar: ANDB0000031
Bakaram: ANDB0000032
Balajinagar (tirupathi): ANDB0000033
Baliji Peta: ANDB0000034
Vadisaleru: ANDB0000035
Bantumilli: ANDB0000036
Bapatla: ANDB0000037
Bargarh: ANDB0000038
Bazar Branch (vijay: ANDB0000039
Belagam - Parvathi Puram: ANDB0000040
Bellary: ANDB0000041
Berhampur: ANDB0000042
Badrachalam: ANDB0000043
Bhattiprole: ANDB0000044
Bhimadole: ANDB0000045
Bhimavaram: ANDB0000046
Bhopal: ANDB0000047
Bhubhaneshwar: ANDB0000048
Biccavole: ANDB0000049
Bobbili: ANDB0000050
Fort(mumbai): ANDB0000051
Brodipet(guntur): ANDB0000052
Budhavarpet(kurnool): ANDB0000053
Butchireddipalem: ANDB0000054
Burla: ANDB0000055
Bolangir: ANDB0000056
Balanagar: ANDB0000057
Bhimalapuram: ANDB0000058
Banaganapalle: ANDB0000059
Bhongir: ANDB0000061
Ballygunj(kolkata): ANDB0000062
Barracks(berhampur): ANDB0000063
Bitragunta: ANDB0000064
Bhanjanagar: ANDB0000065
Bhushanagulla: ANDB0000066
Bhainsa: ANDB0000067
Bellampalli: ANDB0000068
Bheemunipatnam: ANDB0000069
Kolkata: ANDB0000070
Chagallu: ANDB0000073
Challapalli: ANDB0000074
Cherla: ANDB0000075
Chikkadpally (hyd): ANDB0000076
Chilakaluripet: ANDB0000077
Chimakurthi: ANDB0000078
Chintalapudi: ANDB0000079
Chirala: ANDB0000080
Chittoor: ANDB0000081
Chodavaram: ANDB0000082
Coimbatore: ANDB0000083
Connaught Circus: New Delhi: ANDB0000084
Courtpeta(berhampur: ANDB0000085
Kadapa: ANDB0000086
Cuttack: ANDB0000087
Chikiti Pentho: ANDB0000088
Court Street(ongole: ANDB0000089
Charminar: ANDB0000090
Cooktown: ANDB0000091
Chembur: ANDB0000092
Chamrajpet: ANDB0000093
Fatimanagar Waranga: ANDB0000094
Chandigarh: ANDB0000095
Chitiyala-warangal Dist: ANDB0000096
Calicut(kozhicode): ANDB0000097
Chennur: ANDB0000098
Cantonment: ANDB0000099
Danavaipet: ANDB0000100
Dharmavaram: ANDB0000101
Dnr College: Bhimavaram: ANDB0000102
Dornakal: ANDB0000103
Dowleswaram (rajahmundry): ANDB0000104
Duggirala: ANDB0000105
Dwarakanagar: ANDB0000106
Dwaraka Tirumala: ANDB0000107
Dwarapudi: ANDB0000108
Daba Gardens: Vizag: ANDB0000109
Draksharama: ANDB0000110
Dhone: ANDB0000111
Dangeru: ANDB0000112
Devarakonda: ANDB0000113
Durgapur: ANDB0000114
Dharmaram-medaram: ANDB0000115
Dhanwada: ANDB0000116
Devichowk Rajahmundry: ANDB0000117
Duttalur: ANDB0000118
Dharmavaram: ANDB0000119
Devaruppala: ANDB0000120
Dantalapalli: ANDB0000121
Dilsukhnagar Branch: ANDB0000122
Eluru Main: ANDB0000123
Emani: ANDB0000124
Ernakulam: ANDB0000125
Erode: ANDB0000127
Etcherla: ANDB0000128
Elamarru: ANDB0000129
Ttd Administrative Building: ANDB0000131
Bagh Amber Pet: ANDB0000132
Mandava Kurthi: ANDB0000133
Ring Road: Vijayawada: ANDB0000134
Devapur: ANDB0000135
Dargamitta: ANDB0000136
Duvva: ANDB0000137
Dharmavaram: ANDB0000138
Gagan Mahal Road: ANDB0000139
Ganapavaram: ANDB0000140
Gandhinagar: ANDB0000141
Gandhi Nagar (vijaywada): ANDB0000142
Ghantasala: ANDB0000143
Gollaprole: ANDB0000144
Governorpet (vijaywada): ANDB0000145
Gudivada: ANDB0000146
Gudur: ANDB0000147
Gundugolanu: ANDB0000148
Guntakal: ANDB0000149
Guntur Main: ANDB0000150
Gummalakshmi Puram: ANDB0000151
Gavarapalem-anakapa: ANDB0000152
Gullapalli: ANDB0000153
Gannavaram: ANDB0000154
Gangavathi: ANDB0000155
Gadwal: ANDB0000156
Godavarikhani: ANDB0000157
Gunadala (vijayawada): ANDB0000158
Gopalpur: ANDB0000159
Ghaziabad: ANDB0000160
Gurazala: ANDB0000161
Green Park (new Delhi): ANDB0000162
Gudur: ANDB0000163
Gulbarga: ANDB0000164
Gavinivaripalem: ANDB0000165
Ganguvarisigadam: ANDB0000166
Gorakhpur: ANDB0000167
Gwalior: ANDB0000168
Ghanpur: ANDB0000169
Gooty: ANDB0000170
Gollapalli: ANDB0000171
Gosani Naugaon: ANDB0000172
Gundi Gopalraopet: ANDB0000173
Gobara: ANDB0000174
Gajuwaka: ANDB0000175
Gudiali: ANDB0000176
Girisola: ANDB0000177
Garagaparru: ANDB0000178
Gollavanitippa: ANDB0000179
Mirthipadu: ANDB0000180
Mohammadnagar: ANDB0000181
Ramireddipet: ANDB0000182
Cinema Road (kakinada): ANDB0000183
Yellayapalem: ANDB0000184
Akkayyapalem: ANDB0000185
Women Branch: ANDB0000186
Ponnalur: ANDB0000187
Baramunda(bhubaneswar): ANDB0000188
Balajinagar(nellore): ANDB0000189
East Gangavaram: ANDB0000190
Elurupadu: ANDB0000191
Kothapet: ANDB0000192
Seetharampuram: ANDB0000193
Palakkad: ANDB0000194
Petbashirabad: ANDB0000195
Kambaladinne: ANDB0000196
Banswada: ANDB0000197
Tiruchirapally(trichy): ANDB0000198
Pondicherry: ANDB0000199
Hanuman Junction: ANDB0000200
Himayatnagar: ANDB0000201
Hindupur: ANDB0000202
Hindu College Campus: ANDB0000203
Hospet: ANDB0000204
Sultan Bazar Branch: ANDB0000205
Hanumakonda: ANDB0000206
Hyderbasthi: ANDB0000207
Hyderguda: ANDB0000208
Huzurnagar: ANDB0000209
Hirakud: ANDB0000210
Howrah: ANDB0000211
H M T Industrial Estate: ANDB0000212
Huzurabad: ANDB0000213
Hubli-dharwar: ANDB0000214
Kamareddy: ANDB0000215
Ramnagar: ANDB0000217
Jubileehills Branch: ANDB0000218
Ameerpet: ANDB0000222
Ajitsingnagar (vijayawada): ANDB0000223
Sriharipuram: ANDB0000224
Zonal Office - Guntur: ANDB0000226
Annanagar(chennai): ANDB0000227
Malgodown(cuttack): ANDB0000228
Bantwaram: ANDB0000229
Ichapuram: ANDB0000230
Innispet Rajahmundry: ANDB0000231
Inkollu: ANDB0000232
Intur: ANDB0000233
Indore: ANDB0000234
Indravally: ANDB0000235
Injaram: ANDB0000236
Ipuru: ANDB0000237
Ghatkopar (west): ANDB0000238
Zonal Office-warangal: ANDB0000239
Tirumalgiri: ANDB0000240
Investments And International Banking: ANDB0000241
Kannavarithota(guntur): ANDB0000242
Bhrugubanda: ANDB0000243
Zonal Office Bhubaneshwar: ANDB0000244
Pithapuram Colony: ANDB0000245
Vedulapalli: ANDB0000246
Bayyanagudem: ANDB0000247
Begumpet: ANDB0000248
Gollamamidada: ANDB0000249
Kagupadu: ANDB0000250
Katarinagar: ANDB0000251
Tirumalampalem: ANDB0000252
Sompur: ANDB0000253
Medapi: ANDB0000254
Mowbrays Road: ANDB0000255
Jagannaikpur(kakinada): ANDB0000256
Jaggayyapet: ANDB0000257
Jagtial: ANDB0000258
Jangareddygudem: ANDB0000259
Jeypore: ANDB0000260
Janagaon: ANDB0000261
Jadcherla: ANDB0000262
Jammikunta: ANDB0000263
Jammalapalem: ANDB0000264
Jalna: ANDB0000265
Jabalpur: ANDB0000266
Janagalapalli: ANDB0000267
Janakpuri (new Delhi): ANDB0000268
Jaipur: ANDB0000269
Jullapally: ANDB0000270
Jaldanki: ANDB0000271
Javvarpet(machilipatnam): ANDB0000272
Jayanagar(bangalore: ANDB0000273
Jatprole: ANDB0000274
Jajpur Road:: ANDB0000275
Jangampalli: ANDB0000276
Juntupalli:: ANDB0000277
Mukkamala: ANDB0000278
Chebrole: ANDB0000279
Jammalapuram: ANDB0000280
Thokada: ANDB0000281
Goneda: ANDB0000283
Vepulaparty: ANDB0000285
Thummadam (mukundapuram): ANDB0000286
Karaya Road(calcutta): ANDB0000287
Munshibazar(calcutta): ANDB0000288
Indiranagar: ANDB0000289
Vadlagudem: ANDB0000290
Lakshmapur: ANDB0000291
China Musala Reddy: ANDB0000292
Ashoknagar(kurnool): ANDB0000293
Krishnaraopet: ANDB0000294
Karupatti: ANDB0000295
Kanuru: ANDB0000296
Konakanchi: ANDB0000297
Kopalle: ANDB0000298
Kazipet: ANDB0000299
Kadiam: ANDB0000300
Kadiri: ANDB0000301
K M C Campus (warangal): ANDB0000302
Kakinada: ANDB0000303
Kandukur: ANDB0000304
Kapileshwarapuram: ANDB0000305
Karimnagar: ANDB0000306
Karol Bagh (new Delhi): ANDB0000307
Kasibugga: ANDB0000308
Kavali: ANDB0000309
Khairatabad: ANDB0000310
Khammam: ANDB0000311
Kharagpur: ANDB0000312
Kirlampudi: ANDB0000313
Koretipadu(guntur): ANDB0000314
Kothagudem: ANDB0000315
Kothapeta: ANDB0000316
Kovvali: ANDB0000317
Kovvur: ANDB0000318
Kowtharam: ANDB0000319
Kurnool Main: ANDB0000320
Kachiguda: ANDB0000321
Krishnalanka (vijay: ANDB0000322
Kakaraparru: ANDB0000323
Kashinagar: ANDB0000324
Kolluru: ANDB0000325
Katur: ANDB0000326
Kapra Sainikpuri: ANDB0000327
Kamavarapukota: ANDB0000328
Kodad: ANDB0000329
Koratla: ANDB0000330
Kaikaluru: ANDB0000331
Karamchedu: ANDB0000332
Kovur: ANDB0000333
Kothakota: ANDB0000334
K Kannapuram: ANDB0000335
Kanigiri: ANDB0000336
Kalyandurg: ANDB0000337
Kolakaluru: ANDB0000338
Kothacheruvu: ANDB0000339
Ludhiana: ANDB0000340
Lankalakoderu: ANDB0000341
Lic Building(machil: ANDB0000342
Labbipet (vijayawad: ANDB0000343
Lucknow: ANDB0000344
Macherla: ANDB0000345
Founders Branch Machilipatnam: ANDB0000346
Madhavanagar(kakinada): ANDB0000347
Chennai Main: ANDB0000348
Madurai: ANDB0000349
Mahabubnagar: ANDB0000350
Maharanipet: ANDB0000351
Malakpet: ANDB0000352
Malkapuram: ANDB0000353
Venkatarayapuram: ANDB0000354
Mandapeta: ANDB0000355
Marredpalli: ANDB0000356
Miryalguda: ANDB0000357
Morrispet: Tenali: ANDB0000358
Mummidivaram: ANDB0000359
Mylapore: ANDB0000360
Malkipuram: ANDB0000361
Mancherial: ANDB0000363
Matunga: ANDB0000364
Moberlipeta(amalapu: ANDB0000365
Mangalagiri: ANDB0000366
Mahabubabad: ANDB0000367
Metpally: ANDB0000368
Mogaltur: ANDB0000369
Madanapalli: ANDB0000370
Machavaram (vijayaw): ANDB0000371
Mall: ANDB0000372
Madhavaram: ANDB0000373
Nuthapalli: ANDB0000374
Mondikunta: ANDB0000375
Nagayalanka: ANDB0000376
Nagpur: ANDB0000377
Nampalli: ANDB0000378
Nandyal: ANDB0000379
Narsannapet: ANDB0000380
Narsaraopet: ANDB0000381
Narsapur: ANDB0000382
Narsipatnam: ANDB0000383
Nellore: ANDB0000384
New Town Ananthapur: ANDB0000385
Nidadavole: ANDB0000386
Nizamabad: ANDB0000387
Nuzvid: ANDB0000388
Nalgonda: ANDB0000389
Nandikotkur: ANDB0000390
Nirmal: ANDB0000391
N.r.road (bangalore): ANDB0000392
Nidumolu: ANDB0000393
Nandigama: ANDB0000394
Narasampet: ANDB0000395
Navuduru: ANDB0000396
Narayanguda: ANDB0000397
New Alipore (Calcutta): ANDB0000398
Nagarjunasagar: ANDB0000399
Ongole: ANDB0000400
Nizamshahi Road: ANDB0000401
Opera House: ANDB0000402
Old Guntur (guntur): ANDB0000403
Mamidipally: ANDB0000404
Machipada: ANDB0000405
Padmanabham: ANDB0000406
Palkur: ANDB0000407
Sirigindalapadu: ANDB0000409
S.k. University: ANDB0000410
Penugolanu: ANDB0000411
Pedavaduguru: ANDB0000412
Pragadavaram: ANDB0000413
Ponkal Jannaram: ANDB0000414
Parbhani: ANDB0000415
Peravali: ANDB0000416
Pentlavalli: ANDB0000417
Patna: ANDB0000418
Pittalavanipalem: ANDB0000419
Palakol: ANDB0000420
Pamarru: ANDB0000421
Pamidi: ANDB0000422
Parvathipuram: ANDB0000423
Patamata: ANDB0000424
Pattabhipuram (guntur): ANDB0000425
Pattabhi Road(machi: ANDB0000426
Pedana: ANDB0000427
Peddapuram: ANDB0000428
Penugonda: ANDB0000429
Penumantra: ANDB0000430
Phirangipuram: ANDB0000431
Pithapuram: ANDB0000432
Ponnur: ANDB0000433
Port Branch: ANDB0000434
Prakashamnagar: ANDB0000435
Prattipadu: ANDB0000436
Proddatur: ANDB0000437
Parlakhemundi: ANDB0000438
Palakonda: ANDB0000439
Pamarru: ANDB0000440
Piler: ANDB0000441
Patnam Bazar(guntur: ANDB0000442
Pamur: ANDB0000443
Penamaluru: ANDB0000444
Perala: ANDB0000445
Prakashnagar (rajahmundry): ANDB0000446
Piduguralla: ANDB0000447
Peddapalli: ANDB0000448
Pitlam: ANDB0000449
Pulletikurru: ANDB0000450
Punur: ANDB0000451
Pulivendla: ANDB0000452
Polasara: ANDB0000453
Pentapadu: ANDB0000454
Ramachandrapuram:: ANDB0000455
Palavancha: ANDB0000456
Pothakapalli: ANDB0000457
Puri: ANDB0000458
Podili: ANDB0000459
Quilon: ANDB0000460
Kundarali: ANDB0000461
Hinjilicut: ANDB0000462
Ramireddipalli: ANDB0000464
Rajahmundry: ANDB0000465
Rajam: ANDB0000466
Ramachandrapuram: ANDB0000467
Ramachandraraopet: ANDB0000468
Ramaraopet(kakinada): ANDB0000469
Ravulapalem: ANDB0000470
Rayagada: ANDB0000471
Rayavaram: ANDB0000472
Razole: ANDB0000473
Relangi: ANDB0000475
Rentachintala: ANDB0000476
Repalle: ANDB0000477
Ranchi: ANDB0000478
Rambha: ANDB0000479
Rajampet: ANDB0000480
R K Puram (new Delhi): ANDB0000481
Ravinuthala: ANDB0000482
Rudrampur: ANDB0000483
Ryali: ANDB0000484
Ramanthapur: ANDB0000485
Ramnagar-coimbatore: ANDB0000486
Rayadurg: ANDB0000487
Ramakrishanapur: ANDB0000488
Royapetah(narsapur): ANDB0000489
Rajbhavan Road: ANDB0000490
Raichur: ANDB0000491
Rourkela: ANDB0000492
Raipur: ANDB0000493
Rajajinagar: ANDB0000494
Ranasthalam: ANDB0000495
Rangampet(rcb): ANDB0000496
Rudrangi: ANDB0000497
Rajupalem: ANDB0000498
Rajavommangi: ANDB0000499
Salem: ANDB0000500
Salur: ANDB0000501
Samalkot: ANDB0000502
Sattenapalli: ANDB0000503
Satyanarayanapuram: ANDB0000504
Rp Road: ANDB0000505
Shenoynagar:: ANDB0000506
Sidhantam: ANDB0000507
Simhachalam: ANDB0000508
Singarayakonda: ANDB0000509
Seetharampuram (vij: ANDB0000510
Sompet: ANDB0000511
Sowcarpet: ANDB0000512
Srikakulam: ANDB0000513
Srikalahasthi: ANDB0000514
Srisailam: ANDB0000515
Srungavruksham: ANDB0000516
Stonehousepet: ANDB0000517
Suryapet: ANDB0000518
Suryaraopet(kakinad: ANDB0000519
S V Medical College: ANDB0000520
Saidabad: ANDB0000521
S R Nagar: ANDB0000522
Suryaraopet: ANDB0000523
Siddipet: ANDB0000524
Srikakulam: ANDB0000525
Sanath Nagar: ANDB0000526
Sithanagaram: ANDB0000527
Siricilla: ANDB0000528
Sebastian Road: ANDB0000529
Shamsheergunj: ANDB0000530
Srinagar Colony: ANDB0000531
Sangam Jagarlamudi: ANDB0000532
Saifabad: ANDB0000533
Somajiguda: ANDB0000534
Vidyadharapuram (vi: ANDB0000535
Sirpur Kagaznagar: ANDB0000536
Sambalpur: ANDB0000537
Surat: ANDB0000538
Shergada: ANDB0000539
Seethammadhara: ANDB0000540
Sadasivnagar: ANDB0000541
Srikurmam: ANDB0000542
Sri Nagar Colony: ANDB0000543
Saidapet: ANDB0000544
Sithaphalmandi: ANDB0000545
Bhyri Singupuram: ANDB0000546
Sholapur: ANDB0000547
Santosh Nagar Colony: ANDB0000548
Sangam: ANDB0000549
Tadepalligudem: ANDB0000550
Tadikonda: ANDB0000551
Tadipatri: ANDB0000552
Tallapudi: ANDB0000553
Tanuku: ANDB0000554
Tenali Main: ANDB0000555
Thimmasamudram: ANDB0000556
T Nagar(chennai): ANDB0000557
Tirumala: ANDB0000558
Tirupathi: ANDB0000559
Tirupur: ANDB0000560
Tuni: ANDB0000561
Tekkali: ANDB0000562
Tiruvur: ANDB0000563
Triplicane(chennai): ANDB0000564
Tandur: ANDB0000565
Thurpu Vipparru: ANDB0000566
Thiruvananthapuram: ANDB0000567
Tuticorin: ANDB0000568
Tatanagar: ANDB0000569
Talupula: ANDB0000570
Thane: ANDB0000571
Tatipaka: ANDB0000572
Tekmal: ANDB0000573
Tallarevu: ANDB0000574
Teki: ANDB0000575
Tyallur: ANDB0000576
Tarnaka: ANDB0000578
Tandur: ANDB0000579
Undi: ANDB0000580
Uppugundur: ANDB0000581
Uppada Kothapalli: ANDB0000582
Uppalaguptam: ANDB0000583
Uppalapadu: ANDB0000584
Udaipur: ANDB0000585
Lajpatnagar (new De: ANDB0000586
Lawrence Road: ANDB0000587
Ghatkopar (east): ANDB0000588
Vinayakapuram: ANDB0000589
Vemulakonda: ANDB0000590
Donkarai: ANDB0000591
Dokiparru: ANDB0000592
Juhu Ville-parle (mumbai): ANDB0000593
Jodhpur: ANDB0000594
Guwahati: ANDB0000595
Hyderabad Road(nizamabad): ANDB0000596
Vaikunthapuram: ANDB0000597
Kuppam: ANDB0000598
Veerankilock: ANDB0000600
Velangi: ANDB0000601
Venkatagiri: ANDB0000602
Vetapalem: ANDB0000603
Vidyanagar: ANDB0000604
Vijayanagar Colony: ANDB0000605
Vijayawada: ANDB0000606
Vinukonda: ANDB0000607
Visakhapatnam: ANDB0000608
Vizianagaram: ANDB0000609
Vundrajavaram: ANDB0000610
Vuyyur: ANDB0000611
Perur: ANDB0000612
Vikarabad: ANDB0000613
Vakadu: ANDB0000614
Veeraghattam: ANDB0000615
Vellore: ANDB0000616
Veerannapalem: ANDB0000617
Vavilala: ANDB0000618
Vemsur: ANDB0000619
Varanasi: ANDB0000620
Vempa: ANDB0000621
Valasaravakkam: ANDB0000622
Vemulawada: ANDB0000623
Veenavanka: ANDB0000624
Vasantawada: ANDB0000625
Veerabhadrapuram (rajahmundry): ANDB0000626
Vashi: ANDB0000627
Viswas Nagar (new Delhi): ANDB0000628
Warangal: ANDB0000630
Woodpeta: ANDB0000631
Wanaparthy: ANDB0000632
Waltair: ANDB0000633
Wardha: ANDB0000634
W.gonagudem: ANDB0000635
Wyra: ANDB0000636
Washermanpet: ANDB0000637
Gowripatnam: ANDB0000638
Bhanur: ANDB0000639
Panaji: ANDB0000640
Kompalli Serole: ANDB0000641
Kesamudram: ANDB0000642

```
{% endcapture %}

{% include language-tabbar.html prefix="inr-bank-options" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note** `INR::Bank` payouts are currently in beta phase.
</div>
