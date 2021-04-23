---
title: Changelog
permalink: /docs/changelog/
---

* Table of contents
{:toc}

Current version of the API is `1`
Current version of the SDKs are `1.14.0`

1.14.0
-----
* Add support for `XOF::Mobile` payins

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
