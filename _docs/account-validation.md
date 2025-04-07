---
title: Account validation
permalink: /docs/account-validation/
---

* Table of contents
{:toc}

Since it's easy to mistype the account number or mobile number for a recipient, we provide a feature where you can
request more details about an account number, before creating a transaction.

We support this feature in 2 ways (for account name enquiry, telco validation or account status validation - depending on the market):
- **A standalone account validation endpoint**
- **An account validation functionality within the transaction flow.**

# Account name validation via endpoint

You can perform an account name validation by initiating a call to the following endpoint:

<div class="highlight">
  <p class="hll"><strong>POST</strong> <code>/v1/account_validations</code></p>
</div>

Once you have the account name you can compare that with the recipient details you wish to use, and only create a transaction if they match.

We support account name validation in the following markets:

## Nigeria
### NGN::Bank

{% capture data-raw %}
```javascript
Request

{
  "bank_account": "123456789",
  "bank_code": "058",
  "country": "NG",
  "currency": "NGN",
  "method": "bank"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ngn-bank-name-validation" raw=data-raw %}

## Ghana
### GHS::Bank

{% capture data-raw %}
```javascript
Request

{
  "bank_account": "123456789",
  "bank_code": "030100",
  "country": "GH",
  "currency": "GHS",
  "method": "bank"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-bank-name-validation" raw=data-raw %}

### GHS::Mobile

{% capture data-raw %}
```javascript
Request

{
  "phone_number": "+233302123456", // E.164 international format
  "mobile_provider": "vodafone" // Optional
  "country": "GH",
  "currency": "GHS",
  "method": "mobile"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ghs-mobile-name-validation" raw=data-raw %}

The valid `mobile_provider` values for Ghana are:

{% capture data-raw %}
```
airteltigo
mtn
vodafone
```
{% endcapture %}

{% include language-tabbar.html prefix="ghana-mobile-providers" raw=data-raw %}

<div class="alert alert-info" markdown="1">
  **Note:** Kindly be informed that Airtel has merged with Millicom's Tigo in Ghana to become AirtelTigo
</div>

## Uganda
### UGX::Mobile

{% capture data-raw %}
```javascript
Request

{
  "phone_number": "+256772123456", // E.164 international format
  "mobile_provider": "mtn",
  "country": "UG",
  "currency": "UGX",
  "method": "mobile"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="ugx-mobile-name-validation" raw=data-raw %}

The valid `mobile_provider` values for Uganda are:

{% capture data-raw %}
```
airtel
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="uganda-mobile-providers" raw=data-raw %}

## Responses

A successful response will return a `200 OK` status code, and provide you with the account name:

{% capture data-raw %}
```javascript
{
  "object": {
    "account_name": "Test User"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="successful-name-validation-response" raw=data-raw %}

An invalid account response will return a `422 Unprocessably Entity` status code, with an `error` description in the `meta` object (please do note the `error` below it's just an example and it may vary depending on the market):

{% capture data-raw %}
```javascript
{
  "object": {},
  "meta": {
    "error": "Account Invalid"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="invalid-account-response" raw=data-raw %}

If we are unable to verify an account due to issues with validation providers (such as a timeout or other connectivity problems), we will return a `422 Unprocessable Entity` status code, along with an empty `object` and an `Account validation failed` `error` in the `meta` object:

{% capture data-raw %}
```javascript
{
  "object": {},
  "meta": {
    "error": "Account validation failed"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="account-validation-failed-response" raw=data-raw %}

<div class="alert alert-info" markdown="1">
  **Note:** An error during account name enquiry may indicate either that the account does not exist or that there is a connectivity issue with the banking system or the telco operator. Therefore, if you receive an error message, you may need to retry the request a few minutes later.
</div>

# Mobile provider (telco) validation via endpoint

Similarly to the account name validation, you can perform a mobile provider (telco) validation by initiating a call to the same endpoint:

<div class="highlight">
  <p class="hll"><strong>POST</strong> <code>/v1/account_validations</code></p>
</div>

Once you have the mobile provider (returned as `mapped_mobile_provider` in the response) you can compare that with the mobile provider (telco) you wish to use, and only create a transaction if they match.

<div class="alert alert-info" markdown="1">
  **Note:** Kindly be aware that this is a paid service. Please contact our Sales Team at `corporate.sales@azafinance.com` or our Account Management team at `account.mgt@azafinance.com` to request more informations.
</div>

We support mobile provider (telco) validation in the following markets:

## CEMAC Region / XAF
### XAF::Mobile

{% capture data-raw %}
```javascript
Request

{
  "phone_number": "+237674044436", // E.164 international format
  "mobile_provider": "orange",
  "country": "CM",
  "currency": "XAF",
  "method": "mobile"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-telco-validation" raw=data-raw %}

The valid `mobile_provider` values for Cameroon are:

{% capture data-raw %}
```
orange
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-cm-mobile-providers" raw=data-raw %}

## WAEMU Region / XOF
### XOF::Mobile

{% capture data-raw %}
```javascript
Request

{
  "phone_number": "+221774044436", // E.164 international format
  "mobile_provider": "orange",
  "country": "SN",
  "currency": "XOF",
  "method": "mobile"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-mobile-telco-validation" raw=data-raw %}

The valid `mobile_provider` values for Benin are:

{% capture data-raw %}
```
moov
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bj-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Burkina Faso are:

{% capture data-raw %}
```
moov
orange
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-bf-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for the Ivory Coast are:

{% capture data-raw %}
```
moov
mrn
orange
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-ci-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Senegal are:

{% capture data-raw %}
```
orange
expresso
free
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-sn-mobile-providers" raw=data-raw %}

The valid `mobile_provider` values for Togo are:

{% capture data-raw %}
```
moov
tmoney
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-tg-mobile-providers" raw=data-raw %}

## Responses

A successful response will return a `200 OK` status code, and provide you with the mobile provider:

{% capture data-raw %}
```javascript
{
  "object": {
    "mapped_mobile_provider": "orange"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="successful-telco-validation-response" raw=data-raw %}

An invalid mobile provider response will return a `422 Unprocessably Entity` status code, with an `error` description in the `meta` object (please do note the `error` below it's just an example and it may vary depending on the market):

{% capture data-raw %}
```javascript
{
  "object": {
    "mapped_mobile_provider": "orange"
  },
  "meta": {
    "error": "Mobile provider does not match phone number."
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="invalid-telco-response" raw=data-raw %}

If we are unable to verify a mobile provider due to issues with validation providers (such as a timeout or other connectivity problems), we will return a `422 Unprocessable Entity` status code, along with an empty `object` and an `Account validation failed` `error` in the `meta` object:

{% capture data-raw %}
```javascript
{
  "object": {},
  "meta": {
    "error": "Account validation failed"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="account-validation-failed-response" raw=data-raw %}

# Account status validation via endpoint

You can perform an account status validation by initiating a call to the following endpoint:

<div class="highlight">
  <p class="hll"><strong>POST</strong> <code>/v1/account_validations</code></p>
</div>

<div class="alert alert-info" markdown="1">
  **Note:** Kindly be aware that this is a paid service. Please contact our Sales Team at `corporate.sales@azafinance.com` or our Account Management team at `account.mgt@azafinance.com` to request more informations.
</div>

We support account status validation in the following markets:

## CEMAC Region / XAF
### XAF::Mobile

{% capture data-raw %}
```javascript
Request

{
  "phone_number": "+237674044436", // E.164 international format
  "mobile_provider": "mtn",
  "country": "CM",
  "currency": "XAF",
  "method": "mobile"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-mobile-account-status-validation" raw=data-raw %}

The valid `mobile_provider` values for account status validation in Cameroon are:

{% capture data-raw %}
```
mtn
```
{% endcapture %}

{% include language-tabbar.html prefix="xaf-cm-mobile-providers" raw=data-raw %}

## Responses

A successful response will return a `200 OK` status code, and provide you with an `account_status` `active` attribute in the `object`:

{% capture data-raw %}
```javascript
{
  "object": {
    "account_status": "active"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="successful-telco-validation-response" raw=data-raw %}

An invalid account status response will return a `422 Unprocessably Entity` status code, with an `account_status` `inactive` attribute in the `object`, and an `error` description in the `meta` object (please do note the `error` below it's just an example and it may vary depending on the market):

{% capture data-raw %}
```javascript
{
  "object": {
    "account_status": "inactive"
  },
  "meta": {
    "error": "Account invalid"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="inactive-account-status-response" raw=data-raw %}

If we are unable to verify an account status due to issues with validation providers (such as a timeout or other connectivity problems), we will return a `422 Unprocessable Entity` status code, along with an empty `object` and an `Account validation failed` `error` in the `meta` object:

{% capture data-raw %}
```javascript
{
  "object": {},
  "meta": {
    "error": "Account validation failed"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="account-validation-failed-response" raw=data-raw %}

# Account name validation in transactions flow

Another way to limit mispayments due to mistyped account numbers is enabling account name validation on transactions. This feature will block payouts if the account holder's name and the recipient name provided in the payout details don't match.

<div class="alert alert-info" markdown="1">
 **Note:** This feature is currently available for `NGN::Bank`, `GHS::Bank` and `GHS::Mobile` payouts only.
</div>

To enable account name validation please enable the `account_validation` trait during transaction creation:

<div class="highlight">
  <p class="hll"><strong>POST</strong> <code>/v1/transactions</code></p>
</div>

{% capture data-raw %}
```javascript
{
   "transaction":{
      "traits": {
        "account_validation": true
      },
      // (...) additional transaction details
   }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="validation-trait" raw=data-raw %}

We can also enable name validation by default across all transactions created by you. If this is of interest please contact our team so we can configure your account as such. If the feature is enabled, then it can be disabled on a per-transaction basis by specifying `"account_validation": false` in the `traits` section.

Once the trait is enabled we will do a name enquiry from the bank and check if the name we get back matches the name received in the recipient details. If they match we will go ahead with the payout. If they don't we will stop the payout and return an error message describing that the transaction will not proceed unless the recipient details are updated to match the account holder name.

In both cases we will return the account holder name in the recipient's metadata. For example if you entered `JOHN SMITH` as the recipient name, but the account holder is in fact `JANE DOE` then you will receive a `recipient.error` webhook with the following details:

{% capture data-raw %}
```javascript
{
  "webhook": "fd599451-4f3c-4045-91e1-d68ed12ffb75",
  "event": "recipient.error",
  "object": {
    "editable": true,
    "metadata": {
      "provider_name_validation": {
        "valid?": true,
        "account_name": "JANE DOE"
      }
    },
    "payout_method": {
      "type": "NGN::Bank",
      "details": {
        "last_name": "SMITH",
        "first_name": "JOHN",
        // (...)
      },
    }
    "state": "error",
    "state_reason": "The recipient name doesn't match the account holder's name. Please edit or cancel the transaction",
    // (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="recipient-error" raw=data-raw %}

In case the account number doesn't exist at the bank or there is a connectivity issue with the banking system you will receive an error with the following message: `We were not able to verify that the provided account exists. This could be a temporary error with a bank, a telco, or it can mean the provided details were incorrect. We will retry the transaction. You can also edit or cancel the payout`.

Unfortunately due to how the banking system works in the supported markets it is not always possible to differentiate an invalid account number from a connectivity issue, hence we will automatically retry the name enquiry until we get a valid response, or the transaction is cancelled.

# Mobile provider (telco) validation in transactions flow

Another way to limit mispayments due to mismatched mobile providers is enabling mobile provider (telco) validation on transactions. This feature will block payouts if the mapped mobile provider (returned from an internal phone number/telco check) and the mobile provider provided in the payout details don't match.

<div class="alert alert-info" markdown="1">
 **Note:** This feature is currently available for `XOF::Mobile` and `XAF::Mobile` via `orange` payouts only. Also kindly be aware that this is a paid service. Please contact our Sales Team at `corporate.sales@azafinance.com` or our Account Management team at `account.mgt@azafinance.com` to request more informations.
</div>

To enable mobile provider validation please enable the `account_validation` trait during transaction creation (this is the same trait as for account name validation):

<div class="highlight">
  <p class="hll"><strong>POST</strong> <code>/v1/transactions</code></p>
</div>

{% capture data-raw %}
```javascript
{
   "transaction":{
      "traits": {
        "account_validation": true
      },
      // (...) additional transaction details
   }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="validation-trait" raw=data-raw %}

We can also enable mobile provider validation by default across all transactions created by you. If this is of interest please contact our team so we can configure your account as such. If the feature is enabled, then it can be disabled on a per-transaction basis by specifying `"account_validation": false` in the `traits` section.

Once the trait is enabled we will do a mobile provider check from the telco operator, and make sure the mapped mobile provider we get back matches the mobile provider received in the recipient details. If they match we will go ahead with the payout. If they don't we will stop the payout and return an error message describing that the transaction will not proceed unless the recipient details are updated to match the mobile provider.

In both cases we will return the mobile provider in the recipient’s metadata. For example if you entered `mtn` as mobile provider, but the mobile provider for that particular phone number is in fact `orange` you will receive a `recipient.error` webhook with the following details:

{% capture data-raw %}
```javascript
{
  "webhook": "fd599451-4f3c-4045-91e1-d68ed12ffb75",
  "event": "recipient.error",
  "object": {
    "editable": true,
    "metadata": {
      "provider_network_validation": {
        "valid?": true,
        "mapped_mobile_provider": "orange"
      }
    },
    "payout_method": {
      "type": "XOF::Mobile",
      "details": {
        "phone_number": "+221774044436",
        "mobile_provider": "mtn",
        // (...)
      },
    }
    "state": "error",
    "state_reason": "The mapped mobile provider doesn't match the payout details' mobile provider. Please edit or cancel the transaction.",
    // (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="recipient-error" raw=data-raw %}

In case the mobile provider doesn’t exist or there is a connectivity issue with the telco operator system you will receive an error with the following message: `We were not able to verify that the provided account exists. This could be a temporary error with a bank, a telco, or it can mean the provided details were incorrect. We will retry the transaction. You can also edit or cancel the payout`.

Unfortunately due to how the telcos system works in the supported markets it is not always possible to differentiate an invalid mobile provider from a connectivity issue, hence we will automatically retry the mobile provider validation until we get a valid response, or the transaction is cancelled.

# Account status validation in transactions flow

An account status validation on transactions is also available. This feature will block payouts if the account status check returns an `inactive` status.

<div class="alert alert-info" markdown="1">
 **Note:** This feature is currently available for `XAF::Mobile` payouts with `mobile_provider` set to `mtn` only. Also kindly be aware that this is a paid service. Please contact our Sales Team at `corporate.sales@azafinance.com` or our Account Management team at `account.mgt@azafinance.com` to request more informations.
</div>

To enable account status validation please enable the `account_validation` trait during transaction creation (this is the same trait as for account name and telco validation):

<div class="highlight">
  <p class="hll"><strong>POST</strong> <code>/v1/transactions</code></p>
</div>

{% capture data-raw %}
```javascript
{
   "transaction":{
      "traits": {
        "account_validation": true
      },
      // (...) additional transaction details
   }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="validation-trait" raw=data-raw %}

We can also enable account status validation by default across all transactions created by you. If this is of interest please contact our team so we can configure your account as such. If the feature is enabled, then it can be disabled on a per-transaction basis by specifying `"account_validation": false` in the `traits` section.

Once the trait is enabled we will do an account status check from the telco operator, and make sure the account is valid and active. If so we will go ahead with the payout. If not we will stop the payout and return an error message describing that the transaction will not proceed unless the recipient details are updated with a valid/active account or the transaction is canceled.

In both cases we will return the account status (`active`/`inactive`) in the recipient’s metadata. For example if the account linked to the phone number you used turns out to be `inactive`, you will receive a `recipient.error` webhook with the following details:

{% capture data-raw %}
```javascript
{
  "webhook": "fd599451-4f3c-4045-91e1-d68ed12ffb75",
  "event": "recipient.error",
  "object": {
    "editable": true,
    "metadata": {
      "provider_account_status_validation": {
        "valid?": false,
        "account_status": "inactive"
      }
    },
    "payout_method": {
      "type": "XAF::Mobile",
      "details": {
        "phone_number": "+237674044436",
        "mobile_provider": "mtn",
        // (...)
      },
    }
    "state": "error",
    "state_reason": "This account is either inactive or invalid. Please edit or cancel the transaction.",
    // (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="recipient-error" raw=data-raw %}

In case there is a connectivity issue with the bank or telco operator system you will receive an error with the following message: `We were not able to verify that the provided account exists. This could be a temporary error with a bank, a telco, or it can mean the provided details were incorrect. We will retry the transaction. You can also edit or cancel the payout`.

Unfortunately due to how the banks and telcos system works in the supported markets it is not always possible to differentiate an invalid account from a connectivity issue, hence we will automatically retry the account status validation until we get a valid response, or the transaction is cancelled.
