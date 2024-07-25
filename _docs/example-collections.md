---
title: Collections Example
permalink: /docs/example-collections/
---

* Table of Contents
{:toc}

# Introduction

In this example we'll go through all of the steps and give examples on what you'll need to do to implement a call to collect funds from customers. Once you've read through this guide you'll know everything that is required by us for you to use our collection system.

Make sure you collect the relevant details from your customers. These would include their name and mobile number. Once you have the details collected on your end, you can then initiate the transaction in our system. This example will guide you through the details you need to set and what calls you need to make. Since the easiest way to access our system is through our SDKs this guide is mainly aimed at users of our SDKs.

<div class="alert alert-warning" markdown="1">
**Warning!** We require that all implementations to our site pass our onboarding test before we allow users to access our production site. This example shows the preferred solution to all requirements we have, so following this example will make sure you will adhere to our requirements and will hopefully pass our onboarding test.
</div>

# Authentication

First thing is that you'll need to authenticate to use our site. You can get your API key and secret by logging in to the [TransferZero developer portal](https://developers.transferzero.com).

<div class="alert alert-info" markdown="1">
**Note!** You need to [contact us](mailto:info@transferzero.com){: .alert-link} before you are allowed to use our sandbox environment. Once you reach out to us you'll also be invited to our Slack channel where you can post questions about our API that will be answered by our Engineering team. We prefer technical communication to go through this Slack channel.
</div>

Once you obtain your api key and secret you'll need to set up your environment with them:

{% capture data-raw %}
See the [authentication documentation]({{ "/docs/authentication/" | prepend: site.baseurl }}) for more details on the authentication process if you're not using our SDKs
{% endcapture %}

{% capture data-csharp %}
```csharp
Configuration configuration = new Configuration();
configuration.ApiKey = "<key>";
configuration.ApiSecret = "<secret>";
configuration.BasePath = "https://api-sandbox.transferzero.com/v1";
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim configuration As Configuration = New Configuration()
configuration.ApiKey = "KEY"
configuration.ApiSecret = "SECRET"
configuration.BasePath = "https://api-sandbox.transferzero.com/v1"
```
{% endcapture %}

{% capture data-java %}
```java
ApiClient apiClient = new ApiClient();
apiClient.setApiKey("<key>");
apiClient.setApiSecret("<secret>");
apiClient.setBasePath("https://api-sandbox.transferzero.com/v1");
```
{% endcapture %}

{% capture data-js %}
```js
const apiClient = new ApiClient();
apiClient.apiKey = '<key>';
apiClient.apiSecret = '<secret>';
apiClient.basePath = 'https://api-sandbox.transferzero.com/v1';
```
{% endcapture %}

{% capture data-php %}
```php
TransferZero\Configuration::getDefaultConfiguration()
    ->setHost("https://api-sandbox.transferzero.com/v1")
    ->setApiKey("<key>")
    ->setApiSecret("<secret>");
```
{% endcapture %}

{% capture data-ruby %}
```ruby
TransferZero.configure do |config|
    config.api_key = '<key>'
    config.api_secret = '<secret>'
    config.host = 'https://api-sandbox.transferzero.com/v1'
end
```
{% endcapture %}

{% include language-tabbar.html prefix="auth" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}

# Collection details

For collection requests we will need to set up the collection details for each of the customers. Currently we require the phone number for each of them that we can use to contact them about the payment they will need to do.

<div class="alert alert-info" markdown="1">
**Note!** While the external ID is generally optional for transactions, sending it can help tie transactions between our systems easier. Also you can use it to block duplicate transactions as we won't allow you to send in another transaction with the same external ID in the future.
</div>

{::comment}
CODE_EXAMPLE_START transaction-creation
JSON_START
{
    "payin_methods": [{
        "type": "NGN::Bank",
        "ux_flow": "bank_transfer",
        "in_details": {
            "phone_number": "+234787221236", // E.164 international format
        }
    }],
    "input_currency": "NGN",
    "external_id": "Transaction:NGN:91475",
    "metadata": {}
}
JSON_END

CODE_START
CREATE_START details PayinMethodDetails
SET LIT phone_number "+234787221236" // E.164 international format
CREATE_END

CREATE_START method PayinMethod
SET LIT type "NGN::Bank"
SET ENUM ux_flow PayinMethodUxFlow bank_transfer
SET VAR in_details details
CREATE_END

CREATE_START transaction Transaction
SET VAR_ARRAY payin_methods PayinMethod method
SET LIT input_currency "NGN"
SET LIT external_id "Transaction:NGN:91475"
CREATE_END
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
{
    "payin_methods": [{
        "type": "NGN::Bank",
        "ux_flow": "bank_transfer",
        "in_details": {
            "phone_number": "+234787221236", // E.164 international format
        }
    }],
    "input_currency": "NGN",
    "external_id": "Transaction:NGN:91475",
    "metadata": {}
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
PayinMethodDetails details = new PayinMethodDetails(
  phoneNumber: "+234787221236", // E.164 international format
);

PayinMethod method = new PayinMethod(
  type: "NGN::Bank",
  uxFlow: PayinMethodUxFlow.BANK_TRANSFER,
  inDetails: details);

Transaction transaction = new Transaction(
  payinMethods: new List<PayinMethod>() { method },
  inputCurrency: "NGN",
  externalId: "Transaction:NGN:91475");
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim details as PayinMethodDetails = New PayinMethodDetails(
  phoneNumber:="+234787221236", ' E.164 international format
)

Dim method as PayinMethod = New PayinMethod(
  type:="NGN::Bank",
  uxFlow:=PayinMethodUxFlow.BANK_TRANSFER,
  inDetails:=details)

Dim transaction as Transaction = New Transaction(
  payinMethods:=New List(Of PayinMethod)() From { method },
  inputCurrency:="NGN",
  externalId:="Transaction:NGN:91475")
```
{% endcapture %}

{% capture data-java %}
```java
PayinMethodDetails details = new PayinMethodDetails();
details.setPhoneNumber("+234787221236"); // E.164 international format

PayinMethod method = new PayinMethod();
method.setType("NGN::Bank");
method.setUxFlow(PayinMethodUxFlow.BANK_TRANSFER);
method.setInDetails(details);

Transaction transaction = new Transaction();
transaction.addPayinMethodsItem(method);
transaction.setInputCurrency("NGN");
transaction.setExternalId("Transaction:NGN:91475");
```
{% endcapture %}

{% capture data-js %}
```js
const details = new TransferZeroSdk.PayinMethodDetails();
details.phone_number = "+234787221236"; // E.164 international format

const method = new TransferZeroSdk.PayinMethod();
method.type = "NGN::Bank";
method.ux_flow = "bank_transfer";
method.in_details = details;

const transaction = new TransferZeroSdk.Transaction();
transaction.payin_methods = [method];
transaction.input_currency = "NGN";
transaction.external_id = "Transaction:NGN:91475";
```
{% endcapture %}

{% capture data-php %}
```php
$details = new PayinMethodDetails();
$details->setPhoneNumber("+234787221236"); // E.164 international format

$method = new PayinMethod();
$method->setType("NGN::Bank");
$method->setUxFlow("bank_transfer");
$method->setInDetails($details);

$transaction = new Transaction();
$transaction->setPayinMethods([method]);
$transaction->setInputCurrency("NGN");
$transaction->setExternalId("Transaction:NGN:91475");
```
{% endcapture %}

{% capture data-ruby %}
```ruby
details = TransferZero::PayinMethodDetails.new
details.phone_number = "+234787221236" # E.164 international format

method = TransferZero::PayinMethod.new
method.type = "NGN::Bank"
method.ux_flow = "bank_transfer"
method.in_details = details

transaction = TransferZero::Transaction.new
transaction.payin_methods = [method]
transaction.input_currency = "NGN"
transaction.external_id = "Transaction:NGN:91475"
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-transaction-creation" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

# Creating the transaction

Now that we have generated the objects, we'll need to call the endpoint. Note that once the transaction is created the senders will receive a notification on how to send in the funds.
You will also receive these information in the response object if you wish to communicate these to your customers via other means, like email.

{::comment}
CODE_EXAMPLE_START transaction-call
JSON_START
POST /v1/transactions

{
    "transaction": {
        // full transaction details from the previous section
    }
}
JSON_END

CODE_START
CREATE_START request TransactionRequest
SET VAR transaction transaction
CREATE_END

CREATE_API api TransactionsApi

POST_ENDPOINT_CALL TransactionResponse response api post_transactions request
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
POST /v1/transactions

{
    "transaction": {
        // full transaction details from the previous section
    }
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
TransactionRequest request = new TransactionRequest(
  transaction: transaction);

TransactionsApi api = new TransactionsApi(configuration);

try {
  TransactionResponse response = api.PostTransactions(request);
} catch (ApiException e) {
  if (e.IsValidationError)
    TransactionResponse response = e.ParseObject<TransactionResponse>();
    // Process validation error
  }
  throw e;
}
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim request as TransactionRequest = New TransactionRequest(
  transaction:=transaction)

Dim api as TransactionsApi = New TransactionsApi(configuration)

Try
  Dim response as TransactionResponse = api.PostTransactions(request)
Catch e As ApiException
  If e.IsValidationError Then
    Dim response as TransactionResponse = e.ParseObject(Of TransactionResponse)()
    ' Process validation error
  End If
  Throw e
End Try
```
{% endcapture %}

{% capture data-java %}
```java
TransactionRequest request = new TransactionRequest();
request.setTransaction(transaction);

TransactionsApi api = new TransactionsApi(apiClient);

try {
  TransactionResponse response = api.postTransactions(request);
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
const request = new TransferZeroSdk.TransactionRequest();
request.transaction = transaction;

const api = new TransferZeroSdk.TransactionsApi(apiClient);

try {
  const response = await api.postTransactions(request);
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
$request = new TransactionRequest();
$request->setTransaction($transaction);

$api = new TransactionsApi();

try {
  $response = api->postTransactions($request);
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
request = TransferZero::TransactionRequest.new
request.transaction = transaction

api = TransferZero::TransactionsApi.new

begin
  response = api.post_transactions(request)
rescue TransferZero::ApiError => e
  if e.validation_error
    response = e.response_object("TransactionResponse")
    # Process validation error
  end
  raise e
end
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-transaction-call" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

Once you create the transaction you can also check the response object to see the exact bank details your customers need to send in their funds. You will receive bank transfer information in the `out_details`:

{% capture data-raw %}

```javascript
"out_details": {
  "style": "bank_transfer",
  "amount": 0,
  "currency": "NGN",
  "bank_code": "bank code",
  "bank_name": "bank name",
  "created_at": "created at",
  "account_name": "account name",
  "account_number": "account number",
  "account_reference": "account reference"
}
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ngn-bank-out" raw=data-raw %}

And human readable instructions can be found in the `payin_methods[0].instructions` hash in the following format:

(instructions for NGN Bank payment)

{% capture data-raw %}

```javascript
"instructions": {
  "bank_transfer": "\\nTransfer the exact amount specified to the provided virtual account number.\\nMake sure to complete the payment within one day from the time you receive these instructions.\\n"
}
```

{% endcapture %}

{% include language-tabbar.html prefix="collection-ngn-bank-instructions" raw=data-raw %}

<div class="alert alert-info" markdown="1">
**Info!** Please note that as you can usually always expect validation errors calling any of our endpoints, so you should always check for errors when calling our APIs. A transaction which has validation errors is never created, you have to re-create it once the problems with the details have been fixed.
</div>

# Waiting for the transaction to finish

Once the transaction is created, the customers have one day to fulfill the collection requirements. After this initial period has elapsed the transaction will be cancelled and it will not accept funds received anymore. In order to let you know when the customer has fulfilled the collection and paid in the funds we will send out a notification to your registered webhook address.

To set up webhooks you can use the [TransferZero developer portal](https://developers.transferzero.com). We will always call the endpoint you set up here using `POST`, and the request will always contain the same authentication headers you'll need to use to call our APIs, so you can use them to validate that the request is coming from us.

# Schedule the onboarding call

Once you have implemented all of the steps based on the example above you have fulfilled our requirements for a successful integration. Please schedule an onboarding call with us and we'll check your implementation and allow access to our production environment if all is good.
