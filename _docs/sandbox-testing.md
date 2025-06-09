---
title: The sandbox environment
permalink: /docs/sandbox-testing/
---

* Table of contents
{:toc}

Our sandbox environment is a trimmed down version of our production API that allows you test out new features. It is also the environment where you'll need to demonstrate you can use our system well enough before we approve your API and give access to our production system.

To facilitate testing our sandbox environment has a few features that can help in developing your integration. These features are not available on our production environment.

# Forcing transactions to pay out

You can use the `POST /transactions/[TRANSFERZERO_TRANSACTION_ID]/payout` endpoint with an empty body to force a funded, but not yet paid transaction to succeed. You can use this endpoint to test out if you are receiving successful transaction webhooks properly.

# Forcing collections to succeed
You can use the `POST /transactions/[TRANSFERZERO_TRANSACTION_ID]/payin` endpoint with a `PayinMethodRequest` body to force a successful payin, for example to test out if you are receiving successful transaction webhooks properly. See the examples below using our SDKs

{::comment}
CODE_EXAMPLE_START transaction-payin
JSON_START
POST /v1/transactions/e77f89fa-8371-496c-ae73-e56697fc08d8/payin
{
 "payin_method":  {
  "type": 'GHS::Mobile'
 },
}
JSON_END

CODE_START
CREATE_START request PayinMethodRequest
SET LIT type "GHS::Mobile"
CREATE_API api TransactionsApi
POST_ENDPOINT_CALL TransactionResponse response api payin_transaction "e77f89fa-8371-496c-ae73-e56697fc08d8",request
CREATE_END
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
POST /v1/transactions/e77f89fa-8371-496c-ae73-e56697fc08d8/payin
{
 "payin_method":  {
  "type": 'GHS::Mobile'
 },
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
PayinMethodRequest request = new PayinMethodRequest(
  type: "GHS::Mobile",
TransactionsApi api = new TransactionsApi(configuration);
try {
  TransactionResponse response = api.PayinTransaction("e77f89fa-8371-496c-ae73-e56697fc08d8",request);
} catch (ApiException e) {
  if (e.IsValidationError)
    TransactionResponse response = e.ParseObject<TransactionResponse>();
    // Process validation error
  }
  throw e;
}
);
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim request as PayinMethodRequest = New PayinMethodRequest(
  type:="GHS::Mobile",
Dim api as TransactionsApi = New TransactionsApi(configuration)
Try
  Dim response as TransactionResponse = api.PayinTransaction("e77f89fa-8371-496c-ae73-e56697fc08d8",request)
Catch e As ApiException
  If e.IsValidationError Then
    Dim response as TransactionResponse = e.ParseObject(Of TransactionResponse)()
    ' Process validation error
  End If
  Throw e
End Try
)
```
{% endcapture %}

{% capture data-java %}
```java
PayinMethodRequest request = new PayinMethodRequest();
request.setType("GHS::Mobile");
TransactionsApi api = new TransactionsApi(apiClient);
try {
  TransactionResponse response = api.payinTransaction("e77f89fa-8371-496c-ae73-e56697fc08d8",request);
} catch (ApiException e) {
  if (e.isValidationError()) {
    TransactionResponse response = e.getResponseObject(TransactionResponse.class);
    // Process validation error
  }
  throw e;
};
```
{% endcapture %}

{% capture data-js %}
```js
const request = new TransferZeroSdk.PayinMethodRequest();
request.type = "GHS::Mobile";
const api = new TransferZeroSdk.TransactionsApi(apiClient);
try {
  const response = await api.payinTransaction("e77f89fa-8371-496c-ae73-e56697fc08d8",request);
} catch (e) {
  if (e.isValidationError) {
    const response = e.getResponseObject();
    // Process validation error
  }
  throw e;
}
```
{% endcapture %}

{% capture data-php %}
```php
$request = new PayinMethodRequest();
$request->setType("GHS::Mobile");
$api = new TransactionsApi();
try {
  $response = api->payinTransaction("e77f89fa-8371-496c-ae73-e56697fc08d8",$request);
} catch (ApiException $e) {
  if ($e->isValidationError()) {
    $response = $e->getResponseObject();
    // Process validation error
  }
  throw $e;
}
```
{% endcapture %}

{% capture data-ruby %}
```ruby
request = TransferZero::PayinMethodRequest.new
request.type = "GHS::Mobile"
api = TransferZero::TransactionsApi.new
begin
  response = api.payin_transaction("e77f89fa-8371-496c-ae73-e56697fc08d8",request)
rescue TransferZero::ApiError => e
  if e.validation_error
    response = e.response_object("TransactionResponse")
    # Process validation error
  end
  raise e
end
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-transaction-payin" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}


# Testing based on input
You can test success/error scenarios based on payload attributes such as:
- mobile_number
- amount

## XOF mobile collections
### Success scenario
When testing collections for `XOF::Mobile`, you can use a mobile number ending with `0` to have a collection succeed. The payload for this scenario would be:
{% capture data-raw %}

```javascript
{
  "id": "1625c534-6db4-4f3a-adf2-62a8bec89080",
  "type": "XOF::Mobile",
  "ux_flow": "ussd_voucher",
  "state": "initial",
  "in_details": {
    "otp": "1234",
    "phone_number": "+221771234700", // E.164 international format
    "mobile_provider": "orange",
    "country": "SN"
  },
  "out_details": {
    "style": "info"
  },
  "instructions": {}
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-success" raw=data-raw %}

Once the collection request is processed, you'd receive a `payin_method.paid_in` webhook:
{% capture data-raw %}

```javascript
{
  "webhook": "ddef6199-6171-43ba-bbb5-29fb06c9df9f",
  "event": "payin_method.paid_in",
  "object": {
    "id": "1625c534-6db4-4f3a-adf2-62a8bec89080",
    "type": "XOF::Mobile",
    "ux_flow": "ussd_voucher",
    "state": "success",
    "state_reason_details": {
      "code": "0",
      "category": "paid",
      "messages": [
        "Success",
        "Success",
        "Success"
      ],
      "description": "The transaction was successfully completed."
    },
    "in_details": {
      "otp": "1234",
      "ux_flow": "ussd_voucher",
      "phone_number": "+221771234700", // E.164 international format
      "mobile_provider": "orange",
      "country": "SN"
    },
    "out_details": {
      "style": "info"
    },
    "instructions": {
    },
    "transaction_id": "0d59466a-dc2f-4aca-bad1-d4a98da37697",
    "transaction_external_id": "510c4e28-fe33-4c06-bd79-49d52d5b3094"
  }
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-paid-in" raw=data-raw %}


### Error scenario
When testing collections for `XOF::Mobile`, you can use a mobile number ending with `9` to have a collection fail. The payload for this scenario would be:
{% capture data-raw %}

```javascript
{
  "id": "1625c534-6db4-4f3a-adf2-62a8bec89080",
  "type": "XOF::Mobile",
  "ux_flow": "ussd_voucher",
  "state": "initial",
  "in_details": {
    "otp": "1234",
    "phone_number": "+221771234709", // E.164 international format
    "mobile_provider": "orange",
    "country": "SN"
  },
  "out_details": {
    "style": "info"
  },
  "instructions": {}
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-error" raw=data-raw %}

Once the collection request is processed, you'd receive a `payin_method.error` webhook:
{% capture data-raw %}

```javascript
{
  "webhook": "ddef6199-6171-43ba-bbb5-29fb06c9df9f",
  "event": "payin_method.error",
  "object": {
    "id": "10bcee73-2c39-4c0d-9e00-7540c4d34a91",
    "type": "XOF::Mobile",
    "ux_flow": "ussd_voucher",
    "state": "error",
    "state_reason_details": {
      "code": "412",
      "category": "invalid_user_data_error",
      "messages": [
        "User Error",
        "Invalid user details",
        "Invalid mobile number"
      ],
      "description": "Mobile details are invalid. Please update the mobile details. You can also cancel this transaction."
    },
    "in_details": {
      "otp": "1234",
      "ux_flow": "ussd_voucher",
      "phone_number": "+221771234709", // E.164 international format
      "mobile_provider": "orange",
      "country": "SN"
    },
    "out_details": {
      "style": "info"
    },
    "instructions": {
    },
    "transaction_id": "b83f38d6-fc4c-49de-b512-f45ac914bbea",
    "transaction_external_id": "9b5f3c64-9b6b-41b8-9658-168999961b70"
  }
}
```

{% endcapture%}

{% include language-tabbar.html prefix="collection-xof-mobile-error" raw=data-raw %}

# Automated Testing with Simulated Data

<strong>Welcome to the AZA automated testing playground!</strong>

This guide will show you how to safely test your integration with our API using simulated transactions, without real data or money involved, in our Sandbox environment.

# Why Use Simulated Testing?

Simulated testing lets you:

- <strong>Validate integration flows</strong> (e.g. account validation and transaction creation/payout).

- <strong>Simulate different transactions and recipients states</strong> (paid, pending, temporary errors, recipient errors and sender errors).

- <strong>Catch errors early</strong>, before they hit production.

All tests happen in our Sandbox environment, using deterministic test data, making responses consistent and predictable.

# Account validation

We currently support simulated account validation tests in our Sandbox environment for the following countries/corridors:
- <strong>Ghana</strong> (`GHS::Bank` and `GHS::Mobile`)
- <strong>Nigeria</strong> (`NGN::Bank`)
- <strong>Uganda</strong> (`UGX::Mobile`)

<br>

The account validation test is a simulation of the account validation flow, which is used to verify the validity of a recipient's account before sending money. The test will return a success or failure response based on the provided `bank_account` or `phone_number` (depending on the corridor) last (or last 2) digit(s).

- For `GHS::Bank` and `GHS::Mobile` a `bank_account` or `phone_number` ending in a digit between `0` and `8` will return a successful response, whereas setting `9` as last digit will return a failure response (for the full request details please refer to the [Ghana Account Validation Documentation]({{ "/docs/account-validation/" | prepend: site.baseurl }}#ghana)).

- For `NGN::Bank` a `bank_account` ending in a digit between `0` and `9` will return a successful response, whereas setting `39` as the last 2 digits will return a failure response (for the full request details please refer to the [Nigeria Account Validation Documentation]({{ "/docs/account-validation/" | prepend: site.baseurl }}#nigeria)).

- For `UGX::Mobile` with `airtel` set as mobile provider a `phone_number` ending in a digit between `0` and `9` will return a successful response, whereas setting `29` as the last 2 digits will return a failure response.

- For `UGX::Mobile` with `mtn` set as mobile provider a `phone_number` ending in a digit between `0` and `9` will return a successful response, whereas setting `19` as the last 2 digits will return a failure response.

For the full request details please refer to the [Uganda Account Validation Documentation]({{ "/docs/account-validation/" | prepend: site.baseurl }}#uganda).

Please refer to the [Account Validation Responses]({{ "/docs/account-validation/" | prepend: site.baseurl }}#responses) section for more detailed informations about the possible responses you can expect to be returned for each scenario (kindly note that the system failure/connectivity issue scenario - `Account validation failed` error response - is not currently available to be tested in Sandbox).

# Payouts

We currently support simulated payouts tests in our Sandbox environment for the following countries/corridors:
- <strong>Ghana</strong> (`GHS::Bank` and `GHS::Mobile`)
- <strong>Nigeria</strong> (`NGN::Bank`)
- <strong>Uganda</strong> (`UGX::Mobile`)
- <strong>CEMAC Region (XAF)</strong> (`XAF::Mobile`)
- <strong>WAEMU Region (XOF)</strong> (`XOF::Mobile`)

<br>

Kindly reference the table below when testing our simulated payout feature, showing the expected setup and corresponding responses for different countries and corridors (`category`, `code` and `description` will be returned in the `state_reason_details` object - please refer to the [Receiving error messages]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#receiving-error-messages) section for more informations):

## Ghana
### GHS::Bank

<div class="alert alert-info" markdown="1">
  **Note:** Please refer to the [GHS::Bank payouts documentation]({{ "/docs/individual-payments/" | prepend: site.baseurl }}#ghsbank) for more details about the full request.
</div>

| Account number ending with | Example Account Number | Category (Transaction status) | Code | Description |
|----------------------------|------------------------|-------------------------------|------|-------------|
| 00                         | 12345678900            | paid                          | 0    | The transaction was successfully completed. |
| 01                         | 12345678901            | pending                       | 14   | This transaction is awaiting a status update from the provider. |
| 18                         | 12345678918            | temporary_error               | 3    | The payment provider is not accepting transactions at the moment. We will retry the transaction at a later date. You can also edit or cancel this transaction. |
| 19                         | 12345678919            | sender_error                  | 5    | Transaction cannot be processed. Please cancel this transaction. |
| 39                         | 12345678939            | recipient_error               | 421  | Daily transfer limits have been exceeded. Please update the details. You can also cancel this transaction. |

### GHS::Mobile

<div class="alert alert-info" markdown="1">
  **Note:** Please refer to the [GHS::Mobile payouts documentation]({{ "/docs/individual-payments/" | prepend: site.baseurl }}#ghsmobile) for more details about the full request.
</div>

| Phone number ending with | Example Phone Number | Category (Transaction status) | Code | Description |
|--------------------------|----------------------|-------------------------------|------|-------------|
| 00                       | +233302123400        | paid                          | 0    | The transaction was successfully completed. |
| 01                       | +233302123401        | pending                       | 14   | This transaction is awaiting a status update from the provider. |
| 18                       | +233302123418        | temporary_error               | 3    | The payment provider is not accepting transactions at the moment. We will retry the transaction at a later date. You can also edit or cancel this transaction. |
| 19                       | +233302123419        | sender_error                  | 5    | Transaction cannot be processed. Please cancel this transaction. |
| 39                       | +233302123439        | recipient_error               | 421  | Daily transfer limits have been exceeded. Please update the details. You can also cancel this transaction. |

## Nigeria
### NGN::Bank

<div class="alert alert-info" markdown="1">
  **Note:** Please refer to the [NGN::Bank payouts documentation]({{ "/docs/individual-payments/" | prepend: site.baseurl }}#ngnbank) for more details about the full request.
</div>

| Account number ending with | Example Account Number | Category (Transaction status) | Code | Description |
|----------------------------|------------------------|-------------------------------|------|-------------|
| 00                         | 12345678900            | paid                          | 0    | The transaction was successfully completed. |
| 01                         | 12345678901            | pending                       | 14   | This transaction is awaiting a status update from the provider. |
| 08                         | 12345678908            | temporary_error               | 3    | The payment provider is not accepting transactions at the moment. We will retry the transaction at a later date. You can also edit or cancel this transaction. |
| 19                         | 12345678919            | recipient_error               | 416  | Account number is invalid. Please update the account details. You can also cancel this transaction. |
| 71                         | 12345678971            | sender_error                  | 511  | Sender is not allowed to transact. Please cancel this transaction. |

## Uganda
### UGX::Mobile

<div class="alert alert-info" markdown="1">
  **Note:** Please refer to the [UGX::Mobile payouts documentation]({{ "/docs/individual-payments/" | prepend: site.baseurl }}#ugxmobile) for more details about the full request.
</div>

- With `airtel` set as mobile provider:

| Phone number ending with | Example Phone Number | Category (Transaction status) | Code | Description |
|--------------------------|----------------------|-------------------------------|------|-------------|
| 00                       | +256752123400        | paid                          | 0    | The transaction was successfully completed. |
| 11                       | +256752123411        | pending                       | 14   | This transaction is awaiting a status update from the provider. |
| 18                       | +256752123418        | temporary_error               | 331  | There was an issue while creating the transaction. We will retry the payment. You can also edit or cancel this transaction. |
| 19                       | +256752123419        | recipient_error               | 42   | Transfer limits have been exceeded. Please update the details. You can also cancel this transaction. |
| 49                       | +256752123449        | sender_error                  | 5    | Transaction cannot be processed. Please cancel this transaction. |

- With `mtn` set as mobile provider:

| Phone number ending with | Example Phone Number | Category (Transaction status) | Code | Description |
|--------------------------|----------------------|-------------------------------|------|-------------|
| 0                        | +256772123400        | paid                          | 0    | The transaction was successfully completed. |
| 1                        | +256772123411        | pending                       | 14   | This transaction is awaiting a status update from the provider. |
| 18                       | +256772123418        | temporary_error               | 331  | There was an issue while creating the transaction. We will retry the payment. You can also edit or cancel this transaction. |
| 09                       | +256772123419        | recipient_error               | 414  | Mobile number is not registered for mobile money. Please update the mobile details. You can also cancel this transaction. |

## CEMAC Region (XAF)
### XAF::Mobile

<div class="alert alert-info" markdown="1">
  **Note:** Please refer to the [XAF::Mobile payouts documentation]({{ "/docs/individual-payments/" | prepend: site.baseurl }}#xafmobile) for more details about the full request.
</div>

#### Cameroon

| Phone number ending with | Example Phone Number | Category (Transaction status) | Code | Description |
|--------------------------|----------------------|-------------------------------|------|-------------|
| 00                       | +237674044400        | paid                          | 0    | The transaction was successfully completed. |
| 01                       | +237674044401        | pending                       | 14   | This transaction is awaiting a status update from the provider. |
| 38                       | +237674044438        | temporary_error               | 3    | The payment provider is not accepting transactions at the moment. We will retry the transaction at a later date. You can also edit or cancel this transaction. |
| 09                       | +237674044409        | sender_error                  | 531  | Invalid transaction details provided. Please cancel this transaction. |
| 69                       | +237674044469        | recipient_error               | 42   | Transfer limits have been exceeded. Please update the details. You can also cancel this transaction. |

#### Gabon

| Phone number ending with | Example Phone Number | Category (Transaction status) | Code | Description |
|--------------------------|----------------------|-------------------------------|------|-------------|
| 0                        | +24174709400         | paid                          | 0    | The transaction was successfully completed. |
| 1                        | +24174709401         | pending                       | 14   | This transaction is awaiting a status update from the provider. |
| 08                       | +24174709408         | temporary_error               | 3    | The payment provider is not accepting transactions at the moment. We will retry the transaction at a later date. You can also edit or cancel this transaction. |
| 09                       | +24174709409         | recipient_error               | 423  | Account has reached maximum balance. It cannot accept more funds. |

## WAEMU Region (XOF)
### XOF::Mobile

<div class="alert alert-info" markdown="1">
  **Note:** Please refer to the [XOF::Mobile payouts documentation]({{ "/docs/individual-payments/" | prepend: site.baseurl }}#xofmobile) for more details about the full request.
</div>

| Phone number ending with | Example Phone Number | Category (Transaction status) | Code | Description |
|--------------------------|----------------------|-------------------------------|------|-------------|
| 00                       | +221774044400        | paid                          | 0    | The transaction was successfully completed. |
| 01                       | +221774044401        | pending                       | 14   | This transaction is awaiting a status update from the provider. |
| 38                       | +221774044438        | temporary_error               | 3    | The payment provider is not accepting transactions at the moment. We will retry the transaction at a later date. You can also edit or cancel this transaction. |
| 09                       | +221774044409        | sender_error                  | 531  | Invalid transaction details provided. Please cancel this transaction. |
| 69                       | +221774044469        | recipient_error               | 42   | Transfer limits have been exceeded. Please update the details. You can also cancel this transaction. |
