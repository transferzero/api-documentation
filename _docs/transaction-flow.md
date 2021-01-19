---
title: Transaction flow
permalink: /docs/transaction-flow/
---

* Table of contents
{:toc}

# Introduction

Transactions are the main objects in the TransferZero API, so it's important to understand how to create and manage them. Transactions facilitate money movement from one Sender in a specific currency to one or multiple Recipients in another currency.

The main flow of a successful transaction flow is the following:

* Transaction is created linking the Sender to the Recipient(s) with the requested amounts.
* Once the sender is KYC'd and approved the transaction can be funded.
* Once the transaction is funded, we will initiate the payout to the recipient(s).
* After the recipient (or all recipients) has received the money, the transaction is finished.

Unfortunately not all transactions are successful. The main causes of issues are the following:

* Transactions are cancelled automatically if they are not funded within the first hour of creation.
* The recipient details might be wrong (for example the destination bank account number is invalid), or there are other issues blocking the successful payout. In these cases the transaction has to be cancelled.
* Once the transaction is cancelled, we will refund the money to the sender. Funds from account balances are always refunded automatically to the account balance. Funds from other types of payins might require manual processing however.

## Flow Diagram

![api-flow-diagram]({{ "/img/transaction_flow/api-flow-diagram.png" | prepend: site.baseurl }})

# Creating transactions

Transactions can be created by calling the `POST /v1/transactions` endpoint. The template of transaction requests is the following:

{% capture data-raw %}
```javascript
{
   "transaction":{
      "input_currency": // currency to pay in,
      "sender":{
         // details of the sender
      },
      "recipients":[
         {
            "requested_amount": // the amount to pay out,
            "requested_currency": // the currency of the amount,
            "payout_method":{
               "type": // method of the payout,
               "details":{
                  // details of the recipient
               }
            }
         }
      ],
      "metadata": // optional metadata
      "external_id": // optional parameter for adding a custom ID to transactions
   }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="transaction-structure" raw=data-raw %}

Note that the `external_id` field is optional but we prefer if you use it. Please see [external ID](#external-id) for further information.

A full example transaction creation request with sender creation from `USD` to `NGN` would look like the following:

{::comment}
CODE_EXAMPLE_START transaction-example
JSON_START
{
  "transaction": {
    "sender": {
      "first_name": "Jane",
      "last_name": "Doe",
      "phone_country": "US",
      "phone_number": "5555551234",
      "country": "US",
      "city": "New York",
      "street": "20 W 34th St",
      "postal_code": "10001",
      "address_description": "",
      "birth_date": "1974-12-24",
      "email": "info@transferzero.com",
      "external_id": "Sender:US:234523",
      "documents": [ ],
      "ip": "127.0.0.1",
      "metadata": {}
    },
    "recipients": [
      {
        "requested_amount": "100",
        "requested_currency": "USD",
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
    ],
    "input_currency": "USD",
    "metadata": {},
    "external_id": "Transaction:NGN:17523"
  }
}
JSON_END

CODE_START
CREATE_START sender Sender
SET LIT first_name "Jane"
SET LIT last_name "Doe"
SET LIT phone_country "US"
SET LIT phone_number "5555551234"
SET LIT country "US"
SET LIT city "New York"
SET LIT street "20 W 34th St"
SET LIT postal_code "10001"
SET LIT address_description ""
SET DATE birth_date "1974-12-24"
SET LIT email "info@transferzero.com"
SET LIT external_id "Sender:US:234523"
SET LIT ip "127.0.0.1"
SET EMPTY_ARRAY documents Document
CREATE_END

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
SET VAR payout_method payout
CREATE_END

CREATE_START transaction Transaction
SET VAR sender sender
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
  "transaction": {
    "sender": {
      "first_name": "Jane",
      "last_name": "Doe",
      "phone_country": "US",
      "phone_number": "5555551234",
      "country": "US",
      "city": "New York",
      "street": "20 W 34th St",
      "postal_code": "10001",
      "address_description": "",
      "birth_date": "1974-12-24",
      "email": "info@transferzero.com",
      "external_id": "Sender:US:234523",
      "documents": [ ],
      "ip": "127.0.0.1",
      "metadata": {}
    },
    "recipients": [
      {
        "requested_amount": "100",
        "requested_currency": "USD",
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
    ],
    "input_currency": "USD",
    "metadata": {},
    "external_id": "Transaction:NGN:17523"
  }
}
```
{% endcapture %}

{% capture data-csharp %}
```csharp
Sender sender = new Sender(
  firstName: "Jane",
  lastName: "Doe",
  phoneCountry: "US",
  phoneNumber: "5555551234",
  country: "US",
  city: "New York",
  street: "20 W 34th St",
  postalCode: "10001",
  addressDescription: "",
  birthDate: DateTime.Parse("1974-12-24"),
  email: "info@transferzero.com",
  externalId: "Sender:US:234523",
  ip: "127.0.0.1",
  documents: new List<Document>());

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
  payoutMethod: payout);

Transaction transaction = new Transaction(
  sender: sender,
  recipients: new List<Recipient>() { recipient },
  inputCurrency: "NGN",
  externalId: "Transaction:NGN:17523");
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim sender as Sender = New Sender(
  firstName:="Jane",
  lastName:="Doe",
  phoneCountry:="US",
  phoneNumber:="5555551234",
  country:="US",
  city:="New York",
  street:="20 W 34th St",
  postalCode:="10001",
  addressDescription:="",
  birthDate:=DateTime.Parse("1974-12-24"),
  email:="info@transferzero.com",
  externalId:="Sender:US:234523",
  ip:="127.0.0.1",
  documents:=New List(Of Document)()))

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
  payoutMethod:=payout)

Dim transaction as Transaction = New Transaction(
  sender:=sender,
  recipients:=New List(Of Recipient)() From { recipient },
  inputCurrency:="NGN",
  externalId:="Transaction:NGN:17523")
```
{% endcapture %}

{% capture data-java %}
```java
Sender sender = new Sender();
sender.setFirstName("Jane");
sender.setLastName("Doe");
sender.setPhoneCountry("US");
sender.setPhoneNumber("5555551234");
sender.setCountry("US");
sender.setCity("New York");
sender.setStreet("20 W 34th St");
sender.setPostalCode("10001");
sender.setAddressDescription("");
sender.setBirthDate(LocalDate.parse("1974-12-24"));
sender.setEmail("info@transferzero.com");
sender.setExternalId("Sender:US:234523");
sender.setIp("127.0.0.1");
sender.setDocuments(new ArrayList<>());

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
recipient.setPayoutMethod(payout);

Transaction transaction = new Transaction();
transaction.setSender(sender);
transaction.addRecipientsItem(recipient);
transaction.setInputCurrency("NGN");
transaction.setExternalId("Transaction:NGN:17523");
```
{% endcapture %}

{% capture data-js %}
```js
const sender = new TransferZeroSdk.Sender();
sender.first_name = "Jane";
sender.last_name = "Doe";
sender.phone_country = "US";
sender.phone_number = "5555551234";
sender.country = "US";
sender.city = "New York";
sender.street = "20 W 34th St";
sender.postal_code = "10001";
sender.address_description = "";
sender.birth_date = "1974-12-24";
sender.email = "info@transferzero.com";
sender.external_id = "Sender:US:234523";
sender.ip = "127.0.0.1";
sender.documents = [];

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
recipient.payout_method = payout;

const transaction = new TransferZeroSdk.Transaction();
transaction.sender = sender;
transaction.recipients = [recipient];
transaction.input_currency = "NGN";
transaction.external_id = "Transaction:NGN:17523";
```
{% endcapture %}

{% capture data-php %}
```php
$sender = new Sender();
$sender->setFirstName("Jane");
$sender->setLastName("Doe");
$sender->setPhoneCountry("US");
$sender->setPhoneNumber("5555551234");
$sender->setCountry("US");
$sender->setCity("New York");
$sender->setStreet("20 W 34th St");
$sender->setPostalCode("10001");
$sender->setAddressDescription("");
$sender->setBirthDate("1974-12-24");
$sender->setEmail("info@transferzero.com");
$sender->setExternalId("Sender:US:234523");
$sender->setIp("127.0.0.1");
$sender->setDocuments([]);

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
$recipient->setPayoutMethod($payout);

$transaction = new Transaction();
$transaction->setSender($sender);
$transaction->setRecipients([recipient]);
$transaction->setInputCurrency("NGN");
$transaction->setExternalId("Transaction:NGN:17523");
```
{% endcapture %}

{% capture data-ruby %}
```ruby
sender = TransferZero::Sender.new
sender.first_name = "Jane"
sender.last_name = "Doe"
sender.phone_country = "US"
sender.phone_number = "5555551234"
sender.country = "US"
sender.city = "New York"
sender.street = "20 W 34th St"
sender.postal_code = "10001"
sender.address_description = ""
sender.birth_date = "1974-12-24"
sender.email = "info@transferzero.com"
sender.external_id = "Sender:US:234523"
sender.ip = "127.0.0.1"
sender.documents = []

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
recipient.payout_method = payout

transaction = TransferZero::Transaction.new
transaction.sender = sender
transaction.recipients = [recipient]
transaction.input_currency = "NGN"
transaction.external_id = "Transaction:NGN:17523"
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-transaction-example" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}

## Input currency

The input currency describes what currency the transaction will be paid in. For example if you wish to create an `EUR` to `NGN` transaction then input currency should be set to `EUR`.

## Sender

This section contains the details of the sender. The first time a specific sender is used the full details should be provided, example:

{::comment}
CODE_EXAMPLE_START sender-creation
JSON_START
{
    "first_name": "Jane",
    "last_name": "Doe",

    "phone_country": "US",
    "phone_number": "5555551234",

    "country": "US",
    "city": "New York",
    "street": "20 W 34th St",
    "postal_code": "10001",
    "address_description": "",

    "birth_date": "1974-12-24",

    "identification_number": "AB123456",
    "identification_type": "ID",

    "email": "info@transferzero.com",

    "external_id": "Sender:US:234523",

    "documents": [ ],
    "ip": "127.0.0.1",
    "metadata": {}
}
JSON_END

CODE_START
CREATE_START sender Sender
SET LIT first_name "Jane"
SET LIT last_name "Doe"

SET LIT phone_country "US"
SET LIT phone_number "5555551234"

SET LIT country "US"
SET LIT city "New York"
SET LIT street "20 W 34th St"
SET LIT postal_code "10001"
SET LIT address_description "Empire State Building"

SET DATE birth_date "1974-12-24"

SET LIT identification_number "AB123456"
SET LIT identification_type "ID"

SET LIT email "info@transferzero.com"

SET LIT external_id "Sender:US:234523"

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

    "phone_country": "US",
    "phone_number": "5555551234",

    "country": "US",
    "city": "New York",
    "street": "20 W 34th St",
    "postal_code": "10001",
    "address_description": "",

    "birth_date": "1974-12-24",

    "identification_number": "AB123456",
    "identification_type": "ID",

    "email": "info@transferzero.com",

    "external_id": "Sender:US:234523",

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

  phoneCountry: "US",
  phoneNumber: "5555551234",

  country: "US",
  city: "New York",
  street: "20 W 34th St",
  postalCode: "10001",
  addressDescription: "Empire State Building",

  birthDate: DateTime.Parse("1974-12-24"),

  identificationNumber: "AB123456",
  identificationType: "ID",

  email: "info@transferzero.com",

  externalId: "Sender:US:234523",

  ip: "127.0.0.1",
  documents: new List<Document>());
```
{% endcapture %}

{% capture data-vb %}
```vb
Dim sender as Sender = New Sender(
  firstName:="Jane",
  lastName:="Doe",

  phoneCountry:="US",
  phoneNumber:="5555551234",

  country:="US",
  city:="New York",
  street:="20 W 34th St",
  postalCode:="10001",
  addressDescription:="Empire State Building",

  birthDate:=DateTime.Parse("1974-12-24"),

  identificationNumber:="AB123456",
  identificationType:="ID",

  email:="info@transferzero.com",

  externalId:="Sender:US:234523",

  ip:="127.0.0.1",
  documents:=New List(Of Document)()))
```
{% endcapture %}

{% capture data-java %}
```java
Sender sender = new Sender();
sender.setFirstName("Jane");
sender.setLastName("Doe");

sender.setPhoneCountry("US");
sender.setPhoneNumber("5555551234");

sender.setCountry("US");
sender.setCity("New York");
sender.setStreet("20 W 34th St");
sender.setPostalCode("10001");
sender.setAddressDescription("Empire State Building");

sender.setBirthDate(LocalDate.parse("1974-12-24"));

sender.setIdentificationNumber("AB123456");
sender.setIdentificationType("ID");

sender.setEmail("info@transferzero.com");

sender.setExternalId("Sender:US:234523");

sender.setIp("127.0.0.1");
sender.setDocuments(new ArrayList<>());
```
{% endcapture %}

{% capture data-js %}
```js
const sender = new TransferZeroSdk.Sender();
sender.first_name = "Jane";
sender.last_name = "Doe";

sender.phone_country = "US";
sender.phone_number = "5555551234";

sender.country = "US";
sender.city = "New York";
sender.street = "20 W 34th St";
sender.postal_code = "10001";
sender.address_description = "Empire State Building";

sender.birth_date = "1974-12-24";

sender.identification_number = "AB123456";
sender.identification_type = "ID";

sender.email = "info@transferzero.com";

sender.external_id = "Sender:US:234523";

sender.ip = "127.0.0.1";
sender.documents = [];
```
{% endcapture %}

{% capture data-php %}
```php
$sender = new Sender();
$sender->setFirstName("Jane");
$sender->setLastName("Doe");

$sender->setPhoneCountry("US");
$sender->setPhoneNumber("5555551234");

$sender->setCountry("US");
$sender->setCity("New York");
$sender->setStreet("20 W 34th St");
$sender->setPostalCode("10001");
$sender->setAddressDescription("Empire State Building");

$sender->setBirthDate("1974-12-24");

$sender->setIdentificationNumber("AB123456");
$sender->setIdentificationType("ID");

$sender->setEmail("info@transferzero.com");

$sender->setExternalId("Sender:US:234523");

$sender->setIp("127.0.0.1");
$sender->setDocuments([]);
```
{% endcapture %}

{% capture data-ruby %}
```ruby
sender = TransferZero::Sender.new
sender.first_name = "Jane"
sender.last_name = "Doe"

sender.phone_country = "US"
sender.phone_number = "5555551234"

sender.country = "US"
sender.city = "New York"
sender.street = "20 W 34th St"
sender.postal_code = "10001"
sender.address_description = "Empire State Building"

sender.birth_date = "1974-12-24"

sender.identification_number = "AB123456"
sender.identification_type = "ID"

sender.email = "info@transferzero.com"

sender.external_id = "Sender:US:234523"

sender.ip = "127.0.0.1"
sender.documents = []
```
{% endcapture %}

{% include language-tabbar.html prefix="gen-sender-creation" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}
{::comment}AUTO_GENERATED_CONTENT_END{:/comment}
When a sender is created you will receive a response which contains the sender's status. Possible states for a sender are:

* `initial` - When a sender is created and has not been through any KYC checking (cannot transact)
* `verified` - A sender has passed sanction list checks (cannot transact)
* `approved` - The sender has passed both KYC and sanction checks (**can** transact)
* `banned` - An admin has banned the sender (cannot transact)
* `rejected` - The sender has failed sanction list checks (cannot transact)
* `disabled` - A sender is put into this state as a result of a delete request via the API (cannot transact)

In order to transact with TransferZero we need to have an `approved` sender record. The flow for approving senders depend on whether KYC requirements are waived for your integration or not. In case the KYC requirements are waived then all created senders will be in the `approved` state immediately, and can be immediately used for transactions.

Please see our [KYC](({{ "/docs/kyc/" | prepend: site.baseurl }})) documentation on more details about the KYC sender processes.

### ID and External ID

The `external_id` field is optional, allowing you to add a custom ID for the sender as with the external ID [available for transactions](#external-id). The ID/External ID can be included with the sender in four ways:

* Only an `id` is provided - we will search for the corresponding sender and use this reference.
* An `id` is provided along with additional fields - we will update the corresponding sender with the information contained as parameters if the id exists on our system. Otherwise an error will be returned if the `id` does not exist.
* Only an `external_id` is provided - we will search for the corresponding sender and use this reference.
* An `external_id` is provided along with additional fields - we will create a new sender with this reference. This process is subject to duplicate validation, and an error will be returned with the corresponding sender if a duplicate `external_id` is found to already exist on our system.

An exception to this is if the `external_id` is provided along with additional fields **when a transaction is being created**. In this case, any details sent along with the external ID are used to update the sender.

Please note that sending both an `id` and `external_id` at once is invalid and will result in an error.

If a sender has been assigned an `external_id`, this value can be used to find senders using the `GET /v1/senders` endpoint, with `external_id` parameter included as a string. For example: `GET /v1/senders?external_id=76f69f5e`

### Metadata

The `metadata` field can store any information you wish to store with the sender. If you don't wish to store anything simply specify `{}`.

### Phone number

The sender's phone number is composed of two parts, the `phone_country` (in ISO 2-letter format), and the `phone_number`. The phone number should be specified without the international prefix.

### Documents

The `documents` should contain all documents necessary to KYC the sender. It is either an empty array ``"documents": [ ]`` in case you don't need to send us the sender documents, or it should contain all of the proof of ID documents that are required. See our [KYC](({{ "/docs/kyc/" | prepend: site.baseurl }})) documentation on more details.

### WTR2

We support sender validation based on the simplified WTR2 rules. If WTR2 is enabled, all you need in order to identify a `sender` is to provide one of the set of details defined below:

* There are three different set of details:
  - `identification_number` and `identification_type`
  - `street`, `city` and `postal_code`
  - `birth_date`
* The sender only needs to contain one of the set of details from above.
  E.g.: if the `sender` contains the birth date, then it does not need to contain anything from the first or the second set of the details.

Examples:

* When using **Identification Document**:
  * Identification number: Identification number of document used with a 4-character minimum length.
  * Identification type:
    - `DL`: Driving License
    - `PP`: International Passport
    - `ID`: National ID
    - `OT`: Other
* When using **Address**:
  * Street: Street 17-3
  * City: London
  * Postal Code: NW123ET
* When using **Birthdate**:
  * Birthdate: 1989-01-31

If WTR2 is not enabled, the `sender` will need to be provided with all of the following:

* `phone_number`
* `email`
* `street`, `city`, `postal_code`
* `birth_date`

<div class="alert alert-info" markdown="1">
**Note!** You'll have to contact us if you wish to use the relaxed WTR2 mode, so we can set this up for you. This is only available if you are doing a full KYC on your senders.
</div>

<div class="alert alert-warning" markdown="1">
**Warning!** Due to regulatory requirements the WTR2 mode is not compatible with the `MAD::Cash` corridor. If you wish to use that payment corridor you'll still need to send in full sender details.
</div>

### Re-using senders

If you're not using external IDs on the sender then once a sender is created and is used, the next time you MUST send the ID of the sender. This is so we can match the same sender across multiple transactions for KYC and audit purposes. In this case the sender inside the transaction creation call would look like the following:

{% capture data-raw %}
```javascript
{
  "transaction": {
    "sender": {
      "id": "b6648ba3-1c7b-4f59-8580-684899c84a07"
    },
    // (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="using-sender-id" raw=data-raw %}

Or using external IDs:

{% capture data-raw %}
```javascript
{
  "transaction": {
    "sender": {
      "external_id": "SENDER_1234"
    },
    // (...)
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="using-external-id" raw=data-raw %}

In both cases you can also send in additional sender details which will be used to update the sender if their details have changed in our system.

<div class="alert alert-warning" markdown="1">
**Warning!** For your application to get approved you MUST support either using external IDs for senders, or you'll have to reuse the sender ID for the same sender across transactions. If the sender's details change in your system then you can either use the `PATCH /v1/senders/[transferzer_sender_id]` endpoint to update the sender details you store in our system to keep them up-to-date, or send in the changed sender details the next time you create a transaction with that sender.
</div>

<div class="alert alert-info" markdown="1">
**Note!** Although Senders can also be created separately using the sender creation API call, if you are doing full KYC then in order to decrease the amount of distinct calls to the system we prefer if new senders are created with the first transaction they appear in. If you are not doing a full KYC however then you always need to use the separate sender creation API call, as you need to wait for the sender to get approved before they can transact in the system.
</div>

## Recipient

The recipient describes the amount, the currency and the destination where the money should be sent. Although transactions can support paying out multiple recipients, usually only one should be provided.

The template for the recipient is the following:

{% capture data-raw %}
```javascript
{
  "requested_amount": // the amount to pay out,
  "requested_currency": // the currency of the amount,
  "payout_method":{
      "type": // method of the payout,
      "details":{
        // details of the recipient
      }
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="recipient-structure" raw=data-raw %}

### Payout type

The payout type contains where the money should be sent to and to what currency. You can find a complete list of supported types at the [API reference documentation](https://api.transferzero.com/documentation#transactions).

You can find the commonly used payout types at the [payout documentation]({{ "/docs/payout-details/" | prepend: site.baseurl }}).

Unless you hold an internal balance with us, the input currency and payout currency cannot be the same. If you wish to do same-currency transactions please contact our team for further details.

### Requested amount and currency

This will be the amount that you would wish to pay to the recipient. The value here can be in any particular supported currency, usually either the input or the output one.

In the transaction create response we will return how much this is in the input currency, and will also return how much we would pay out to the recipient in the output currency.

A few common examples:

* Input currency is `EUR` Payout type is `NGN::Bank`. Requested amount is `100 EUR`.

  In this case we will calculate how much `100 EUR` is in `NGN` (as of writing around 44000), and will return: input amount is `100 EUR` and output amount is `44000 NGN`

* Input currency is `USD` Payout type is `NGN::Bank`. Requested amount is `10000 NGN`.

  In this case we will calculate how much `10000 NGN` is in `USD` (as of writing around 25), and will return: input amount is `25 USD` and output amount is `10000 NGN`

* Input currency is `NGN` Payout type is `NGN::Bank`. Requested amount is `10000 NGN`.

  In this case we will simply pay out `10000 NGN` to the recipient. Note that same input and output currencies are only supported if you hold an internal balance with us. If you're interested in that please contact our team.

* Input currency is `USD` Payout type is `NGN::Bank`. Requested amount is `100 EUR`.

  Although the requested currency is neither the input nor the output one, we will calculate how much `100 EUR` is in `USD` and in `NGN` and will return those values in the input and output amounts. We will afterwards do the currency exchange directly, and will not involve the requested currency at all.

The requested amount is rounded to a specific number of decimal places and this depends on the currency. The decimal place information can be obtained from our currencies API endpoint - [/info/currencies/out](http://api.transferzero.com/documentation/#/Currency%20Info/info-currencies-out).

For some currencies however, we are not able to pay out subunits and they will always be rounded up.
These currencies are KES, TZS, UGX and NGN.

The current list of currencies and associated decimal places is below -

* `AED`, `CAD`, `CHF`, `CNY`, `EUR`, `GHS`, `GBP`, `MAD`, `USD`, `ZAR`: 2
* `JPY`, `KES`, `KRW`, `NGN`, `TZS`, `UGX`, `XOF`: 0

### Payout details

The payout details depend on the chosen payout type. Please check the [Payout documentation]({{ "/docs/payout-details/" | prepend: site.baseurl }}) for more details, and you can also find example calls at the [API reference documentation](https://api.transferzero.com/documentation#transactions).

## Metadata

Similarly to the sender, you can store any kind of information to the transaction. If you don't wish to store anything leave the field empty: `{}`

## External ID

External ID is an optional field that allows you to add a custom ID for the transaction, should you wish to link it to a transaction within your own local system. This internal reference value will be displayed in your transaction reports.

If an `external_id` is present when transactions are created, we will validate whether it is a duplicate in our system or not. This functionality provides a safeguard against transactions being assigned the same `external_id`. If a duplicate is found, an error will be returned along with the corresponding transaction.

Once an `external_id` has been set, it can be used to find transactions using the `GET /v1/transactions` endpoint, with `external_id` parameter included as a string. For example: `GET /v1/transactions?external_id=806ec63a`

# Transaction object

Once the transaction is created successfully, you will receive back a transaction object. This object will always contain all details about the sender, the transaction and the recipients.

In case the transaction couldn't be created, you will get back a `422` response and inside the body you should find all of the vaildation messages which should be fixed.

A transaction object looks like the following:

{% capture data-raw %}
```javascript
{
  "object": {
    "id": "5280d11f-0ed3-4a60-ab07-29fdb058e4c4",
    "metadata": {
    },
    "state": "approved",
    "input_amount": 1000.00,
    "input_currency": "GBP",
    "sender": {
      "id": "fdee3b02-81ad-409d-9f34-2b0dd5c39e8f",
      "type": "person",
      "state": "approved",
      "state_reason": null,
      "country": "UG",
      "street": "fake street",
      "postal_code": "fak3 one",
      "city": "London",
      "phone_country": "UG",
      "phone_number": "752403639",
      "email": "example@home.org",
      "ip": "127.0.0.1",
      "external_id": "76f69f5e-912f-43e5-bf3a-9081dbc476f4",
      "first_name": "Peter",
      "last_name": "Smith",
      "birth_date": "1987-08-08",
      "metadata": {
        "my": "data"
      },
      "providers": {
      }
    },
    "payin_methods": [

    ],
    "paid_amount": 0.0,
    "due_amount": 1000.00,
    "recipients": [
      {
        "id": "31288256-ec72-4a0a-bab7-06fb3a6cc8dd",
        "transaction_id": "5280d11f-0ed3-4a60-ab07-29fdb058e4c4",
        "created_at": "2017-08-08T13:19:32.855Z",
        "input_usd_amount": 772.5,
        "state": "initial",
        "transaction_state": "initial",
        "editable": true,
        "may_cancel": true,
        "requested_amount": 750.0,
        "requested_currency": "USD",
        "input_amount": 1000.00,
        "input_currency": "EUR",
        "output_amount": 294750.0,
        "output_currency": "NGN",
        "payout_method": {
          "id": "e7e6ca2e-1b38-4d55-991c-d6933c2f6043",
          "type": "NGN::Bank",
          "details": {
            "first_name": "Johnny",
            "last_name": "English",
            "bank_code": "050",
            "bank_account": "11039382982833",
            "bank_account_type": "20"
          },
          "metadata": {
          },
          "provider": "interswitch",
          "fields": {
            "email": {
              "type": "input",
              "validations": {
                "format": "\\A((\\w+([\\-+.]\\w+)*@[a-zA-Z0-9]+([\\-\\.][a-zA-Z0-9]+)*)*){3,320}\\z"
              }
            },
            "first_name": {
              "type": "input",
              "validations": {
                "presence": true
              }
            },
            "last_name": {
              "type": "input",
              "validations": {
                "presence": true
              }
            },
            "bank_code": {
              "type": "select",
              "options": {
                "063": "Diamond Bank",
                "050": "EcoBank",
                "214": "FCMB Bank",
                "070": "Fidelity Bank",
                "011": "First Bank of Nigeria",
                "058": "Guaranty Trust Bank ",
                "030": "Heritage Bank",
                "301": "Jaiz Bank",
                "082": "Keystone ",
                "014": "Mainstreet ",
                "076": "Polaris Bank",
                "039": "Stanbic IBTC Bank ",
                "232": "Sterling bank",
                "032": "Union Bank",
                "033": "United Bank for Africa ",
                "215": "Unity Bank",
                "035": "Wema Bank",
                "057": "Zenith International "
              },
              "validations": {
                "presence": true,
                "inclusion": {
                  "in": {
                    "063": "Diamond Bank",
                    "050": "EcoBank",
                    "214": "FCMB Bank",
                    "070": "Fidelity Bank",
                    "011": "First Bank of Nigeria",
                    "058": "Guaranty Trust Bank ",
                    "030": "Heritage Bank",
                    "301": "Jaiz Bank",
                    "082": "Keystone ",
                    "014": "Mainstreet ",
                    "076": "Polaris Bank",
                    "039": "Stanbic IBTC Bank ",
                    "232": "Sterling bank",
                    "032": "Union Bank",
                    "033": "United Bank for Africa ",
                    "215": "Unity Bank",
                    "035": "Wema Bank",
                    "057": "Zenith International "
                  }
                }
              }
            },
            "bank_account": {
              "type": "input",
              "validations": {
                "presence": true
              }
            },
            "bank_account_type": {
              "type": "select",
              "options": {
                "20": "Current",
                "10": "Savings"
              },
              "validations": {
                "presence": true,
                "inclusion": {
                  "in": {
                    "20": "Current",
                    "10": "Savings"
                  }
                }
              }
            }
          }
        },
        "metadata": {
        }
      }
    ],
    "created_at": "2017-08-08 13:19:32 UTC",
    "expires_at": "2017-08-08T14:19:32.855Z",
    "external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="transaction-full-example" raw=data-raw %}

As shown, the response contains a lot of information, the most important are the following:

## id

The ID of the transaction

## state

The state of the transaction, which can be one of the following:

* `initial`: Transaction is created, but not yet ready to receive payments (waiting for Sender to be KYC'd and approved).
* `approved`: Transaction is created and the sender is approved. Payment can be received
* `pending`: Transaction has received a payin, and it's waiting for the funds to clear.
* `processing`: Transaction is under compliance review. Please expect feedback in 24 hours or less.
* `received`: Transaction has received the correct payin amount and will start processing the payouts.
* `mispaid`: Transaction received funds, but not the requested amount. The transaction will be resized, and will start payout based on the received funds.
* `manual`: Some of the payments to the recipients have run into issues. Please check the recipient statuses for more information.
* `paid`: Transaction has received correct payins and has performed payouts to all recipients. No further steps required
* `canceled`: The transaction has been cancelled. Transactions are cancelled automatically after one hour if there was no funds received. Once transactions are funded they can be cancelled by the API user unless the recipients have been paid out.
* `refunded`: The transaction has been cancelled after it has been funded, but the funds have been returned now to the sender either partially or fully.
* `exception`: An exception happened during the processing of the transaction. Please contact TransferZero

## state_reason

If there is an error with the transaction you can find the error message in this field.

## input_amount and input_currency

This is the amount that has to be collected from the sender, or funded from the internal balance.

## sender

The full details of the sender. If this is a new sender, please make a note of the `id` field, as that MUST be used in subsequent transaction creation calls that are from the same sender. If an `external_id` is present on the sender, this will also be included. Please see [Sender](#sender) for more details on how `external_id` functions.

## recipients

The following fields are useful on the recipients:

### id

The id of the recipient

### output_amount and output_currency

The amount of money the recipient will receive if the transaction is funded.

### state

The state of the recipient. Can be one of the following:

* `initial`: We haven't initiated the payout yet, you can still cancel the transaction
* `pending`: Payout has been initiated and we're waiting from a response from the provider. The transaction cannot be cancelled
* `success`: Payout is done, and the recipient has been paid.
* `error`: There was an error from the provider, you can find more details in the `state_reason` attribute. We will usually retry the transaction at a later date. You can either wait, edit the recipient or cancel the transaction.
* `refunded`: You asked us to cancel the transaction and we refunded the money.
* `manual`: There were too many errors on this transaction, and we stopped retrying. Please edit the recipient, contact us or cancel the transaction.
* `stuck`: We didn't receive a response from the provider in time, and we don't know whether it has been paid our not. Please contact us for further details.
* `overpaid`: The recipient was paid out more than was requested (not applicable for most of the payout providers)
* `canceled`: The transaction has been cancelled, and we will refund the money soon
* `exception`: Some exception has happened; please contact TransferZero

### state_reason

If there is a specific error for the recipient, you can find a description of the error here.

### editable

Describes whether the recipient can still be edited or not. If it's editable, and the error message describes thet the account number or phone number was invalid, the recipient can be edited to contain the approriate values. Once the recipient is updated we will retry the payouts with the new details.

You can find more details on how to update recipients inside the [API reference documentation](https://api.transferzero.com/documentation#updating-a-recipient).

### may_cancel

Shows whether the payout to the recipient can be cancelled at this state or not.

### payout_method.fields

In case there were validation errors, you can find all of the fields and their valid values for the specified payout method. This can also include the available bank codes as well for bank payout providers.

### external_id

The external ID of a transaction, if present.

# Funding transactions

When using our system to send funds to customers then usually you'll be using your internal account to fund these transactions. Please contact us so we can set up this internal account with us. If this is the case you'll need to explicitly fund transactions once they are created so we know that you are happy with the transaction to go forward.

<div class="alert alert-info" markdown="1">
**Note!** You can also use our system to do the collection from the senders. For more information on how to handle some collections, please visit [Collections]({{ "/docs/additional-features/" | prepend: site.baseurl }}#collections-from-senders){: .alert-link}. You can also check the [API reference documentation](https://api.transferzero.com/documentation#fetching-possible-payin-methods){: .alert-link}
</div>

Funding transactions can be done using the `POST /v1/accounts/debits` endpoint, with the following body:

{% capture data-raw %}
```javascript
{
  "to_id": "5f44026b-7904-4c30-87d6-f8972d790ded",
  "to_type": "Transaction"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="fund-example" raw=data-raw %}

You can also supply the `currency` and `amount` parameters, in which case we'll verify if they match the amount on the transaction and only fund it if they do

{% capture data-raw %}
```javascript
{
  "currency": "NGN",
  "amount": "2000.0",
  "to_id": "5f44026b-7904-4c30-87d6-f8972d790ded",
  "to_type": "Transaction"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="fund-example-full" raw=data-raw %}

To successfully fund a transaction:
* The `to_id` is the `id` of the transaction
* You need to have enough balance of the appropriate currency inside your wallet.

If you choose to include the optional currency and/or amount params:
* The `currency` needs to be the same as the `input_currency` on the transaction.
* The `amount` has to be the same as the `input_amount` on the transaction

Once the transaction is funded, we will immediately start trying to pay out the recipient(s).

## Creating and funding a transaction simultaneously

If you wish to create a transaction and fund it immediately, it is possible to do so by using the `POST /v1/transactions/create_and_fund` endpoint. This functions in the same way as creating a transaction, except that the `external_id` field is required in this case.

In order to use this endpoint, you must first establish an account with us in the input currency of the transactions you wish to create, and ensure that this account is funded appropriately. Also note that by using this endpoint you will miss the two step approval process, as this will be implicitly assumed.

# Checking the state of the transaction

To manually check the state of the transaction, use the `GET /v1/transactions/[TRANSFERZERO_TRANSACTION_ID]` endpoint, where the `TRANSFERZERO_TRANSACTION_ID` is the id of the transaction (and not the external id). Using the external id the transactions can be retrieved `external_id`, [as documented here](#external-id).

However to get real-time information on when a transaction's state changes please create webhooks for transaction state changes using the developer portal, or the API, where we will send a response every time the transaction's state is changed.

<div class="alert alert-warning" markdown="1">
**Warning!** For your application to get approved it MUST use primarily the webhook functionality to determine the state of the transaction. Using the `GET` endpoint should only be done occasionally as a fall-back mechanism.
</div>

# Receiving error messages

Because payouts happen on the recipient level inside our system, any kind of issues with the payouts will appear on the recipient. To get real-time information on issues with payouts, please create webhooks for transaction and recipient state changes using the developer portal, or the API, where we will send a response every time the recipient's state changes to error.

The error message can be found inside the `state_reason` field on the recipient.

Note that as the errors are sent on the recipient, you will receive a recipient object in the webhook and not a full transaction. You can find the transaction id inside the `transaction_id` property of the recipient.

For example, on an error you will receive a webhook like this:

{% capture data-raw %}
```javascript
{
  "webhook": "fd599451-4f3c-4045-91e1-d68ed12ffb75",
  "event": "recipient.error",
  "object": {
    "created_at": "2018-05-28 08:06:13 UTC",
    "editable": true,
    "id": "f0c2f4ea-96cd-4270-b688-48af937fc53e",
    "input_usd_amount": 30.98,
    "may_cancel": true,
    "metadata": {},
    "state": "error",
    "state_reason": "Stolen card. Please contact account holder. This transaction is not possible. Please cancel.",
    "transaction_id": "94581e7a-a35a-430f-be0b-c8269a8acf4c",
    "transaction_state": "received",
    "payout_method": {
      "id": "f2cce765-abb0-4b56-96bb-623cd0f78f9c",
      "type": "NGN::Bank",
      "details": {
        "bank_code": "060",
        "last_name": "Test",
        "first_name": "Bank",
        "bank_account": "123345678",
        "bank_account_type": "20"
      },
      "metadata": {},
      "provider": "interswitch",
    },
    "requested_amount": 10874.0,
    "requested_currency": "NGN",
    "input_amount": 10874.0,
    "input_currency": "NGN",
    "output_amount": 10874.0,
    "output_currency": "NGN",
    "external_id": "806ec63a-a5a7-43cc-9d75-1ee74fbcc026"
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="webhook-example" raw=data-raw %}

<div class="alert alert-warning" markdown="1">
**Warning!** For your application to get approved, it MUST support obtaining the error message from the recipient. It MUST also primarily use the webhook functionality to be notified of any errors, and only fall-back to using `GET` calls against the transaction occasionally.
</div>

You can read more about problems during payments at our [error handling documentation]({{ "/docs/error-handling/" | prepend: site.baseurl }}).

# Cancelling recipients and transactions

In case there are errors with the payout, or you want to revoke the cash pickup reference number for a cash transaction you can initiate a cancellation request. To do that call the `DELETE /v1/recipients/[TRANSFERZERO_RECIPIENT_ID]` endpoint, where `TRANSFERZERO_RECIPIENT_ID` is the id of the recipient (and NOT the transaction). If the recipient can be cancelled, this request, once processed, will cancel it. If the transaction was funded from an internal balance, it will then also be refunded.

<div class="alert alert-info" markdown="1">
**Note!** You can cancel either cash transactions, or transactions where the `may_cancel` field is on the recipient `true`. If `may_cancel` field is `false` you can still try to cancel it, however it will only gets cancelled once we have confirmation from our partner that the payment have failed.
</div>

<div class="alert alert-warning" markdown="1">
**Warning!** For your application to get approved it MUST support the cancellation of recipients.
</div>

<div class="alert alert-warning" markdown="1">
**Warning!** Any transaction that is not cancelled - even ones that seemingly have a fatal error in their description could potentially pay out in the future. If you don't wish a transaction to pay out and you'd like to recover the debited funds you HAVE TO cancel the transaction.
</div>

<div class="alert alert-warning" markdown="1">
**Warning!** Cancellation is an asynchoronous operation. You should wait for the transaction to change state to `refunded` before updating your system.
</div>


Note that `auto_refund` trait is enabled by default on the transaction, this means your transactions will automatically be cancelled and refunded if they can't be paid out. For more information, please check the [auto cancellation]({{ "/docs/additional-features/" | prepend: site.baseurl }}#auto-cancellation-and-refund-of-transactions) documentation.

You can read more about how cancellation works in our [error handling documentation]({{ "/docs/error-handling/" | prepend: site.baseurl }}).
