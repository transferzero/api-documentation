---
title: Collections Example
permalink: /docs/example-collections/
---

* Table of Contents
{:toc}

# Introduction

In this example we'll go through all of the steps and give examples on what you'll need to do to implement a call to collect funds from  customers into your internal balance. Once you've read through this guide you'll know everything that is required by us for you to use our collection system.

Let's assume that you would like to obtain funds from one of your Ghanan customer, `Jane Doe`. You have already fully KYC'd her, as she is a recurring user on your site. Her user ID in your system is `Sender:GH:9547`. She creates an order in your system for which she is charged `50 GHS` that she'd like to pay using her mobile wallet. For this transaction let's assume the transaction created in your system has an ID of `Collection:GHS:91475`.

Once you have the details collected on your end, you can then initiate the transaction in our system. This example will guide you through the details you need to set and what calls you need to make. Since the easiest way to access our system is through our SDKs this guide is mainly aimed at users of our SDKs.

<div class="alert alert-warning" markdown="1">
**Warning!** We require that all implementations to our site pass our onboarding test before we allow users to access our prouction site. This example shows the preferred solution to all requirements we have, so following this example will make sure you will adhere to our requirements and will hopefully pass our onboarding test.
</div>

<div class="alert alert-info" markdown="1">
**Note!** This guide assumes that you are doing a full KYC on your senders which we have approved. If not some of the steps can be slightly more complex than shown in this guide, most notably you'll need to create senders separately and wait for them to get approved before you can create transactions. Please check our [KYC guide]({{ "/docs/kyc/" | prepend: site.baseurl }}){: .alert-link} for more info.
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

# Sender details

Next step is setting up the sender details. Generally you'll need to send us the following information for every sender:

* name
* country
* phone number
* address
* birth date
* email address

<div class="alert alert-info" markdown="1">
**Note!** Dependent on your KYC processes you might be able opt in to use WTR2 rules for your senders in which case the requirements are slightly relaxed. Please contact us if this is of any interest to you!
</div>

You should also send us the ID you use in your local system to link to this sender, in this example `Sender:GH:9547`. By doing so you'll be able to handle senders much easier in our system.

<div class="alert alert-warning" markdown="1">
**Warning!** Being able to re-use senders is one of our main requirements for successful onboarding. By linking the senders from your system to our system you can make sure you won't have issues fulfilling this dependency.
</div>

{::comment}
CODE_EXAMPLE_START sender-creation
JSON_START
{
    "first_name": "Jane",
    "last_name": "Doe",

    "phone_country": "GH",
    "phone_number": "+233301234567", // E.164 international format

    "country": "GH",
    "city": "Accra",
    "street": "1 La Rd",
    "postal_code": "GA100",
    "address_description": "",

    "birth_date": "1974-12-24",

    // you can usually use your company's contact email address here
    "email": "info@transferzero.com",

    "external_id": "Sender:GH:9547",

    // these fields are mandatory, but you can usually leave them with the following default values:
    "documents": [ ],
    "ip": "127.0.0.1",
    "metadata": {}
}
JSON_END

CODE_START
CREATE_START sender Sender
SET LIT first_name "Jane"
SET LIT last_name "Doe"

SET LIT phone_country "GH"
SET LIT phone_number "+233301234567" // E.164 international format

SET LIT country "GH"
SET LIT city "Accra"
SET LIT street "1 La Rd"
SET LIT postal_code "GA100"
SET LIT address_description ""

SET DATE birth_date "1974-12-24"

COMMENT you can usually use your company's contact email address here
SET LIT email "info@transferzero.com"

SET LIT external_id "Sender:GH:9547"

COMMENT you'll need to set these fields but usually you can leave them the default
SET LIT ip "127.0.0.1"
SET EMPTY_ARRAY documents Document
CREATE_END
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
{
    "first_name": "Jane",
    "last_name": "Doe",

    "phone_country": "GH",
    "phone_number": "+233301234567", // E.164 international format

    "country": "GH",
    "city": "Accra",
    "street": "1 La Rd",
    "postal_code": "GA100",
    "address_description": "",

    "birth_date": "1974-12-24",

    // you can usually use your company's contact email address here
    "email": "info@transferzero.com",

    "external_id": "Sender:GH:9547",

    // these fields are mandatory, but you can usually leave them with the following default values:
    "documents": [ ],
    "ip": "127.0.0.1",
    "metadata": {}
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
Sender sender = new Sender(
  firstName: "Jane",
  lastName: "Doe",

  phoneCountry: "GH",
  phoneNumber: "0301234567",

  country: "GH",
  city: "Accra",
  street: "1 La Rd",
  postalCode: "GA100",
  addressDescription: "",

  birthDate: DateTime.Parse("1974-12-24"),

// you can usually use your company's contact email address here
  email: "info@transferzero.com",

  externalId: "Sender:GH:9547",

// you'll need to set these fields but usually you can leave them the default
  ip: "127.0.0.1",
  documents: new List<Document>());
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim sender as Sender = New Sender(
  firstName:="Jane",
  lastName:="Doe",

  phoneCountry:="GH",
  phoneNumber:="0301234567",

  country:="GH",
  city:="Accra",
  street:="1 La Rd",
  postalCode:="GA100",
  addressDescription:="",

  birthDate:=DateTime.Parse("1974-12-24"),

' you can usually use your company's contact email address here
  email:="info@transferzero.com",

  externalId:="Sender:GH:9547",

' you'll need to set these fields but usually you can leave them the default
  ip:="127.0.0.1",
  documents:=New List(Of Document)()))
```
{% endcapture %}

{% capture data-java %}
```java
Sender sender = new Sender();
sender.setFirstName("Jane");
sender.setLastName("Doe");

sender.setPhoneCountry("GH");
sender.setPhoneNumber("0301234567");

sender.setCountry("GH");
sender.setCity("Accra");
sender.setStreet("1 La Rd");
sender.setPostalCode("GA100");
sender.setAddressDescription("");

sender.setBirthDate(LocalDate.parse("1974-12-24"));

// you can usually use your company's contact email address here
sender.setEmail("info@transferzero.com");

sender.setExternalId("Sender:GH:9547");

// you'll need to set these fields but usually you can leave them the default
sender.setIp("127.0.0.1");
sender.setDocuments(new ArrayList<>());
```
{% endcapture %}

{% capture data-js %}
```js
const sender = new TransferZeroSdk.Sender();
sender.first_name = "Jane";
sender.last_name = "Doe";

sender.phone_country = "GH";
sender.phone_number = "+233301234567"; // E.164 international format

sender.country = "GH";
sender.city = "Accra";
sender.street = "1 La Rd";
sender.postal_code = "GA100";
sender.address_description = "";

sender.birth_date = "1974-12-24";

// you can usually use your company's contact email address here
sender.email = "info@transferzero.com";

sender.external_id = "Sender:GH:9547";

// you'll need to set these fields but usually you can leave them the default
sender.ip = "127.0.0.1";
sender.documents = [];
```
{% endcapture %}

{% capture data-php %}
```php
$sender = new Sender();
$sender->setFirstName("Jane");
$sender->setLastName("Doe");

$sender->setPhoneCountry("GH");
$sender->setPhoneNumber("0301234567");

$sender->setCountry("GH");
$sender->setCity("Accra");
$sender->setStreet("1 La Rd");
$sender->setPostalCode("GA100");
$sender->setAddressDescription("");

$sender->setBirthDate("1974-12-24");

// you can usually use your company's contact email address here
$sender->setEmail("info@transferzero.com");

$sender->setExternalId("Sender:GH:9547");

// you'll need to set these fields but usually you can leave them the default
$sender->setIp("127.0.0.1");
$sender->setDocuments([]);
```
{% endcapture %}

{% capture data-ruby %}
```ruby
sender = TransferZero::Sender.new
sender.first_name = "Jane"
sender.last_name = "Doe"

sender.phone_country = "GH"
sender.phone_number = "+233301234567" # E.164 international format

sender.country = "GH"
sender.city = "Accra"
sender.street = "1 La Rd"
sender.postal_code = "GA100"
sender.address_description = ""

sender.birth_date = "1974-12-24"

# you can usually use your company's contact email address here
sender.email = "info@transferzero.com"

sender.external_id = "Sender:GH:9547"

# you'll need to set these fields but usually you can leave them the default
sender.ip = "127.0.0.1"
sender.documents = []
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-sender-creation" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

# Recipient details

Once you have the sender let's set up the recipient as well. For collections you usually collect the funds in your internal wallet. Let's assume you wish to collect the funds in `USD` (we'll calculate the exchange rate).

{::comment}
CODE_EXAMPLE_START recipient-creation
JSON_START
{
    "requested_amount": "50",
    "requested_currency": "GHS",
    "payout_method": {
        "type": "USD::Balance",
        "details": {
            "reference": "Collection:GHS:91475"
        }
    }
}
JSON_END

CODE_START
CREATE_START details PayoutMethodDetails
SET LIT reference "Collection:GHS:91476"
CREATE_END

CREATE_START payout PayoutMethod
SET LIT type "USD::Balance"
SET VAR details details
CREATE_END

CREATE_START recipient Recipient
SET BIGNUM requested_amount 50
SET LIT requested_currency "GHS"
SET VAR payout_method payout
CREATE_END
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
{
    "requested_amount": "50",
    "requested_currency": "GHS",
    "payout_method": {
        "type": "USD::Balance",
        "details": {
            "reference": "Collection:GHS:91475"
        }
    }
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
PayoutMethodDetails details = new PayoutMethodDetails(
  reference: "Collection:GHS:91476");

PayoutMethod payout = new PayoutMethod(
  type: "USD::Balance",
  details: details);

Recipient recipient = new Recipient(
  requestedAmount: 50,
  requestedCurrency: "GHS",
  payoutMethod: payout);
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim details as PayoutMethodDetails = New PayoutMethodDetails(
  reference:="Collection:GHS:91476")

Dim payout as PayoutMethod = New PayoutMethod(
  type:="USD::Balance",
  details:=details)

Dim recipient as Recipient = New Recipient(
  requestedAmount:=50,
  requestedCurrency:="GHS",
  payoutMethod:=payout)
```
{% endcapture %}

{% capture data-java %}
```java
PayoutMethodDetails details = new PayoutMethodDetails();
details.setReference("Collection:GHS:91476");

PayoutMethod payout = new PayoutMethod();
payout.setType("USD::Balance");
payout.setDetails(details);

Recipient recipient = new Recipient();
recipient.setRequestedAmount(new BigDecimal("50"));
recipient.setRequestedCurrency("GHS");
recipient.setPayoutMethod(payout);
```
{% endcapture %}

{% capture data-js %}
```js
const details = new TransferZeroSdk.PayoutMethodDetails();
details.reference = "Collection:GHS:91476";

const payout = new TransferZeroSdk.PayoutMethod();
payout.type = "USD::Balance";
payout.details = details;

const recipient = new TransferZeroSdk.Recipient();
recipient.requested_amount = 50;
recipient.requested_currency = "GHS";
recipient.payout_method = payout;
```
{% endcapture %}

{% capture data-php %}
```php
$details = new PayoutMethodDetails();
$details->setReference("Collection:GHS:91476");

$payout = new PayoutMethod();
$payout->setType("USD::Balance");
$payout->setDetails($details);

$recipient = new Recipient();
$recipient->setRequestedAmount(50);
$recipient->setRequestedCurrency("GHS");
$recipient->setPayoutMethod($payout);
```
{% endcapture %}

{% capture data-ruby %}
```ruby
details = TransferZero::PayoutMethodDetails.new
details.reference = "Collection:GHS:91476"

payout = TransferZero::PayoutMethod.new
payout.type = "USD::Balance"
payout.details = details

recipient = TransferZero::Recipient.new
recipient.requested_amount = 50
recipient.requested_currency = "GHS"
recipient.payout_method = payout
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-recipient-creation" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

# Collection details

Finally we need to tie the sender and recipient together into a transaction. We also need to set up the collection settings as well. Since we're going to use GHS mobile collection, we'll have to provide the sender's phone number.

<div class="alert alert-info" markdown="1">
**Note!** While the external ID is generally optional for transactions, sending it can help tie transactions between our systems easier. Also you can use it to block duplicate transactions as we won't allow you to send in another transaction with the same external ID in the future.
</div>

{::comment}
CODE_EXAMPLE_START transaction-creation
JSON_START
{
    "sender": {
        // sender details from the previous section
    },
    "recipients": [{
        // recipient details from the previous section
    }],
    "payin_methods": [{
        "type": "GHS::Mobile", 
        "ux_flow": "ussd_popup",
        "in_details": {
            "phone_number": "+2339999999", // E.164 international format
            "mobile_provider": "vodafone" // Mandatory. One of 'airtel', 'tigo', 'mtn', 'vodafone'
        }
    }],
    "input_currency": "GHS",
    "external_id": "Transaction:GHS:91475",
    "metadata": {}
}
JSON_END

CODE_START
CREATE_START details PayinMethodDetails
SET LIT phone_number "+2339999999" // E.164 international format
SET ENUM mobile_provider PayoutMethodMobileProviderEnum vodafone
CREATE_END

CREATE_START method PayinMethod
SET LIT type "GHS::Mobile"
SET ENUM ux_flow PayinMethodUxFlow ussd_popup
SET VAR in_details details
CREATE_END

CREATE_START transaction Transaction
SET VAR sender sender
SET VAR_ARRAY recipients Recipient recipient
SET VAR_ARRAY payin_methods PayinMethod method
SET LIT input_currency "GHS"
SET LIT external_id "Transaction:GHS:91475"
CREATE_END
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
{
    "sender": {
        // sender details from the previous section
    },
    "recipients": [{
        // recipient details from the previous section
    }],
    "payin_methods": [{
        "type": "GHS::Mobile", 
        "ux_flow": "ussd_popup",
        "in_details": {
            "phone_number": "+2339999999", // E.164 international format
            "mobile_provider": "vodafone" // Mandatory. One of 'airtel', 'tigo', 'mtn', 'vodafone'
        }
    }],
    "input_currency": "GHS",
    "external_id": "Transaction:GHS:91475",
    "metadata": {}
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
PayinMethodDetails details = new PayinMethodDetails(
  phoneNumber: "+2339999999",
  mobileProvider: PayoutMethodMobileProviderEnum.VODAFONE);

PayinMethod method = new PayinMethod(
  type: "GHS::Mobile",
  uxFlow: PayinMethodUxFlow.USSD_POPUP,
  inDetails: details);

Transaction transaction = new Transaction(
  sender: sender,
  recipients: new List<Recipient>() { recipient },
  payinMethods: new List<PayinMethod>() { method },
  inputCurrency: "GHS",
  externalId: "Transaction:GHS:91475");
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim details as PayinMethodDetails = New PayinMethodDetails(
  phoneNumber:="+2339999999",
  mobileProvider:=PayoutMethodMobileProviderEnum.VODAFONE)

Dim method as PayinMethod = New PayinMethod(
  type:="GHS::Mobile",
  uxFlow:=PayinMethodUxFlow.USSD_POPUP,
  inDetails:=details)

Dim transaction as Transaction = New Transaction(
  sender:=sender,
  recipients:=New List(Of Recipient)() From { recipient },
  payinMethods:=New List(Of PayinMethod)() From { method },
  inputCurrency:="GHS",
  externalId:="Transaction:GHS:91475")
```
{% endcapture %}

{% capture data-java %}
```java
PayinMethodDetails details = new PayinMethodDetails();
details.setPhoneNumber("+2339999999");
details.setMobileProvider(PayoutMethodMobileProviderEnum.VODAFONE);

PayinMethod method = new PayinMethod();
method.setType("GHS::Mobile");
method.setUxFlow(PayinMethodUxFlow.USSD_POPUP);
method.setInDetails(details);

Transaction transaction = new Transaction();
transaction.setSender(sender);
transaction.addRecipientsItem(recipient);
transaction.addPayinMethodsItem(method);
transaction.setInputCurrency("GHS");
transaction.setExternalId("Transaction:GHS:91475");
```
{% endcapture %}

{% capture data-js %}
```js
const details = new TransferZeroSdk.PayinMethodDetails();
details.phone_number = "+2339999999"; // E.164 international format
details.mobile_provider = "vodafone";

const method = new TransferZeroSdk.PayinMethod();
method.type = "GHS::Mobile";
method.ux_flow = "ussd_popup";
method.in_details = details;

const transaction = new TransferZeroSdk.Transaction();
transaction.sender = sender;
transaction.recipients = [recipient];
transaction.payin_methods = [method];
transaction.input_currency = "GHS";
transaction.external_id = "Transaction:GHS:91475";
```
{% endcapture %}

{% capture data-php %}
```php
$details = new PayinMethodDetails();
$details->setPhoneNumber("+2339999999");
$details->setMobileProvider("vodafone");

$method = new PayinMethod();
$method->setType("GHS::Mobile");
$method->setUxFlow("ussd_popup");
$method->setInDetails($details);

$transaction = new Transaction();
$transaction->setSender($sender);
$transaction->setRecipients([recipient]);
$transaction->setPayinMethods([method]);
$transaction->setInputCurrency("GHS");
$transaction->setExternalId("Transaction:GHS:91475");
```
{% endcapture %}

{% capture data-ruby %}
```ruby
details = TransferZero::PayinMethodDetails.new
details.phone_number = "+2339999999" # E.164 international format
details.mobile_provider = "vodafone"

method = TransferZero::PayinMethod.new
method.type = "GHS::Mobile"
method.ux_flow = "ussd_popup"
method.in_details = details

transaction = TransferZero::Transaction.new
transaction.sender = sender
transaction.recipients = [recipient]
transaction.payin_methods = [method]
transaction.input_currency = "GHS"
transaction.external_id = "Transaction:GHS:91475"
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-transaction-creation" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

<div class="alert alert-info" markdown="1">
**Note!** Every PayinMethod type has a different `ux_flow`. Please consult the [collection details guide]({{ "/docs/collection-details/" | prepend: site.baseurl }}){: .alert-link} for more info.You can also validate the transaction request to confirm its availability.Please consult the [collection flow discovery]({{ "/docs/additional-features/#collection-flow-discovery" | prepend: site.baseurl }}){: .alert-link} for more info.
</div>

# Creating the transaction

Now that we have generated the objects, we'll need to call the endpoint. Note that once the transaction is created the sender will receive a prompt on their phone to pay in the funds

<div class="alert alert-info" markdown="1">
**Note!** For some other collections provider you'll need to tell the customer some extra details, like a reference number, or redirect them to a URL we send back in the response to finish the collection. Please consult the [collection details guide]({{ "/docs/collection-details/" | prepend: site.baseurl }}){: .alert-link} for more info.
</div>

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

<div class="alert alert-info" markdown="1">
**Info!** Please note that as you can usually always expect validation errors calling any of our endpoints, so you should always check for errors when calling our APIs. A transaction which has validation errors is never created, you have to re-create it once the problems with the details have been fixed.
</div>

# Waiting for the transaction to finish

Once the transaction is created, the customer has one hour to fulfill the collection requirements. After this initial period has elapsed the transaction will be cancelled and it will not accept funds received anymore. In order to let you know when the customer has fulfilled the collection and paid in the funds we will send out a notification to your registered webhook address.

To set up webhooks you can use the [TransferZero developer portal](https://developers.transferzero.com). We will always call the endpoint you set up here using `POST`, and the request will always contain the same authentication headers you'll need to use to call our APIs, so you can use them to validate that the request is coming from us.

{% capture data-raw %}
See the [webhooks documentation]({{ "/docs/architecture/" | prepend: site.baseurl }}#webhooks) for more details on what you can expect to receive on the endpoint you register with us.
{% endcapture %}

{% capture data-csharp %}
Once setting up an endpoint where you'll be receiving callbacks you can use the following code snippet to both verify that the webhook we sent out is legitimate, and then parse it's contents regardless of type.

The details you need to provide Is
- the body of the webhook/callback you received as a string
- the url of your webhook, where you are awaiting the callbacks - this has to be the full URL
- the authentication headers you have received on your webhook endpoint - as a dictionary

```csharp
string webhookContent = "{ full body of the webhook }";
string url = "<full url of the webhook>";

Dictionary<string, string> headers = new Dictionary<string, string>();
headers.Add("Authorization-Nonce", "<nonce from the webhook headers>");
headers.Add("Authorization-Signature", "<signature from the webhook headers>");
headers.Add("Authorization-Key", "<key from the webhook headers>");

if (configuration.ValidWebhookRequest(url, webhookContent, headers))
{
    Webhook webhook = configuration.ParseString<Webhook>(webhookContent);
    if (webhook.Event.StartsWith("payin_method")) {
        PayinMethodWebhook payinMethodWebhook = configuration.ParseString<PayinMethodWebhook>(webhookContent);
        string externalId = payinMethodWebhook.Object.ExternalId;
        if (webhook.Event == "payin_method.error"){
            // handle collection attempt has failed.
        }           
    } else if (webhook.Event.StartsWith("transaction")) {
        TransactionWebhook transactionWebhook = configuration.ParseString<TransactionWebhook>(webhookContent);
        Guid transactionId = transactionWebhook.Object.Id;
        string externalId = transactionWebhook.Object.ExternalId;
        if (webhook.Event == "transaction.paid_in") {
            // handle user has sent in the funds event
        } else if (webhook.Event == "transaction.paid_out") {
            // handle transaction has finished processing and the funds are in the internal balance
        } else if (webhook.Event == "transaction.canceled") {
            // handle transaction has not been funded by the customer event
        }
    } else if (webhook.Event.StartsWith("sender")) {
        SenderWebhook senderWebhook = configuration.ParseString<SenderWebhook>(webhookContent);
        // handle sender events
    }
}
```
{% endcapture %}

{% capture data-vb %}
Once setting up an endpoint where you'll be receiving callbacks you can use the following code snippet to both verify that the webhook we sent out is legitimate, and then parse it's contents regardless of type.

The details you need to provide Is
- the body of the webhook/callback you received as a string
- the url of your webhook, where you are awaiting the callbacks - this has to be the full URL
- the authentication headers you have received on your webhook endpoint - as a dictionary

```vb
Dim webhookContent As String = "{ full body of the webhook }"
Dim url As String = "<full url of the webhook>"

Dim headers As Dictionary(Of String, String) = New Dictionary(Of String, String)()
headers.Add("Authorization-Nonce", "<nonce from webhook headers>")
headers.Add("Authorization-Signature", "<signature from webhook headers>")
headers.Add("Authorization-Key", "<key from webhook headers>")

If configuration.ValidWebhookRequest(url, webhookContent, headers) Then
    Dim webhook As Webhook = configuration.ParseString(Of Webhook)(webhookContent)
    If webhook.[Event].StartsWith("payin_method") Then
        Dim payinMethodWebhook As PayinMethodWebhook = configuration.ParseString(Of PayinMethodWebhook)(webhookContent)
        Dim externalId As String = payinMethodWebhook.Object.ExternalId
        If webhook.[Event].Equals("payin_method.error") Then
          ' handle collection attempt has failed.
        End If        
    ElseIf webhook.[Event].StartsWith("transaction") Then
        Dim transactionWebhook As TransactionWebhook = configuration.ParseString(Of TransactionWebhook)(webhookContent)
        Dim transactionId As Guid = transactionWebhook.Object.Id
        Dim externalId As String = transactionWebhook.Object.ExternalId
        If webhook.[Event].Equals("transaction.paid_in") Then
          ' handle user has sent in the funds event
        ElseIf webhook.[Event].Equals("transaction.paid_out") Then
          ' handle transaction has finished processing and the funds are in the internal balance
        ElseIf webhook.[Event].Equals("transaction.canceled") Then
          ' handle transaction has not been funded by the customer event
        End If
    ElseIf webhook.[Event].StartsWith("sender") Then
        Dim senderWebhook As SenderWebhook = configuration.ParseString(Of SenderWebhook)(webhookContent)
        ' handle sender webhooks
    End If
End If
```
{% endcapture %}

{% capture data-java %}
Once setting up an endpoint where you'll be receiving callbacks you can use the following code snippet to both verify that the webhook we sent out is legitimate, and then parse it's contents regardless of type.

The details you need to provide Is
- the body of the webhook/callback you received as a string
- the url of your webhook, where you are awaiting the callbacks - this has to be the full URL
- the authentication headers you have received on your webhook endpoint - as a map

```java
String webhookBody = "{ full body of the webhook }";
String webhookUrl = "<full url of the webhook>";

Map<String, String> webhookHeaders = new HashMap<String, String>();
webhookHeaders.put("Authorization-Nonce", "<nonce from webhook headers>");
webhookHeaders.put("Authorization-Key", "<key from webhook headers>");
webhookHeaders.put("Authorization-Signature", "<signature from webhook headers>");

if (apiClient.validateWebhookRequest(webhookUrl, webhookBody, webhookHeaders)) {
    Webhook webhook = apiClient.parseResponseString(webhookBody, Webhook.class);
    if (webhook.getEvent().startsWith("payin_method")) {
        PayinMethodWebhook payinMethodWebhook = apiClient.parseResponseString(webhookBody, PayinMethodWebhook.class);
        String externalId = payinMethodWebhook.getObject().getExternalId();
        
        if (webhook.getEvent().equals("payin_method.error")  {
          // handle collection attempt has failed.
        }
    } else if (webhook.getEvent().startsWith("transaction")) {
        TransactionWebhook transactionWebhook = apiClient.parseResponseString(webhookBody, TransactionWebhook.class);
        UUID transactionId = transactionWebhook.getObject().getId();
        String externalId = transactionWebhook.getObject().getExternalId();
        if (webhook.getEvent().equals("transaction.paid")) {
          // handle user has sent in the funds event
        } else if (webhook.getEvent().equals("transaction.refunded")) {
          // handle transaction has finished processing and the funds are in the internal balance
        } else if (webhook.getEvent().equals("transaction.refunded")) {
          // handle transaction has not been funded by the customer event
        }
    } else if (webhook.getEvent().startsWith("sender")) {
        SenderWebhook senderWebhook = apiClient.parseResponseString(webhookBody, SenderWebhook.class);
        // handle sender webhooks
    }
}
```
{% endcapture %}

{% capture data-js %}
Once setting up an endpoint where you'll be receiving callbacks you can use the following code snippet to both verify that the webhook we sent out is legitimate, and then parse it's contents regardless of type.

The details you need to provide Is
- the body of the webhook/callback you received as a string
- the url of your webhook, where you are awaiting the callbacks - this has to be the full URL
- the authentication headers you have received on your webhook endpoint - as an object

```js
const webhookContent = `{ full body of the webhook }`;
const webhookUrl = "<full url of the webhook>";

const webhookHeader = {
  "Authorization-Nonce": "<nonce from webhook headers>",
  "Authorization-Key": "<key from webhook headers>",
  "Authorization-Signature": "<signature from webhook headers>"};

if (apiClient.validateRequest(webhookUrl, webhookContent, webhookHeader)) {
  const webhook = apiClient.parseResponseString(webhookContent,TransferZeroSdk.Webhook);
  if (webhook.event.startsWith('payin_method')) {
    const payinMethodWebhook = apiClient.parseResponseString(webhookContent, TransferZeroSdk.payinMethodWebhook);
    const externalId = payinMethodWebhook.object.external_id;

    if (webhook.event == "payin_method.error")  {
      // handle collection attempt has failed.
    }
  } else if (webhook.event.startsWith('transaction')) {
      const transactionWebhook = apiClient.parseResponseString(webhookContent, TransferZeroSdk.TransactionWebhook);
      const transactionId = transactionWebhook.object.id;
      const externalId = transactionWebhook.object.external_id;
      if (webhook.event == 'transaction.paid') {
          // handle user has sent in the funds event
      } else if (webhook.event == 'transaction.refunded') {
          // handle transaction has finished processing and the funds are in the internal balance
      } else if (webhook.event == 'transaction.refunded') {
          // handle transaction has not been funded by the customer event
      }
  } else if (webhook.event.startsWith('sender')) {
      const senderWebhook = apiClient.parseResponseString(webhookContent, TransferZeroSdk.SenderWebhook);
      // handle sender webhook
  }
}
```
{% endcapture %}

{% capture data-php %}
Once setting up an endpoint where you'll be receiving callbacks you can use the following code snippet to both verify that the webhook we sent out is legitimate, and then parse it's contents regardless of type.

The details you need to provide Is
- the body of the webhook/callback you received as a string
- the url of your webhook, where you are awaiting the callbacks - this has to be the full URL
- the authentication headers you have received on your webhook endpoint - as an associative array

```php
$webhook_content = "{ full body of the webhook }";
$webhook_url = "<full url of the webhook>";

$webhook_headers = [
    "Authorization-Nonce" => "<nonce from the webhook headers>",
    "Authorization-Key" => "<key from the webhook headers>",
    "Authorization-Signature" => "<signature from the webhook headers>"];

if (new WebhooksApi()->validateWebhookRequest($webhook_url, $webhook_content, $webhook_headers)) {
    $webhook = new WebhooksApi()->parseResponseString($webhook_content, 'Webhook');
    if (strpos($webhook->getEvent(), 'payin_method') === 0) {
        $payinMethodWebhook = $webhooksApi->parseResponseString($webhook_content, 'PayinMethodWebhook');
        $externalId = $payinMethodWebhook->getObject()->getExternalId();

        if ($webhook->getEvent() == "payin_method.error")  {
          // handle collection attempt has failed.
        }
    } elseif (strpos($webhook->getEvent(), 'transaction') === 0) {
        $transactionWebhook = $webhooksApi->parseResponseString($webhook_content, 'TransactionWebhook');
        $transacionId = $transactionWebhook->getObject()->getId();
        $externalId = $transactionWebhook->getObject()->getExternalId();
        if ($webhook->getEvent() == 'transaction.paid') {
            // handle user has sent in the funds event
        } elseif ($webhook->getEvent() == 'transaction.refunded') {
            // handle transaction has finished processing and the funds are in the internal balance
        } elseif ($webhook->getEvent() == 'transaction.refunded') {
            // handle transaction has not been funded by the customer event
        }
    } elseif (strpos($webhook->getEvent(), 'sender') === 0) {
        $senderWebhook = $webhooksApi->parseResponseString($webhook_content, 'SenderWebhook');
        // handle sender webhook
    }
}
```
{% endcapture %}

{% capture data-ruby %}
Once setting up an endpoint where you'll be receiving callbacks you can use the following code snippet to both verify that the webhook we sent out is legitimate, and then parse it's contents regardless of type.

The details you need to provide Is
- the body of the webhook/callback you received as a string
- the url of your webhook, where you are awaiting the callbacks - this has to be the full URL
- the authentication headers you have received on your webhook endpoint - as a hash

```ruby
body = "{ full body of the webhook }"
webhook_url = "<full url of the webhook>"

headers = {
    "Authorization-Nonce": "<nonce from webhook headers>",
    "Authorization-Key": "<key from webhook headers>",
    "Authorization-Signature": "<signature from webhook headers>"}

if TransferZero::ApiClient.new.validate_webhook_request(webhook_url, body, headers)
  webhook = TransferZero::ApiClient.new.parse_response(body, "Webhook")
  if webhook['event'].start_with?('payin_method')
    payin_method_webhook = webhook_api.parse_response(body, 'PayinMethodWebhook')
    external_id = payin_method_webhook.object.external_id

    if webhook['event'] == "payin_method.error"
      # handle collection attempt has failed.
    end
  elsif webhook['event'].start_with?('transaction')
    transaction_webhook = webhook_api.parse_response(body, 'TransactionWebhook')
    transaction_id = transaction_webhook.object.id
    external_id = transaction_webhook.object.external_id
    if webhook['event'] == 'transaction.paid'
      # handle user has sent in the funds event
    elsif webhook['event'] == 'transaction.paid'
      # handle transaction has finished processing and the funds are in the internal balance
    elsif webhook['event'] == 'transaction.refunded'
      # handle transaction has not been funded by the customer event
    end
  elsif webhook['event'].start_with?('sender')
    sender_webhook = webhook_api.parse_response(body, 'SenderWebhook')
    # handle sender webhook
  end
end
```
{% endcapture %}

{% include language-tabbar.html prefix="webhook" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}

For collections you will need to handle three major webhook events namely `transaction.paid_in`, `transaction.paid_out` and `transaction.canceled`. The first one will notify you if the customer has paid in the funds. The second one will notify you if the funds were then put into your internal balance (which usually happens right after the funds have been received). Finally the last event lets you know that we haven't received the funds in time.

If you don't do full KYC then you should also sign up for the `sender.approved` event which will notify you if a sender is approved and can start transacting, and the `sender.rejected` event which signals if there is a problem with the sender.

<div class="alert alert-warning" markdown="1">
**Warning!** For some collection providers the user can accidentally send different amount that is required from them. In this case you will receive a `transaction.mispaid` event, and the transaction will change to reflect how much was actually received. You should always double check the transaction status to know how much has been actually paid in.
</div>

<div class="alert alert-info" markdown="1">
**Note!** In case the customer has not paid in the funds in the allotted time, you'll need to create a new transaction.
</div>

# Getting the transaction status manually

While we prefer that you primarily use the webhook facility to get notified about state changes, occasionally you might want to query a transaction's state in our system so you'll be able to update it on your end. You can either use the TransferZero Transaction ID for this, or the External Id we set up earlier. In this example we'll use the External ID

{::comment}
CODE_EXAMPLE_START get-transaction-call
JSON_START
GET /v1/transactions?external_id=Transaction:GHS:91475
JSON_END

CODE_START
CREATE_API api TransactionsApi

GET_ENDPOINT_CALL_START TransactionListResponse response api get_transactions
PARAM LIT external_id "Transaction:GHS:91475"
GET_ENDPOINT_CALL_END

LIST_EXTRACT response Transaction transaction
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
GET /v1/transactions?external_id=Transaction:GHS:91475
```
{% endcapture %}

{% capture data-csharp %}
```csharp
TransactionsApi api = new TransactionsApi(configuration);

TransactionListResponse response = api.GetTransactions(externalId: "Transaction:GHS:91475");

if (response.Object.Count > 0) {
  Transaction transaction = response.Object[0];
} else {
  // handle not found scenario
}
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim api as TransactionsApi = New TransactionsApi(configuration)

Dim response as TransactionListResponse = api.GetTransactions(externalId:="Transaction:GHS:91475")

If response.Object.Count > 0 Then
    Dim transaction As Transaction = response.Object(0)
Else
    ' handle not found scenario
End If
```
{% endcapture %}

{% capture data-java %}
```java
TransactionsApi api = new TransactionsApi(apiClient);

TransactionListResponse response = api.getTransactions().externalId("Transaction:GHS:91475").execute();

if (response.getObject().size() > 0) {
  Transaction transaction = response.getObject().get(0);
} else {
  // handle not found scenario
}
```
{% endcapture %}

{% capture data-js %}
```js
const api = new TransferZeroSdk.TransactionsApi(apiClient);

const response = await api.getTransactions({external_id: "Transaction:GHS:91475"});

if (response.object.length > 0) {
  const transaction = response.object[0];
} else {
  // handle not found scenario
}
```
{% endcapture %}

{% capture data-php %}
```php
$api = new TransactionsApi();

$response = api->getTransactions([external_id => "Transaction:GHS:91475"]);

if (count(response->getObject()) > 0) {
  $transaction = response->getObject()[0];
} else {
  // handle not found scenario
}
```
{% endcapture %}

{% capture data-ruby %}
```ruby
api = TransferZero::TransactionsApi.new

response = api.get_transactions({external_id: "Transaction:GHS:91475"})

if !response.object.empty?
  transaction = response.object.first
else
  # handle not found scenario
end
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-get-transaction-call" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

# Schedule the onboarding call

Once you have implemented all of the steps based on the example above you have fulfilled our requirements for a successful integration. Please schedule an onboarding call with us and we'll check your implementation and allow access to our production environment if all is good.
