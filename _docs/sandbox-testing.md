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


# Account validation

When testing our account validation feature for GHS and NGN bank payments any account number starting with a `9` will return a failure. All other account numbers will return a user with name `TEST USER`. For GHS mobile similalry phone numbers ending in an `8` or `9` will return a failure, while others return a user with name `TEST USER`. This applies to both the [account name enquiry]({{ "/docs/additional-features/" | prepend: site.baseurl }}#account-name-enquiry) feature and the [name validation in transactions]({{ "/docs/additional-features/" | prepend: site.baseurl }}#name-validation-in-transactions) feature.

# Testing additional scenarios

When developing your integration and you wish to test a different scenario you can also ping us in your partners slack channel where we're happy to help you set up the scenarios during normal working hours.
