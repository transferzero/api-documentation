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
Diamond Bank: 063
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
Access Bank: 280100
Barclays Bank: 030100
GCB Bank: 040100
Ecobank: 130100
First National Bank: 330100
Heritage Bank: 370100
Prudential Bank: 180100
Stanbic Bank: 190100
Standard Chartered Bank: 020100
United Bank for Africa: 060100
Zenith Bank: 120100
Fidelity Bank: 240100
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-options" raw=data-raw %}

## GHS::Mobile

For Ghanan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "302123456"
    // local Ghanaian format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-mobile-details" raw=data-raw %}

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

# Tanzania

## TZS::Mobile

For Tanzanian mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "221231234"
    // local Tanzanian format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="tzs-mobile-details" raw=data-raw %}

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
**Note!** IBAN transfers can take up to a week to arrive.
</div>

## GBP::Bank

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

{% include language-tabbar.html prefix="gbp-bank-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning!** If the recipient account is not an `GBP` account then the recipient's bank might charge for converting the received funds from `GBP` to the local currency.
</div>

<div class="alert alert-info" markdown="1">
**Note!** IBAN transfers can take up to a week to arrive.
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
  "sender_identity_card_type" => "O",
    // Mandatory; Values: "O": Other, "PP": Passport, "NI": National ID
  "sender_identity_card_id" => 'AB12345678',
    // Mandatory
  "sender_city_of_birth" => "London",
    // Mandatory
  "sender_country_of_birth" => "GB",
    // Mandatory; ISO 2-letter format
  "sender_gender" => "M",
    // Mandatory; Values: "M": Male, "F": Female
  "reason" => "Remittance payment",
    // Optional; Default value is 'Remittance payment'
  "identity_card_type" => "NI",
    // Optional; Values: "PP": Passport, "NI": National ID
  "identity_card_id" => 'AB12345678'
    // Optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="mad-cash-details" raw=data-raw %}

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

## XOF::Cash (Beta)

For Senegalese cash pickup requests please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "774044436" // local Senegalese format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-cash-details" raw=data-raw %}

Please note when sending `XOF::Cash` payments you should subscribe to the `recipient.pending` webhook, as that will broadcast the payment reference ID the customer need to use to obtain the funds. Example webhook response excerpt:

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

{% include language-tabbar.html prefix="xof-cash-pending" raw=data-raw %}

## XOF::Mobile

For Senegalese mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "orange", // "orange" or "tigo"
  "phone_number": "774044436" // local Senegalese format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-details" raw=data-raw %}

The valid `mobile_provider` values are:

{% capture data-raw %}
```
orange
tigo
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

## XOF::Bank

For West African bank payments in selected countries please use the following:

{% capture data-raw %}
```javascript
"details" : {
  "first_name": "First",
  "last_name": "Last",
  "bank_name": "BRM",
  "iban": "SN08SN0000000000000000000000",
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
