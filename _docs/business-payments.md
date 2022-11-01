---
title: Business payments
permalink: /docs/business-payments/
redirect_from: /docs/business-transactions/
---

* Table of contents
{:toc}

This document lists the required details that needs to be sent for each of our payout corridor

<div class="alert alert-info" markdown="1">
**Note** Occasionally there might be issues with one of the corridors and we might have to disable them temporarily. Once youre onboarded we'll let you know if this happens. Also if you're trying to use a disabled corridor you're going to receive a validation error stating that the corridor is not active, and you won't be able to create new transactions there.
</div>

Our system not only allows transactions from personal senders to personal recipients, but also to and from business senders and business recipients. Note however that regulatory and other requirements might be more strict for these transactions, so before you start implementing business transactions please reach out to our sales and account management team for more information.

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
  registrationDate: DateTime.Parse("2012-01-25"),
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
  registrationDate:=DateTime.Parse("2012-01-25"),
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
sender.registration_date = "2012-01-25";
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
$sender->setRegistrationDate("2012-01-25");
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

# Ghana

{% include corridors/ghs-bank.md recipient_type='business' %}

# Europe / SEPA

{% include corridors/eur-bank.md recipient_type='business' %}

{% include corridors/gbp-bank.md recipient_type='business' %}

# West Africa / XOF

{% include corridors/xof-bank.md recipient_type='business' %}

# South Africa

{% include corridors/zar-bank.md recipient_type='business' %}

# Central Africa / XAF

{% include corridors/xaf-bank.md recipient_type='business' %}