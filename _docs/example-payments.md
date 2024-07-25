---
title: Payments Example
permalink: /docs/example-payments/
---

* Table of Contents
{:toc}

# Introduction

In this example we'll go through all of the steps and give examples on what you'll need to do to implement a call to pay out funds to customers. Once you've read through this guide you'll know everything that is required by us for you to use our payout system.

First make sure you collect the recipient details on your end. You will need to know the names and bank details of your recipients. Once you have the details collected on your end, you can then initiate the transaction in our system. This example will guide you through the details you need to set and what calls you need to make. Since the easiest way to access our system is through our SDKs this guide is mainly aimed at users of our SDKs.

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

# Recipient details

Let's set up the recipient details first. You will need to do this for every recipient you wish to send funds to. In this example we're going to do an `NGN::Bank` payout, which requires a name and the bank account details. You'll also need to send in how much you wish to send. In this example we're sending 10000 NGN worth of funds.

{::comment}
CODE_EXAMPLE_START recipient-creation
JSON_START
{
    "requested_amount": "10000",
    "requested_currency": "NGN",
    "type": "person",
    "payout_method": {
        "type": "NGN::Bank",
        "details": {
            "first_name": "John",
            "last_name": "Doe",
            "bank_account": "1234567890",
            "bank_code": "082",
            "bank_account_type": "20"
        }
    }
}
JSON_END

CODE_START
CREATE_START details PayoutMethodDetails
SET LIT first_name "John"
SET LIT last_name "Doe"
SET LIT bank_account "1234567890"
SET LIT bank_code "082"
SET ENUM bank_account_type PayoutMethodBankAccountTypeEnum 20
CREATE_END

CREATE_START payout PayoutMethod
SET LIT type "NGN::Bank"
SET VAR details details
CREATE_END

CREATE_START recipient Recipient
SET BIGNUM requested_amount 100000
SET LIT requested_currency "NGN"
SET LIT type "person"
SET VAR payout_method payout
CREATE_END
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
{
    "requested_amount": "10000",
    "requested_currency": "NGN",
    "type": "person",
    "payout_method": {
        "type": "NGN::Bank",
        "details": {
            "first_name": "John",
            "last_name": "Doe",
            "bank_account": "1234567890",
            "bank_code": "082",
            "bank_account_type": "20"
        }
    }
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
PayoutMethodDetails details = new PayoutMethodDetails(
  firstName: "John",
  lastName: "Doe",
  bankAccount: "1234567890",
  bankCode: "082",
  bankAccountType: PayoutMethodBankAccountTypeEnum._20);

PayoutMethod payout = new PayoutMethod(
  type: "NGN::Bank",
  details: details);

Recipient recipient = new Recipient(
  requestedAmount: 100000,
  requestedCurrency: "NGN",
  type: "person",
  payoutMethod: payout);
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim details as PayoutMethodDetails = New PayoutMethodDetails(
  firstName:="John",
  lastName:="Doe",
  bankAccount:="1234567890",
  bankCode:="082",
  bankAccountType:=PayoutMethodBankAccountTypeEnum._20)

Dim payout as PayoutMethod = New PayoutMethod(
  type:="NGN::Bank",
  details:=details)

Dim recipient as Recipient = New Recipient(
  requestedAmount:=100000,
  requestedCurrency:="NGN",
  type:="person",
  payoutMethod:=payout)
```
{% endcapture %}

{% capture data-java %}
```java
PayoutMethodDetails details = new PayoutMethodDetails();
details.setFirstName("John");
details.setLastName("Doe");
details.setBankAccount("1234567890");
details.setBankCode("082");
details.setBankAccountType(PayoutMethodBankAccountTypeEnum._20);

PayoutMethod payout = new PayoutMethod();
payout.setType("NGN::Bank");
payout.setDetails(details);

Recipient recipient = new Recipient();
recipient.setRequestedAmount(new BigDecimal("100000"));
recipient.setRequestedCurrency("NGN");
recipient.setType("person");
recipient.setPayoutMethod(payout);
```
{% endcapture %}

{% capture data-js %}
```js
const details = new TransferZeroSdk.PayoutMethodDetails();
details.first_name = "John";
details.last_name = "Doe";
details.bank_account = "1234567890";
details.bank_code = "082";
details.bank_account_type = "20";

const payout = new TransferZeroSdk.PayoutMethod();
payout.type = "NGN::Bank";
payout.details = details;

const recipient = new TransferZeroSdk.Recipient();
recipient.requested_amount = 100000;
recipient.requested_currency = "NGN";
recipient.type = "person";
recipient.payout_method = payout;
```
{% endcapture %}

{% capture data-php %}
```php
$details = new PayoutMethodDetails();
$details->setFirstName("John");
$details->setLastName("Doe");
$details->setBankAccount("1234567890");
$details->setBankCode("082");
$details->setBankAccountType("20");

$payout = new PayoutMethod();
$payout->setType("NGN::Bank");
$payout->setDetails($details);

$recipient = new Recipient();
$recipient->setRequestedAmount(100000);
$recipient->setRequestedCurrency("NGN");
$recipient->setType("person");
$recipient->setPayoutMethod($payout);
```
{% endcapture %}

{% capture data-ruby %}
```ruby
details = TransferZero::PayoutMethodDetails.new
details.first_name = "John"
details.last_name = "Doe"
details.bank_account = "1234567890"
details.bank_code = "082"
details.bank_account_type = "20"

payout = TransferZero::PayoutMethod.new
payout.type = "NGN::Bank"
payout.details = details

recipient = TransferZero::Recipient.new
recipient.requested_amount = 100000
recipient.requested_currency = "NGN"
recipient.type = "person"
recipient.payout_method = payout
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-recipient-creation" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

Make sure you create the recipient object above for every recipient you wish to pay out.

# Tying all together

Finally we need to batch the created recipients together into a transaction. The are only two extra details required: the external ID of this transaction (how you refer to this transaction in your system), and the currency this transaction will be funded (the currency you held your balance with us).

<div class="alert alert-info" markdown="1">
**Note!** While the external ID is generally optional, sending it can help tie transactions between our systems easier. Also you can use it to block duplicate transactions as we won't allow you to send in another transaction with the same external ID in the future.
</div>

{::comment}
CODE_EXAMPLE_START transaction-creation
JSON_START
{
    "recipients": [{
        // recipient details from the previous section
    }],
    "input_currency": "NGN",
    "external_id": "Transaction:NGN:17523",
    "metadata": {}
}
JSON_END

CODE_START
CREATE_START transaction Transaction
SET VAR_ARRAY recipients Recipient recipient
SET LIT input_currency "NGN"
SET LIT external_id "Transaction:NGN:17523"
CREATE_END
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
{
    "recipients": [{
        // recipient details from the previous section
    }],
    "input_currency": "NGN",
    "external_id": "Transaction:NGN:17523",
    "metadata": {}
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
Transaction transaction = new Transaction(
  recipients: new List<Recipient>() { recipient },
  inputCurrency: "NGN",
  externalId: "Transaction:NGN:17523");
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim transaction as Transaction = New Transaction(
  recipients:=New List(Of Recipient)() From { recipient },
  inputCurrency:="NGN",
  externalId:="Transaction:NGN:17523")
```
{% endcapture %}

{% capture data-java %}
```java
Transaction transaction = new Transaction();
transaction.addRecipientsItem(recipient);
transaction.setInputCurrency("NGN");
transaction.setExternalId("Transaction:NGN:17523");
```
{% endcapture %}

{% capture data-js %}
```js
const transaction = new TransferZeroSdk.Transaction();
transaction.recipients = [recipient];
transaction.input_currency = "NGN";
transaction.external_id = "Transaction:NGN:17523";
```
{% endcapture %}

{% capture data-php %}
```php
$transaction = new Transaction();
$transaction->setRecipients([recipient]);
$transaction->setInputCurrency("NGN");
$transaction->setExternalId("Transaction:NGN:17523");
```
{% endcapture %}

{% capture data-ruby %}
```ruby
transaction = TransferZero::Transaction.new
transaction.recipients = [recipient]
transaction.input_currency = "NGN"
transaction.external_id = "Transaction:NGN:17523"
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-transaction-creation" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}
# Creating and funding the transaction

Now that we have generated the objects, we'll need to call the endpoint. The easiest way is to use our `create_and_fund` endpoint which will both create the transaction and immediately deduct funds from your internal wallet to fund it.

{::comment}
CODE_EXAMPLE_START transaction-call
JSON_START
POST /v1/transactions/create_and_fund

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

POST_ENDPOINT_CALL TransactionResponse response api create_and_fund_transaction request
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
POST /v1/transactions/create_and_fund

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
  TransactionResponse response = api.CreateAndFundTransaction(request);
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
  Dim response as TransactionResponse = api.CreateAndFundTransaction(request)
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
  TransactionResponse response = api.createAndFundTransaction(request);
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
  const response = await api.createAndFundTransaction(request);
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
  $response = api->createAndFundTransaction($request);
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
  response = api.create_and_fund_transaction(request)
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

Once the transaction is created and funded it goes into our processing queue. During this processing we will constantly try to pay out the funds. In order to let you know when the transaction has finished paying out we will send out a notification to your registered webhook address, to let you know that the transaction has finished processing.

To set up webhooks you can use the [TransferZero developer portal](https://developers.transferzero.com). We will always call the endpoint you set up here using `POST`, and the request will always contain the same authentication headers you'll need to use to call our APIs, so you can use them to validate that the request is coming from us.

You will need to handle three major webhook events namely `recipient.paid_out`, `recipient.refunded` and `recipient.error`. The first one will notify you if the payment was successfully paid out to one of the recipients. The second one will notify you if a payment was cancelled and the funds have been returned to your balance. Finally the last one will notify you if there was a problem while trying to pay out any of the recipient.

If the transaction was paid there is nothing more to do from our end, you can update the system on your end to let your customer know that the transaction has paid out. On cancellation you'll need to update your system to know that this transaction will not process further.

If there was an error you can find the error description in the `state_reason` field of the recipient. Note that this error is usually technical in nature hence we don't suggest to showing this to your customer verbatim. It can be shown to your customer support staff however.

<div class="alert alert-warning" markdown="1">
**Warning!** Due to how the markets we operate in work we will constantly retry to pay out transactions, so even after you receive a `recipient.error` error webhook we will still keep trying, until it has either paid out successfully (and you receive a `recipient.paid_out` event), or you explicitly cancel the transaction by calling the cancel recipient endpoint. We will also cancel transactions we could not pay out within the first 24 hours, in which case you'll receive a `transaction.refunded` webhook once the cancellation is processed, but you can opt out of this feature if you'd like to manage cancellation yourself.
</div>

# Getting the transaction status manually

While we prefer that you primarily use the webhook facility to get notified about state changes, occasionally you might want to query a transaction's state in our system so you'll be able to update it on your end. You can either use the TransferZero Transaction ID for this, or the External Id we set up earlier. In this example we'll use the External ID

{::comment}
CODE_EXAMPLE_START get-transaction-call
JSON_START
GET /v1/transactions?external_id=Transaction:NGN:17523
JSON_END

CODE_START
CREATE_API api TransactionsApi

GET_ENDPOINT_CALL_START TransactionListResponse response api get_transactions
PARAM LIT external_id "Transaction:NGN:17523"
GET_ENDPOINT_CALL_END

LIST_EXTRACT response Transaction transaction
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
GET /v1/transactions?external_id=Transaction:NGN:17523
```
{% endcapture %}

{% capture data-csharp %}
```csharp
TransactionsApi api = new TransactionsApi(configuration);

TransactionListResponse response = api.GetTransactions(externalId: "Transaction:NGN:17523");

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

Dim response as TransactionListResponse = api.GetTransactions(externalId:="Transaction:NGN:17523")

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

TransactionListResponse response = api.getTransactions().externalId("Transaction:NGN:17523").execute();

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

const response = await api.getTransactions({external_id: "Transaction:NGN:17523"});

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

$response = api->getTransactions([external_id => "Transaction:NGN:17523"]);

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

response = api.get_transactions({external_id: "Transaction:NGN:17523"})

if !response.object.empty?
  transaction = response.object.first
else
  # handle not found scenario
end
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-get-transaction-call" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

# Cancelling transactions

Finally as mentioned above sometimes payment processing can fail for various reasons. While we try as hard as possible to pay out the funds to any of the intended recipient, occasionally you wish to stop this process and get a refund.

<div class="alert alert-warning" markdown="1">
**Warning!** Unless the auto cancel feature is enabled for you we will never cancel funded transactions. You should make sure to only cancel and refund transactions on your end, once you have cancelled transactions inside TransferZero and got the refund confirmation through the webhook. We are constantly retrying transactions that are not cancelled in our system - even if the error message suggest that they are unlikely to pay out in the future (and we've seen that they could indeed pay out days later)
</div>

{::comment}
CODE_EXAMPLE_START delete-recipient
JSON_START
DELETE /v1/recipients/e77f89fa-8371-496c-ae73-e56697fc08d8
JSON_END

CODE_START
CREATE_API api RecipientsApi

OBJ_EXTRACT_FIRST transaction Recipient recipient recipients
OBJ_EXTRACT recipient UUID recipientid id

DELETE_ENDPOINT_CALL api delete_recipient recipientid
CODE_END
CODE_EXAMPLE_END
{:/comment}

{::comment}AUTO_GENERATED_CONTENT_START{:/comment}
{% capture data-raw %}
```javascript
DELETE /v1/recipients/e77f89fa-8371-496c-ae73-e56697fc08d8
```
{% endcapture %}

{% capture data-csharp %}
```csharp
RecipientsApi api = new RecipientsApi(configuration);

Recipient recipient = transaction.Recipients[0];
Guid recipientid = recipient.Id;

try {
  api.DeleteRecipient(recipientid);
} catch (ApiException e) {
  if (e.IsValidationError)
    // Process validation error
  }
  throw e;
}
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim api as RecipientsApi = New RecipientsApi(configuration)

Dim recipient as Recipient = transaction.Recipients[0]
Dim recipientid as Guid = recipient.Id

Try
  api.DeleteRecipient(recipientid)
Catch e As ApiException
  If e.IsValidationError Then
    ' Process validation error
  End If
  Throw e
End Try
```
{% endcapture %}

{% capture data-java %}
```java
RecipientsApi api = new RecipientsApi(apiClient);

Recipient recipient = transaction.getRecipients().get(0);
UUID recipientid = recipient.getId();

try {
  api.deleteRecipient(recipientid);
} catch (ApiException e) {
  if (e.isValidationError()) {
    // Process validation error
  }
  throw e;
};
```
{% endcapture %}

{% capture data-js %}
```js
const api = new TransferZeroSdk.RecipientsApi(apiClient);

const recipient = transaction.recipients[0];
const recipientid = recipient.id;

try {
  await api.deleteRecipient(recipientid);
} catch (e) {
  if (e.isValidationError) {
    // Process validation error
  }
  throw e;
}
```
{% endcapture %}

{% capture data-php %}
```php
$api = new RecipientsApi();

$recipient = transaction->getRecipients[0];
$recipientid = recipient->getId;

try {
  api->deleteRecipient($recipientid);
} catch (ApiException $e) {
  if ($e->isValidationError()) {
    // Process validation error
  }
  throw $e;
}
```
{% endcapture %}

{% capture data-ruby %}
```ruby
api = TransferZero::RecipientsApi.new

recipient = transaction.recipients.first
recipientid = recipient.id

begin
  api.delete_recipient(recipientid)
rescue TransferZero::ApiError => e
  if e.validation_error
    # Process validation error
  end
  raise e
end
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-delete-recipient" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

<div class="alert alert-info" markdown="1">
**Note!** Even if you have the auto cancellation feature enabled we still require you to be able to cancel transactions in our system, so you won't need to wait for the 24 hours to elapse in case you wish to stop processing - for example if you know that the recipient details are incorrect
</div>

# Schedule the onboarding call

Once you have implemented all of the steps based on the example above you have fulfilled our requirements for a successful integration. Please schedule an onboarding call with us and we'll check your implementation and allow access to our production environment if all is good.
