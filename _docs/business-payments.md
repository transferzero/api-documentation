---
title: Business payments
permalink: /docs/business-payments/
---

* Table of contents
{:toc}

This document lists the required details that needs to be sent for each of our payout corridor

<div class="alert alert-info" markdown="1">
**Note** Occasionally there might be issues with one of the corridors and we might have to disable them temporarily. Once youre onboarded we'll let you know if this happens. Also if you're trying to use a disabled corridor you're going to receive a validation error stating that the corridor is not active, and you won't be able to create new transactions there.
</div>

Our system not only allows transactions from personal senders to personal recipients, but also to and from business senders and business recipients. Note however that regulatory and other requirements might be more strict for these transactions, so before you start implementing business transactions please reach out to our sales and account management team for more information.

<div class="alert alert-warning" markdown="1">
**Warning!** Business transactions are not available to/from all of our corridors. Make sure you reach out to our team to know what is allowed before proceeding with the implementation!
</div>

# Business senders

For business senders you need to provide different details than for personal senders. More specifically you need to provide:

* Name of the company
* Country of incorporation
* Registration date and number
* Trading address
* Company's type
* Industry / nature of business

Please see the following example on how to provide these fields:

{::comment}
CODE_EXAMPLE_START business-sender-creation
JSON_START
{
    "type": "business",
    "name": "Company name",

    // Country of Incorporation
    "country": "US",

    // Trading address of the company
    "trading_country": "US",
    "city": "New York",
    "street": "20 W 34th St",
    "postal_code": "10001",
    "address_description": "",

    // Company Details
    "legal_entity_type": "privately_owned_company", // company type
    "registration_date": "2012-01-25",
    "registration_number": "VAT1234567",
    "nature_of_business": "retail_trade", // industry

    // Contact Details
    "phone_country": "US",
    "phone_number": "5555551234",
    "email": "example@home.org",

    // ID of the sender in your system
    "external_id": "Sender:Business:US:234523",

    // these fields are mandatory, but you can usually leave them with the following default values:
    "documents": [ ],
    "ip": "127.0.0.1",
    "metadata": {}
}
JSON_END

CODE_START
CREATE_START sender Sender
SET ENUM type TypeEnum business
SET LIT name "Company Name"

COMMENT Country of Incorporation
SET LIT country "US"

COMMENT Trading address of the company
SET LIT trading_country "US"
SET LIT city "New York"
SET LIT street "20 W 34th St"
SET LIT postal_code "10001"
SET LIT address_description ""

COMMENT Company Details
SET ENUM legal_entity_type LegalEntityTypeEnum privately_owned_company
SET DATE registration_date 2012-01-25"
SET LIT registration_number "VAT1234567"
SET ENUM nature_of_business NatureOfBusinessEnum retail_trade

COMMENT Contact Details
SET LIT phone_country "US"
SET LIT phone_number "5555551234"
SET LIT email "info@transferzero.com"

COMMENT ID of the sender in your system
SET LIT external_id "Sender:Business:234523"

COMMENT you'll need to set these fields but usually you can leave them the default
SET LIT ip "127.0.0.1"
SET EMPTY_ARRAY documents Document
CREATE_END
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
{
    "type": "business",
    "name": "Company name",

    // Country of Incorporation
    "country": "US",

    // Trading address of the company
    "trading_country": "US",
    "city": "New York",
    "street": "20 W 34th St",
    "postal_code": "10001",
    "address_description": "",

    // Company Details
    "legal_entity_type": "privately_owned_company", // company type
    "registration_date": "2012-01-25",
    "registration_number": "VAT1234567",
    "nature_of_business": "retail_trade", // industry

    // Contact Details
    "phone_country": "US",
    "phone_number": "5555551234",
    "email": "example@home.org",

    // ID of the sender in your system
    "external_id": "Sender:Business:US:234523",

    // these fields are mandatory, but you can usually leave them with the following default values:
    "documents": [ ],
    "ip": "127.0.0.1",
    "metadata": {}
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
Sender sender = new Sender(
  type: TypeEnum.BUSINESS,
  name: "Company Name",

// Country of Incorporation
  country: "US",

// Trading address of the company
  tradingCountry: "US",
  city: "New York",
  street: "20 W 34th St",
  postalCode: "10001",
  addressDescription: "",

// Company Details
  legalEntityType: LegalEntityTypeEnum.PRIVATELY_OWNED_COMPANY,
  registrationDate: DateTime.Parse(2012-01-25"),
  registrationNumber: "VAT1234567",
  natureOfBusiness: NatureOfBusinessEnum.RETAIL_TRADE,

// Contact Details
  phoneCountry: "US",
  phoneNumber: "5555551234",
  email: "info@transferzero.com",

// ID of the sender in your system
  externalId: "Sender:Business:234523",

// you'll need to set these fields but usually you can leave them the default
  ip: "127.0.0.1",
  documents: new List<Document>());
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim sender as Sender = New Sender(
  type:=TypeEnum.BUSINESS,
  name:="Company Name",

' Country of Incorporation
  country:="US",

' Trading address of the company
  tradingCountry:="US",
  city:="New York",
  street:="20 W 34th St",
  postalCode:="10001",
  addressDescription:="",

' Company Details
  legalEntityType:=LegalEntityTypeEnum.PRIVATELY_OWNED_COMPANY,
  registrationDate:=DateTime.Parse(2012-01-25"),
  registrationNumber:="VAT1234567",
  natureOfBusiness:=NatureOfBusinessEnum.RETAIL_TRADE,

' Contact Details
  phoneCountry:="US",
  phoneNumber:="5555551234",
  email:="info@transferzero.com",

' ID of the sender in your system
  externalId:="Sender:Business:234523",

' you'll need to set these fields but usually you can leave them the default
  ip:="127.0.0.1",
  documents:=New List(Of Document)()))
```
{% endcapture %}

{% capture data-java %}
```java
Sender sender = new Sender();
sender.setType(TypeEnum.BUSINESS);
sender.setName("Company Name");

// Country of Incorporation
sender.setCountry("US");

// Trading address of the company
sender.setTradingCountry("US");
sender.setCity("New York");
sender.setStreet("20 W 34th St");
sender.setPostalCode("10001");
sender.setAddressDescription("");

// Company Details
sender.setLegalEntityType(LegalEntityTypeEnum.PRIVATELY_OWNED_COMPANY);
sender.setRegistrationDate(LocalDate.parse("2012-01-25"));
sender.setRegistrationNumber("VAT1234567");
sender.setNatureOfBusiness(NatureOfBusinessEnum.RETAIL_TRADE);

// Contact Details
sender.setPhoneCountry("US");
sender.setPhoneNumber("5555551234");
sender.setEmail("info@transferzero.com");

// ID of the sender in your system
sender.setExternalId("Sender:Business:234523");

// you'll need to set these fields but usually you can leave them the default
sender.setIp("127.0.0.1");
sender.setDocuments(new ArrayList<>());
```
{% endcapture %}

{% capture data-js %}
```js
const sender = new TransferZeroSdk.Sender();
sender.type = "business";
sender.name = "Company Name";

// Country of Incorporation
sender.country = "US";

// Trading address of the company
sender.trading_country = "US";
sender.city = "New York";
sender.street = "20 W 34th St";
sender.postal_code = "10001";
sender.address_description = "";

// Company Details
sender.legal_entity_type = "privately_owned_company";
sender.registration_date = 2012-01-25";
sender.registration_number = "VAT1234567";
sender.nature_of_business = "retail_trade";

// Contact Details
sender.phone_country = "US";
sender.phone_number = "5555551234";
sender.email = "info@transferzero.com";

// ID of the sender in your system
sender.external_id = "Sender:Business:234523";

// you'll need to set these fields but usually you can leave them the default
sender.ip = "127.0.0.1";
sender.documents = [];
```
{% endcapture %}

{% capture data-php %}
```php
$sender = new Sender();
$sender->setType("business");
$sender->setName("Company Name");

// Country of Incorporation
$sender->setCountry("US");

// Trading address of the company
$sender->setTradingCountry("US");
$sender->setCity("New York");
$sender->setStreet("20 W 34th St");
$sender->setPostalCode("10001");
$sender->setAddressDescription("");

// Company Details
$sender->setLegalEntityType("privately_owned_company");
$sender->setRegistrationDate(2012-01-25");
$sender->setRegistrationNumber("VAT1234567");
$sender->setNatureOfBusiness("retail_trade");

// Contact Details
$sender->setPhoneCountry("US");
$sender->setPhoneNumber("5555551234");
$sender->setEmail("info@transferzero.com");

// ID of the sender in your system
$sender->setExternalId("Sender:Business:234523");

// you'll need to set these fields but usually you can leave them the default
$sender->setIp("127.0.0.1");
$sender->setDocuments([]);
```
{% endcapture %}

{% capture data-ruby %}
```ruby
sender = TransferZero::Sender.new
sender.type = "business"
sender.name = "Company Name"

# Country of Incorporation
sender.country = "US"

# Trading address of the company
sender.trading_country = "US"
sender.city = "New York"
sender.street = "20 W 34th St"
sender.postal_code = "10001"
sender.address_description = ""

# Company Details
sender.legal_entity_type = "privately_owned_company"
sender.registration_date = "2012-01-25"
sender.registration_number = "VAT1234567"
sender.nature_of_business = "retail_trade"

# Contact Details
sender.phone_country = "US"
sender.phone_number = "5555551234"
sender.email = "info@transferzero.com"

# ID of the sender in your system
sender.external_id = "Sender:Business:234523"

# you'll need to set these fields but usually you can leave them the default
sender.ip = "127.0.0.1"
sender.documents = []
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-business-sender-creation" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

The valid values for the company type / legal entity type are the following:

{% capture data-raw %}
```markdown
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

<div class="alert alert-info" markdown="1">
**Note!** If you select `financial_institution` then the fields `vat_registration_number`, `financial_regulator` and `regulatory_licence_number` will be mandatory for the sender as well.
</div>

The valid values for the industry / nature of business are the following:

{% capture data-raw %}
```markdown
- personal: Personal
- agriculture_and_hunting: Agriculture and Hunting
- forestry: Forestry
- fishing: Fishing
- agricultural_by_products: Agricultural By-Products
- coal_mining: Coal Mining
- oil_mining: Oil Mining
- iron_ore_mining: Iron Ore Mining
- other_metal_and_diamond_mining: Other Metal and Diamond Mining
- other_mineral_mining: Other Mineral Mining
- manufacturing_of_food_drink_tobacco: Manufacture of Food/Drink/Tobacco
- manufacturing_of_textiles_leather_fur_furniture: Manufacture of Textiles/Leather/Fur/Furniture
- manufacture_of_wooden_products_furniture: Manufacture of Wooden Products/Furniture
- manufacture_of_paper_pulp_allied_products: Manufacture of Paper/Pulp/Allied Products
- manufacture_of_chemicals_medical_petroleum_rubber_plastic_products: Manufacture Of Chemicals Medical Petroleum Rubber Plastic Products
- manufacture_of_pottery_china_glass_stone: Manufacture Of Pottery China Glass Stone
- manufacture_of_iron_steel_non_ferrous_metals_basic_industries: Manufacture Of Iron Steel Non-Ferrous Metals Basic Industries
- manufacture_of_metal_products_electrical_and_scientific_engineering: Manufacture Of Metal Products Electrical And Scientific Engineering
- manufacture_of_jewelry_musical_instruments_toys: Manufacture Of Jewelry Musical Instruments Toys
- electricity_gas_and_water: Electricity, Gas And Water
- construction: Construction
- wholesale_trade: Wholesale Trade
- retail_trade: Retail Trade
- catering_incl_hotels: Catering Incl. Hotels
- transport_storage: Transport Storage
- communications: Communications
- finance_and_holding_companies: Finance And Holding Companies
- insurance: Insurance
- business_services: Business Services
- real_estate_development_investment: Real Estate Development Investment
- central_state_governments: Central State Governments
- community_services_defence_police_prisons_etc: Community Services Defence Police Prisons Etc
- social_services_education_health_care: Social Services Education Health Care
- personal_services_leisure_services: Personal Services - Leisure Services
- personal_services_domestic_laundry_repairs: Personal Services - Domestic Laundry Repairs
- personal_services_embassies_international_organisations: Personal Services - Embassies
```
{% endcapture %}

{% include language-tabbar.html prefix="nature-of-business-details" raw=data-raw %}

# Business recipients

## Ghana

### GHS::Bank

For Ghanan bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  "name": "Company name",
  "bank_code": "030100",
  "bank_account": "123456789"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-details" raw=data-raw %}

The current banks supported and their `bank_codes` values are:

{% capture data-raw %}
```
ABSA Ghana Bank (formerly Barclays): 030100
Access Bank: 280100
Agricultural Development Bank: 080100
Bank of Africa: 210100
CAL Bank: 140100
Ecobank: 130100
Fidelity Bank: 240100
First Atlantic Bank: 170100
First Bank Nigeria: 200100
First National Bank: 330100
GCB Bank: 040100
Guaranty Trust Bank: 230100
Heritage Bank: 370100
National Investment Bank: 050100
Prudential Bank: 180100
Republic HFC Bank: 110100
Stanbic Bank: 190100
Standard Chartered Bank: 020100
United Bank for Africa: 060100
Zenith Bank: 120100
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-options" raw=data-raw %}

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

## Europe / SEPA

### EUR::Bank

For EUR IBAN transfers please use:

{% capture data-raw %}
```javascript
"details": {
  "name": "Company name",
  "iban": "DE89370400440532013000",
  "bank_name": "Deutsche Bank", // Optional
  "bic": "DEUTDEBBXXX" // Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="eur-bank-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning!** If the recipient account is not an `EUR` account then the recipient's bank might charge for converting the received funds from `EUR` to the local currency.
</div>

<div class="alert alert-info" markdown="1">
**Note!** Transfer is done using the fastest method available on the recipient's bank.

* If the recipient's bank supports the Instant Payment network funds will arrive within 2 hours (but usually within a couple minutes)
* If the recipient's bank supports the SEPA system, funds will arrive within 1-2 business days
* If the recipient's bank only supports the Swift system, funds will arrive within 2-5 business days
</div>

### GBP::Bank

For GBP::Bank there are two payout options available:

1. GBP Payments with account number and sort code
2. GBP IBAN transfers

For GBP Payments with account number and sort code please use:

{% capture data-raw %}
```javascript
"details": {
  "name": "Company name",
  "bank_name": "Lloyds Bank",
  "bank_account": "12345678",
  "sort_code": "123456"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="gbp-bank-details" raw=data-raw %}

For GBP IBAN transfers please use:

{% capture data-raw %}
```javascript
"details": {
  "name": "Company name",
  "bank_name": "Lloyds Bank",
  "iban": "GB29LOYD60161331926819",
  "bic": "LOYDGB2L" // Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="gbp-bank-iban-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning!** If the recipient account is not an `GBP` account then the recipient's bank might charge for converting the received funds from `GBP` to the local currency.
</div>

<div class="alert alert-info" markdown="1">
**Note!**

* The customer needs to enter either an IBAN (and an optional BIC), or an account number and sort code.
* Transfer is done using the fastest method available on the recipient's bank.
* If the recipient's bank is in the UK, and supports the Faster Payment network funds will arrive within 2 hours (but usually within a couple minutes)
* If the recipient's bank supports the SEPA system, funds will arrive within 1-2 business days
* If the recipient's bank only supports the Swift system, funds will arrive within 2-5 business days
</div>

## West Africa / XOF

### XOF::Bank

For West African bank payments in selected countries please use the following:

{% capture data-raw %}
```javascript
"details" : {
  "name": "Company name",
  "iban": "BJ0610100100144390000769", // BBAN format: AA123 12345 123456789012 12
  "bank_name": "Bank Of Africa Bénin" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bank-details" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note** `XOF::Bank` payouts are currently in beta phase.
</div>

## South Africa

### ZAR::Bank

For South African bank payments please use the following recipient details.

{% capture data-raw %}
```javascript
"details": {
  "name": "Company name",
  "street": "14 Main Street", // should include house number as well
  "postal_code": "AB0001",
  "city": "Cape Town",
  "email": "recipient@email.com", // optional, but highly recommended
  "bank_code": "334810",
  "bank_account": "12345678",
  "phone_number": "+27119785313",
  "contact_first_name": "First",
  "contact_last_name": "Last",
  "transfer_reason_code": "185",
  "legal_entity_type": "privately_owned_company",
  "registration_number": "VAT1234567", // optional
  "nature_of_business": "retail_trade" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-details-business" raw=data-raw %}

The company types supported and corresponding `legal_entity_type` are:

{% capture data-raw %}
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

{% include language-tabbar.html prefix="zar-entity-types" raw=data-raw %}

The valid values for `nature_of_business` are the following:

{% capture data-raw %}
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

{% include language-tabbar.html prefix="zar-nature-of-business" raw=data-raw %}

List of transfer reasons and corresponding `transfer_reason_code` are:

{% capture data-raw %}
```
Sending money into my own account: 183
Donations and gifts: 184
Sending money to a friend, family member or any third party person: 185
Mortgage repayments: 186
Business Travel Payments: 187
Personal Travel Payments: 188
Tuition fees: 189
Investment into property by a foreign individual: 192
Investment by a foreign individual - other: 193
Legal services: 196
Accounting services: 197
Management consulting services: 198
Advertising & market research services: 200
Managerial services: 201
Cultural and recreational services: 205
Salary paid to South African Resident Temporarily Abroad: 206
Salary paid to a non-resident employee in South Africa: 207
Salary paid to a foreign national contract worker in South Africa: 208
Pensions: 213
Annuities: 214
Inheritances: 215
Alimony: 216
Tax - Income tax: 217
Tax - VAT refunds: 218
Tax - Other: 219
Dividends: 222
Commission or brokerage: 224
Rental: 225
Income earned abroad by a resident on an individual investment: 226
Architectural, engineering and other technical services: 245
Payments for data, news related and news agency fees: 249
Computer-related services including maintenance, repair and consultancy: 279
Proceeds for other business services not included elsewhere: 309
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-transfer-reason-codes" raw=data-raw %}

Please note that due to regulatory reasons senders trying to create `ZAR::Bank` transactions are required to have the following fields on the sender present as well:
`street`, `city` and `postal_code`

<div class="alert alert-info" markdown="1">
**Note** To accept payments in South Africa the recipient has to sign a mandate form online. The link to the form will be sent over the recipient's mobile phone number and email address, and have to be filled out online. Once the mandate is signed it is valid for one year and the recipient doesn't need to do these steps again. When sending funds to the same recipient please make sure their name and bank details are the same, otherwise they might be asked to sign the mandate form again.
</div>

<div class="alert alert-warning" markdown="1">
**Warning** `ZAR::Bank` payouts are currently in beta phase.
</div>
