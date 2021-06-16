---
title: Payout details
permalink: /docs/payout-details/
---

* Table of contents
{:toc}

This document lists the required details that needs to be sent for each of our payout corridor

<div class="alert alert-info" markdown="1">
**Note** Occasionally there might be issues with one of the corridors and we might have to disable them temporarily. Once youre onboarded we'll let you know if this happens. Also if you're trying to use a disabled corridor you're going to receive a validation error stating that the corridor is not active, and you won't be able to create new transactions there.
</div>

# Nigeria

## NGN::Bank

For Nigerian bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "bank_code": "058",
  "bank_account": "123456789",
  "bank_account_type": "10"
    // 10 for saving
    // 20 for current accounts
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ngn-bank-details" raw=data-raw %}

The valid `bank_code` values are:

{% capture data-raw %}
```
Access Bank: 044
EcoBank: 050
FCMB Bank: 214
Fidelity Bank: 070
First Bank of Nigeria: 011
Guaranty Trust Bank : 058
Heritage Bank: 030
Jaiz Bank: 301
Keystone: 082
Polaris Bank: 076
Stanbic IBTC Bank: 039
Standard Chartered Bank PLC: 068
Sterling bank: 232
Suntrust Bank: 100
Union Bank: 032
United Bank for Africa: 033
Unity Bank: 215
Wema Bank: 035
Zenith International: 057
```
{% endcapture %}

{% include language-tabbar.html prefix="ngn-bank-details" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note!** Diamond Bank was merged with Access Bank in 2019. For Diamond Bank recipients please use Access Bank as the bank code
</div>

## NGN::Mobile

For Nigerian mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "7087661234"
    // local Nigerian format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ngn-mobile-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning!** The recipient has to be registered and KYC'd with <https://www.mypaga.com>{: .alert-link} before they can receive funds. If they are not registered when the payment occurs then Paga can hold the funds until the user registers and approves themselves.
</div>

# Ghana

## GHS::Bank

For Ghanan bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
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

## GHS::Mobile

For Ghanan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "302123456"
  "mobile_provider": "tigo" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-mobile-details" raw=data-raw %}

Although the `mobile_provider` field is optional, if you send us the proper value we can provider a quicker and faster settlement. The valid values are:

{% capture data-raw %}
```
airtel
mtn
tigo
vodafone
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-mobile-providers" raw=data-raw %}

## GHS::Cash

For Ghanan cash payment please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "302123456"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-cash-details" raw=data-raw %}

# Uganda

## UGX::Mobile

For Ugandan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "256772123456"
    // local or international Ugandan format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ugx-mobile-details" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note!** The provider might check the name against the registered holder of the mobile number and block transactions if they don't match.
</div>

# Europe / SEPA

## EUR::Bank

For EUR IBAN transfers please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "bank_name": "Deutsche Bank",
  "iban": "DE89370400440532013000",
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

## GBP::Bank

For GBP::Bank there are two payout options available:

1. GBP Payments with account number and sort code
2. GBP IBAN transfers

For GBP Payments with account number and sort code please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
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
  "first_name": "First",
  "last_name": "Last",
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

# Morocco

## MAD::Cash

For Cashplus cash pickup requests please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "212537718685"
    // Mandatory; International format preferred
  "reason" => "Remittance payment",
    // Optional; Default value is 'Remittance payment'
  "identity_card_type" => "NI",
    // Refers to the recipient's ID details; Optional; Values: "PP": Passport, "NI": National ID
  "identity_card_id" => 'AB12345678'
    // Refers to the recipient's ID details; Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="mad-cash-details" raw=data-raw %}

Due to regulatory reasons all senders trying to create `MAD::Cash` transactions need to have the following details present:
- `"identification_type" => "OT"` - Values: `"OT"`: Other, `"PP"`: Passport, `"ID"`: National ID
- `"identification_number" => "AB12345678"`

Please note that the fields above are generally considered optional for senders for other payment corridors. If you wish to use an existing sender who has some of these fields missing you can provide them alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
      "sender": {
        "external_id": "<id of sender>",
        "identification_type": "OT",
        "identification_number": "AB12345678"
        (...)
      },
      (...)
    }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="mad-cash-sender-details" raw=data-raw %}

Please note when sending `MAD::Cash` payments you should subscribe to the `recipient.pending` webhook, as that will broadcast the payment reference ID the customer need to use to obtain the funds. Example webhook response excerpt:

{% capture data-raw %}
```javascript
{
   (...)
   "state":"pending",
   "metadata": {
     "payment_reference":"9M5GJRJUBCY"
   },
   (...)
}
```
{% endcapture %}

{% include language-tabbar.html prefix="mad-cash-pending" raw=data-raw %}

The payment reference can also be provided in the recipient details hash optionally for `MAD::Cash` in which case it will be used instead of the one we generate. The field you have to provide in the hash is called `reference`. If you wish to use this functionality, please contact us for more details.

<div class="alert alert-info" markdown="1">
**Note** For a list of Cashplus pickup points please contact us
</div>

# West Africa / XOF

## XOF::Cash

For Senegalese cash pickup requests we have the Wizall payout network available:

For Wizall cash pickup requests please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "221774044436", // local or international format
  "country": "CI", // Optional; Default value is "SN"
  "cash_provider": "wizall" // Mandatory
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-cash-details" raw=data-raw %}

The valid `country` values are:

{% capture data-raw %}
```
CI
ML
SN
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bank-country-values" raw=data-raw %}

All senders trying to create Wizall cash pickup requests need to have the following details present:
- `"identification_type" => "ID"` - Values: `"PP"`: Passport, `"ID"`: National ID
- `"identification_number" => "AB12345678"`

Please note that the fields above are generally considered optional for senders for other payment corridors. If you wish to use an existing sender who has some of these fields missing you can provide them alongside the `id` or `external_id` field in the sender details. For example:

{% capture data-raw %}
```javascript
{
  "transaction": {
      "sender": {
        "external_id": "<id of sender>",
        "identification_type": "ID",
        "identification_number": "AB12345678",
        (...)
      },
      (...)
    }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="mad-cash-sender-details" raw=data-raw %}

## XOF::Mobile

For mobile payouts to Senegal and Ivory Coast, please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "orange", // lowercase, see provider values below
  "phone_number": "774044436", // mobile number in local country format
  "country": "SN" // "SN" for Senegal (default), "CI" for Ivory Coast
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Senegal are:

{% capture data-raw %}
```
orange
tigo
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Ivory Coast are:

{% capture data-raw %}
```
moov
mtn
orange
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note** Amounts for `XOF::Mobile` payouts to **Ivory Coast 'Orange'** mobile numbers should be multiples of 5.
</div>

<div class="alert alert-warning" markdown="1">
**Warning** `XOF::Mobile` payouts to **Ivory Coast** are currently in beta phase.
</div>

## XOF::Bank

For West African bank payments in selected countries please use the following:

{% capture data-raw %}
```javascript
"details" : {
  "first_name": "First",
  "last_name": "Last",
  "bank_name": "BRM",
  "iban": "SN1231234512345678901212", // BBAN format: AA123 12345 123456789012 12
  "bank_country": "SN" // "SN" or "BJ"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bank-details" raw=data-raw %}

The valid `bank_country` values are:

{% capture data-raw %}
```
SN
BJ
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bank-country-values" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note** `XOF::Bank` payouts are currently in beta phase. At this time, we offer payouts to accounts in Senegal and Benin only.
</div>

# South Africa

## ZAR::Bank

For South African bank payments please use the following recipient details.

Personal recipient:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "street": "14 Main Street", // should include house number as well
  "postal_code": "AB0001",
  "city": "Cape Town",
  "email": "recipient@email.com", // optional, but highly recommended
  "bank_code": "334810",
  "bank_account": "12345678",
  "phone_number": "+27119785313",
  "transfer_reason_code": "185"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-details-personal" raw=data-raw %}

Business recipient:

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


The current banks supported and their `bank_codes` values are:

{% capture data-raw %}
```
Standard Bank: 051001
First National Bank: 250655
ABSA: 632005
Nedbank: 198765
Investec: 580105
Capitec Bank: 470010
Bank of Athens: 410506
Bidvest Bank: 462005
African Bank: 430000
Mercantile Bank: 450905
SA Post Office: 460005
Tyme Bank: 678910
Ubank: 431010
Discovery Bank: 679000
Bank Zero: 888000
```
{% endcapture %}

{% include language-tabbar.html prefix="zar-bank-codes" raw=data-raw %}

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
