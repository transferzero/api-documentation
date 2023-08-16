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
  "bank_account": "123456789"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ngn-bank-details" raw=data-raw %}

The valid `bank_code` values are:

{% capture data-raw %}
```
Access Bank: 044
Carbon / One Finance: 565
Citi Bank Group: 023
EcoBank: 050
Fairmoney Microfinance Bank LTD: E30
FCMB Bank: 214
Fidelity Bank: 070
First Bank of Nigeria: 011
Go Money: 326
Guaranty Trust Bank : 058
Heritage Bank: 030
Jaiz Bank: 301
Keystone: 082
Kuda Microfinance Bank: 611
Moniepoint Microfinance Bank: 993
Opay: 305
Palmpay: B54
Polaris Bank: 076
Stanbic IBTC Bank: 039
Standard Chartered Bank PLC: 068
Sterling bank: 232
Suntrust Bank: 100
Union Bank: 032
United Bank for Africa: 033
Unity Bank: 215
VFD Microfinance Bank: 566
Wema Bank: 035
Zenith International: 057
---
Carbon / One Finance: 100026
Fairmoney Microfinance Bank LTD: 090551
Go Money: 100022
Kuda Microfinance Bank: 090267
Moniepoint Microfinance Bank: 090405
Opay: 100004
Palmpay: 100033
Providus Bank: 000023
VFD Microfinance Bank: 090110
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
  "phone_number": "+2347087661234" // E.164 international format
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
  "phone_number": "+2347087661234", // optional - E.164 international format
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
Union Bank: 032
United Bank for Africa: 033
Zenith International: 057
Polaris Bank: 076
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
  "phone_number": "+2347087661234", // E.164 international format
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

{% include corridors/ghs-mobile.md %}

## GHS::Cash

For Ghanan cash payment please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "+233302123456" // E.164 international format
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-cash-details" raw=data-raw %}

# Uganda

{% include corridors/ugx-bank.md recipient_type='individual' %}

{% include corridors/ugx-mobile.md recipient_type='individual' %}

# Europe / SEPA

{% include corridors/eur-bank.md recipient_type='individual' %}

{% include corridors/gbp-bank.md recipient_type='individual' %}

# United States
{% include corridors/us-bank.md recipient_type='individual' %}

# New Zealand

{% include corridors/nzd-bank.md recipient_type='individual' %}

# Canada
{% include corridors/cad-bank.md recipient_type='individual' %}

# Morocco

## MAD::Cash

For Cashplus cash pickup requests please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "+212537718685" // Mandatory; E.164 international format
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

# WAEMU Region / XOF

## XOF::Cash

For Senegalese cash pickup requests we have the Wizall payout network available:

For Wizall cash pickup requests please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "phone_number": "+221774044436", // E.164 international format
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

{% include corridors/xof-mobile.md %}

{% include corridors/xof-bank.md recipient_type='individual' %}

# CEMAC Region / XAF

{% include corridors/xaf-bank.md recipient_type='individual' %}

## XAF::Mobile

For mobile payouts to Cameroon, please use:

{% capture data-raw %}
```javascript
"details": {
  "first_name": "First",
  "last_name": "Last",
  "mobile_provider": "orange", // lowercase, see provider values below
  "phone_number": "+237674044436", // E.164 international format
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

{% include corridors/gnf-mobile.md %}

# South Africa

{% include corridors/zar-bank.md recipient_type='individual' %}

# Botswana

{% include corridors/bwp-bank.md recipient_type='individual' %}

# Brazil

{% include corridors/brl-bank.md recipient_type='individual' %}

# Zambia

{% include corridors/zmw-bank.md recipient_type='individual' %}

# Kenya

{% include corridors/kes-bank.md recipient_type='individual' %}

{% include corridors/kes-mobile.md recipient_type='individual' %}

