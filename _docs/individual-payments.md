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

{% include corridors/ngn-bank.md recipient_type='individual' %}

# Ghana

{% include corridors/ghs-bank.md recipient_type='individual' %}

{% include corridors/ghs-mobile.md %}

# Uganda

{% include corridors/ugx-bank.md recipient_type='individual' %}

{% include corridors/ugx-mobile.md recipient_type='individual' %}

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

{% include corridors/zar-bank.md recipient_type='individual_without_middle_name' %}

# Botswana

{% include corridors/bwp-bank.md recipient_type='individual' %}

# Brazil

{% include corridors/brl-bank.md recipient_type='individual' %}

# Zambia

{% include corridors/zmw-bank.md recipient_type='individual' %}

# Kenya

{% include corridors/kes-bank.md recipient_type='individual' %}

{% include corridors/kes-mobile.md recipient_type='individual' %}

# Egypt

{% include corridors/egp-bank.md recipient_type='individual' %}

{% include corridors/egp-cash.md recipient_type='individual' %}

{% include corridors/usd-bank-egypt.md recipient_type='individual' %}
