---
title: Changelog
permalink: /docs/changelog/
---

* Table of contents
{:toc}

Current version of the API is `1`

Current version of the SDKs is `1.37.0`

1.37.0
------
* Adds the `street` field to the `NGN::Bank` corridor.

1.36.8
------
* Adds account validation support for `XAF::Mobile` in Cameroon via `orange` and `mtn`.

1.36.4
------
* Makes `middle_name` field mandatory for the `EGP::Cash` corridor.

1.36.3
------
* Add optional `email` field for individual payouts on the `EGP::Cash` corridor.

1.36.2
------
* Add support for `EGP::Cash` payouts in Egypt.

1.36.0
------
* Add support for bank collections for NGN

1.34.1
------
* Add Bank of Baroda to `KES::Bank` banks list.

1.34.0
------
* Add support for `USD::Bank` payouts in Egypt.

1.33.0
------
* [PHP SDK] Drop support for PHP 7.1
* [PHP SDK] Upgrade Guzzlehttp to 7.3

1.32.1
------
* Add optional `middle_name` field for individual payouts on the `EGP::Bank` corridor.

1.30.3
------
* Add `narration` as optional field to `EUR::Bank` and `GBP::Bank` corridors.

1.30.0
------
* Add support for `EGP::Bank` corridor.

1.29.0
------
* Add `amount_after_pending` to endpoints `/accounts` and `/accounts/{currency}` for accounts related to Bidvest Bank. This field returns the amount that is currently available taking into consideration the pending transactions for the last 7 days.

1.27.5
------
* Relax fields for `ZAR::Bank` invididual payouts: `street`, `city`, `postal_code`, `transfer_reason` are now optional
* Relax fields for `ZAR::Bank` business payouts: `street`, `city`, `postal_code`, `transfer_reason`, `contact_first_name`, `contact_last_name`, `legal_entity_type` are now optional
* `ZAR::Bank` payouts can now accept either `bank_code` or `branch_code`

1.27.4
------
* Add support for `XOF::Mobile` corridor for Benin and Togo

1.27.0
------
* Add support for `UGX::Bank` corridor

1.26.1
------
* Add support for `CAD::Bank` corridor
* Update `USD::Bank` corridor to support payments to United States.

1.25.0
------
* Add support for `BWP::Bank` and `ZMW::Bank` corridors.

1.24.0
------
* Add support for `NZD::Bank` corridor.

1.23.5
------
* Update `BRL::Bank` to support PIX payments.

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
