---
title: Individual payments
permalink: /docs/individual-payments/
redirect_from: /docs/payout-details/
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
  "bank_account_type": "10" // Optional
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
Citi Bank Group: 023
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

## USD::Bank

For USD bank payments in Nigeria please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "Jane",
  "last_name": "Doe",
  "phone_number": "+2341234567", // optional
  "bank_code": "057",
  "bank_account": "1234567890",
  "country": "NG"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-details" raw=data-raw %}

The valid `bank_code` values are:

{% capture data-raw %}
```
Access Bank: 044
FCMB Bank: 214
Fidelity Bank: 070
United Bank for Africa: 033
Zenith International: 057
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-details" raw=data-raw %}

The valid `country` values are:

{% capture data-raw %}
```
NG
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-bank-countries" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `USD::Bank` payouts in Nigeria are currently in beta phase.
</div>

## USD::Cash

For USD cash payments in Nigeria please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "Jane",
  "last_name": "Doe",
  "phone_number": "+2341234567",
  "country": "NG"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-cash-details" raw=data-raw %}

The valid `country` values are:

{% capture data-raw %}
```
NG
```
{% endcapture %}

{% include language-tabbar.html prefix="usd-cash-countries" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `USD::Cash` payouts in Nigeria are currently in beta phase.
</div>

# Ghana

{% include corridors/ghs-bank.md recipient_type='individual' %}

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
  "phone_number": "256772123456",
    // local or international Ugandan format
  "mobile_provider": "airtel" // optional
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ugx-mobile-details" raw=data-raw %}

Although the `mobile_provider` field is optional, if you send us the proper value we can provider a quicker and faster settlement. The valid values are:

{% capture data-raw %}
```
africell
airtel
mtn
telecom
```
{% endcapture %}

{% include language-tabbar.html prefix="ugx-mobile-providers" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Note!** The provider might check the name against the registered holder of the mobile number and block transactions if they don't match.
</div>

# Europe / SEPA

{% include corridors/eur-bank.md recipient_type='individual' %}

{% include corridors/gbp-bank.md recipient_type='individual' %}

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

{% include language-tabbar.html prefix="xof-cash-sender-details" raw=data-raw %}

## XOF::Mobile

For mobile payouts to Senegal, Ivory Coast, Burkina Faso and Mali please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "orange", // lowercase, see provider values below
  "phone_number": "+221774044436", // mobile number in local country format
  "country": "SN" // "SN" for Senegal, "CI" for Ivory Coast, "BF" for Burkina Faso, "ML" for Mali
  "transfer_reason": "personal_account" // mandatory for Mali payouts, optional otherwise
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Senegal are:

{% capture data-raw %}
```
orange
tigo
wave
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

The valid `mobile_provider` values for Burkina Faso are:

{% capture data-raw %}
```
orange
mobicash
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Mali are:

{% capture data-raw %}
```
orange
mobicash
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-providers" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

<div class="alert alert-info" markdown="1">
**Note** Amounts for `XOF::Mobile` payouts to **Ivory Coast 'Orange'** mobile numbers should be multiples of 5.
</div>

<div class="alert alert-warning" markdown="1">
**Warning** `XOF::Mobile` payouts to **Ivory Coast** are currently in beta phase.
</div>

{% include corridors/xof-bank.md recipient_type='individual' %}

# Cameroon

## XAF::Mobile

For mobile payouts to Cameroon, please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "orange", // lowercase, see provider values below
  "phone_number": "674044436", // mobile number in local country format
  "country": "CM" // "CM" for Cameroon
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Cameroon are:

{% capture data-raw %}
```
orange
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-providers" raw=data-raw %}

# Guinea

## GNF::Mobile

For mobile payouts to Guinea, please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "mtn", // lowercase, see provider values below
  "phone_number": "444044436" // mobile number in local country format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="gnf-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Guinea are:

{% capture data-raw %}
```
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="gnf-mobile-providers" raw=data-raw %}

# South Africa

{% include corridors/zar-bank.md recipient_type='individual' %}

# Kenya

## KES::Bank

For Kenyan bank payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "street": "1 Main Street", // should include house number as well
  "bank_name": "Equity Bank Limited",
  "bank_code": "68000",
  "branch_code": "404",
  "bank_account": "12345678",
  "swift_code": "EQBLKENA",
  "identity_card_type": "ID", // refers to the recipient's ID details; Values: "PP": Passport, "ID": National ID or "O": Other
  "identity_card_id": 'AB12345678', // refers to the recipient's ID details
  "transfer_reason": "third_party_person_account"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="kes-bank-details" raw=data-raw %}

The current banks supported and their `bank_code` values are:

{% capture data-raw %}
```
Habib Bank Limited: 08
Trans-National Bank Limited: 26
Housing Finance Co. Kenya: 61
UBA Kenya Bank Ltd: 76
Kenya Commercial Bank: 01000
Standard Chartered Bank: 02000
Barclays Bank of Kenya: 03000
Bank of India: 05000
Bank of Boroda: 06000
NCBA Bank: 07000
Prime Bank: 10000
Co-operative Bank of Kenya: 11000
National Bank of Kenya: 12000
M-Oriental Commercial Bank Limited: 14000
Citibank: 16000
Habib Bank A.G. Zurich: 17000
Middle East Bank: 18000
Bank of Africa Kenya: 19000
Consolidated Bank of Kenya: 23000
Credit Bank Ltd: 25000
Chase Bank: 30000
Stanbic Bank Kenya: 31000
African Banking Corporation: 35000
Giro Bank Limited: 42000
ECO Bank Kenya: 43000
Spire Bank Limited: 49000
Paramount Universal Bank Limited: 50000
Jamii Bora Bank: 51000
Guaranty Trust Bank Kenya: 53000
Victoria Bank Limited: 54000
Guardian Bank: 55000
Investments and Mortgages Bank Limited: 57000
Development Bank of Kenya: 59000
Fidelity Commercial Bank: 46000
Diamond Trust Bank: 63000
Sidian Bank: 66000
Equity Bank Limited: 68000
Family Bank: 70000
Gulf African Bank: 72000
First Community Bank: 74000
KWFT Bank: 78000
```
{% endcapture %}

{% include language-tabbar.html prefix="kes-bank-options" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

All senders trying to create Kenyan bank payments need to have the following details present:
- `"identification_type" => "ID"` - Values: `"PP"`: Passport, `"ID"`: National ID, `'DL'`: Driver's License, `"OT"`: Other
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

{% include language-tabbar.html prefix="kes-bank-sender-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `KES::Bank` payouts are currently in beta phase.
</div>

## KES::Mobile

For Kenyan mobile payments please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "street": "1 Linford Street",
  "phone_number": "254123456789", // local or international Kenyan format
  "identity_card_type": "ID", // refers to the recipient's ID details; Values: "PP": Passport, "ID": National ID or "O": Other
  "identity_card_id": 'AB12345678', // refers to the recipient's ID details
  "transfer_reason": "personal_account",
  "mobile_provider": "mpesa"

}
```
{% endcapture %}

{% include language-tabbar.html prefix="kes-mobile-details" raw=data-raw %}

The valid `mobile_provider` values for Kenya are:

{% capture data-raw %}
```
mpesa
```
{% endcapture %}

{% include language-tabbar.html prefix="kes-mobile-providers" raw=data-raw %}

{% include corridors/transfer_reasons.md %}

All senders trying to create Kenyan mobile payouts need to have the following details present:
- `"identification_type" => "ID"` - Values: `"PP"`: Passport, `"ID"`: National ID, `'DL'`: Driver's License, `"OT"`: Other
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

{% include language-tabbar.html prefix="kes-mobile-sender-details" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning** `KES::Mobile` payouts are currently in beta phase.
</div>

<div class="alert alert-info" markdown="1">
**Note!** The provider might check the name against the registered holder of the mobile number and block transactions if they don't match.
</div>
