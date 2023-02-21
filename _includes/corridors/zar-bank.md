{% include corridors/recipient_name.md %}

## ZAR::Bank

For South African bank payments please use the following recipient details:

{% if include.recipient_type == 'business' %}
  {% capture additional_details %},
  "contact_first_name": "First",
  "contact_last_name": "Last",
  "legal_entity_type": "privately_owned_company",
  "registration_number": "VAT1234567", // optional
  "nature_of_business": "retail_trade" // optional{% endcapture %}
{% endif %}

{% capture data-raw %}
```javascript
"details": {
  {{ recipient_name }},
  "street": "14 Main Street", // should include house number as well
  "postal_code": "AB0001",
  "city": "Cape Town",
  "email": "recipient@email.com", // optional, but highly recommended
  "bank_code": "632005",
  "bank_account": "12345678",
  "phone_number": "+27119785313", // E.164 international format
  "transfer_reason": "personal_account"{{ additional_details }}
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-details" raw=data-raw %}

The current banks supported and their `bank_code` values are:

{% capture data-raw-bank-code %}

```
ABSA: 632005
Access Bank: 410506
African Bank: 430000
Albaraka Bank: 800000
Bank of China: 686000
Bank Zero: 888000
Bidvest Bank: 462005
BNP Paribas: 688000
Capitec Bank: 470010
Citibank: 350005
China Construction Bank: 586666
Discovery Bank: 679000
Finbond Mutual Bank: 589000
First National Bank: 250655
Grindrod Bank: 584000
Habib Overseas Bank Limited: 700066
HBZ Bank: 570100
HSBC Bank: 587000
ICICI Bank: 362000
Investec: 580105
JP Morgan Bank: 432000
Mercantile Bank: 450905
Nedbank: 198765
Olympus Mobile: 585001
Peoples Bank: 720026
PEP Bank: 400001
Permanent Bank: 760005
Rand Merchant Bank: 261251
Reserve Bank: 980172
SA Post Office: 460005
Sasfin Bank: 683000
Standard Bank: 051001
Standard Chartered Bank: 730020
State Bank of India: 801000
Tyme Bank: 678910
Ubank: 431010
Unibank Limited: 790005
VBS: 588000
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-details" raw=data-raw-bank-code %}

{% capture data-raw-entity-types %}
```
Sole Proprietorship: sole_proprietorship
Partnership: partnership
Privately Owned Company (Limited Company): privately_owned_company
Publicly Listed Company (PLC): publicly_owned_company
Government Owned Entity Trusts: government_owned_entity
GO (Majority Owned Subsidiary of State-Owned Company): go
Financial Institution: financial_institution
```
{% endcapture %}

{% capture data-raw-nature-of-business %}
```
- Personal: personal
- Agriculture and Hunting: agriculture_and_hunting
- Forestry: forestry
- Fishing: fishing
- Agricultural By-Products: agricultural_by_products
- Coal Mining: coal_mining
- Oil Mining: oil_mining
- Iron Ore Mining: iron_ore_mining
- Other Metal and Diamond Mining: other_metal_and_diamond_mining
- Other Mineral Mining: other_mineral_mining
- Manufacture of Food/Drink/Tobacco: manufacturing_of_food_drink_tobacco
- Manufacture of Textiles/Leather/Fur/Furniture: manufacturing_of_textiles_leather_fur_furniture
- Manufacture of Wooden Products/Furniture: manufacture_of_wooden_products_furniture
- Manufacture of Paper/Pulp/Allied Products: manufacture_of_paper_pulp_allied_products
- Manufacture Of Chemicals Medical Petroleum Rubber Plastic Products: manufacture_of_chemicals_medical_petroleum_rubber_plastic_products
- Manufacture Of Pottery China Glass Stone: manufacture_of_pottery_china_glass_stone
- Manufacture Of Iron Steel Non-Ferrous Metals Basic Industries: manufacture_of_iron_steel_non_ferrous_metals_basic_industries
- Manufacture Of Metal Products Electrical And Scientific Engineering: manufacture_of_metal_products_electrical_and_scientific_engineering
- Manufacture Of Jewelry Musical Instruments Toys: manufacture_of_jewelry_musical_instruments_toys
- Electricity, Gas And Water: electricity_gas_and_water
- Construction: construction
- Wholesale Trade: wholesale_trade
- Retail Trade: retail_trade
- Catering Incl. Hotels: catering_incl_hotels
- Transport Storage: transport_storage
- Communications: communications
- Finance And Holding Companies: finance_and_holding_companies
- Insurance: insurance
- Business Services: business_services
- Real Estate Development Investment: real_estate_development_investment
- Central State Governments: central_state_governments
- Community Services Defence Police Prisons Etc: community_services_defence_police_prisons_etc
- Social Services Education Health Care: social_services_education_health_care
- Personal Services - Leisure Services: personal_services_leisure_services
- Personal Services - Domestic Laundry Repairs: personal_services_domestic_laundry_repairs
- Personal Services - Embassies: personal_services_embassies_international_organisations
```
{% endcapture %}

{% if include.recipient_type == 'business' %}
  The company types supported and corresponding `legal_entity_type` are:

  {% include language-tabbar.html prefix="zar-entity-types" raw=data-raw-entity-types %}

  The valid values for `nature_of_business` are the following:

  {% include language-tabbar.html prefix="zar-nature-of-business" raw=data-raw-nature-of-business %}
{% endif %}

{% include corridors/transfer_reasons.md %}

Please note that due to regulatory reasons senders trying to create `ZAR::Bank` transactions are required to have the following fields on the sender present as well:
`street`, `city` and `postal_code`

<div class="alert alert-info" markdown="1">
**Note** To accept payments in South Africa the recipient has to sign a mandate form online. The link to the form will be sent over the recipient's mobile phone number and email address, and have to be filled out online. Once the mandate is signed it is valid for one year and the recipient doesn't need to do these steps again. When sending funds to the same recipient please make sure their name and bank details are the same, otherwise they might be asked to sign the mandate form again.
</div>

<div class="alert alert-warning" markdown="1">
**Warning** `ZAR::Bank` payouts are currently in beta phase.
</div>
