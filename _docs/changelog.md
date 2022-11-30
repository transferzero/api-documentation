---
title: Changelog
permalink: /docs/changelog/
---

* Table of contents
{:toc}

Current version of the API is `1`

Current version of the SDKs are `1.23.4`

1.23.4
------
* Drop mandatory `phone_country` when `phone_number` field is in E. 164 format.

1.22.0
------
* Add support for the `XAF::Bank` corridor.

1.21.0
------
* Add `country` to `PayinMethodDetailsMobile` for mobile collections.

1.20.0
------
* Add support for `wave` as `mobile_provider` for `XOF::Mobile` payments in Senegal.

1.19.2
------
* Add otp verified ussd popup flow for collections.

1.19.0
------
* Add `id`, `ux_flow`, `state`, `state_reason_details` and `errors` to PayinMethod model
* Remove `send_instructions` field from PayinMethodDetails
* Add support for `/v1/payin_methods/<id>` endpoint. `GET`, `PATCH`,`DELETE` are supported
* Add support for `/v1/payin_methods/<id>/retry` endpoint
* Add support for PayinMethod validation on `/v1/transactions/validate` endpoint

1.17.0
-----
* Add new `transfer_reason` string enum field to: `XOF::Bank`, `ZAR::Bank`, `KES::Bank` and `KES::Mobile` corridors. List of valid options can be found here: https://docs.transferzero.com/docs/payout-details
* Deprecate `transfer_reason_code` field

1.16.1
-----
* Add `type` field to the Recipient model. Valid options are: `person`, `business`

1.16.0
-----
* Add optional `mobile_provider` field support to the `UGX::Mobile` corridor. Valid options are: `airtel`, `mtn`, `africell`, `telecom`

1.15.1
-----
* `bank_name` and `bank_country` are now optional for `XOF::Bank` corridor

1.15.0
-----
* Add support for the `KES::Bank` corridor.
* Add support for the `KES::Mobile` corridor.

1.14.1
-----
* Rename `entity_type` to `legal_entity_type` for`ZAR::Bank` business payouts
* Make `nature_of_business` and `registration_number` optional for `ZAR::Bank` business payouts

1.14.0
-----
* Add support for the `ZAR::Bank` business payouts

1.13.0
-----
* Add support for the `GHS::Cash` corridor
* Add support for `XOF::Mobile` payouts to Ivory Coast

1.12.2
-----
* Add bugfix introduced in `1.12.0` for PayoutMethodDetails `country`

1.12.0
-----
* Add support for specifying country for the `XOF::Cash` corridor
* Accept `mobile_provider` in `/v1/account_validations` for Mobile Accounts validations

1.11.0
-----
* Move `identification_number` and `identification_type` attributes from the `payout_method` to the `sender` object for Wizall `XOF::Cash` corridor.

1.10.0
-----
* Add support for specifying cash providers in the `XOF::Cash` corridor
* Add `state_reason_details` attribute in `recipient` object

1.9.0
-----
* Add support for business senders
* Add support for specifying mobile providers in the `GHS::Mobile` corridor

1.8.0
-----
* Add support for the `ZAR::Bank` corridor.
* Add support for `MAD::Cash` corridor to send sender fields on the `Sender` object.

1.7.0
-----
* Add support for bank account and sort code for the `GBP::Bank` corridor.

1.5.0
-----

* Add support for bank and card collections for NGN

1.4.1
-----

* Add support for name enquiry for mobile accounts

1.4.0
-----

* Add support for the `transactions/create_and_fund` endpoint.
* Change the Java SDKs to use a fluid style query interface for GET requests.
* Add support for Rails 4 in our Ruby SDK.

1.3.0
-----

* Add support for the `XOF::Bank` corridor.

1.2.0
-----

* Add support for the `retriable` flag on the recipient.

1.1.0
-----

* Add support for validating senders based on WTR2 rules.

1.0.0
-----

* Initial version of our public API
* Initial version of our SDKs
