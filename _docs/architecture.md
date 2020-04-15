---
title: Architecture
permalink: /docs/architecture/
---

* Table of contents
{:toc}

# Authentication

Every API call needs to be authenticated. See the [authentication documentation]({{ "/docs/authentication/" | prepend: site.baseurl }}) for more details on the authentication process.

# Status codes

Generally in our API there are two types of status codes used:

* A `200` or `201` status code means that the request was accepted, and there were no issues with it.
* A `422` status code is used whenever there was a validation error with the request. In case of validation errors, they are returned in the `errors` field, other errors are usually present in the `meta` field in the response.

# Webhooks

A *webhook* is a callback which enables our API to notify your system of new events concerning your transactions. Whenever objects in the TransferZero API change state, we can optionally send the changed details to a pre-registered webhook address. Webhooks can be created either using the [developer portal](https://developers.transferzero.com), or using the [TransferZero API](https://api.transferzero.com/documentation#webhooks).

Whenever possible we prefer using webhooks to listen on events (for example when a transaction has been paid out) instead of polling the status, and we expect implementations fully utilising webhooks.

Webhooks will always generate a `POST` request to the specified endpoint, and will also include the same authentication headers as described in the [authentication documentation]({{ "/docs/authentication/" | prepend: site.baseurl }}), so their validity can be verified on the receiver end.

Please ensure that you have whitelisted the following IP addresses. The following is for each of our environments:

* `52.50.88.9` - Production
* `52.30.76.100` - Sandbox

In case of a transmission error we will also try to send the webhook again five times before dropping the request. You'll need to reply to the endpoint call with a successful status code (e.g. `200` or `201`), otherwise we'll assume that the webhook was not delivered.

The structure of the body we send will always follow the following template:

{% capture data-raw %}
```javascript
{
  "webhook": // the ID of the webhook
  "event": // the specific event
           // that was triggered
  "object": {
    // the full details of
    // the object on which
    // the event happened
  }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="webhook-structure" raw=data-raw %}

There are examples showing how to parse a received webhook message using our SDKs:

- [Java 7 webhook example](https://github.com/transferzero/transferzero-sdk-java7/blob/master/example/src/main/java/com/transferzero/test/Application.java#L193)
- [Java 8 webhook example](https://github.com/transferzero/transferzero-sdk-java8/blob/master/example/src/main/java/com/transferzero/test/Application.java#L193)
- [Ruby webhook example](https://github.com/transferzero/transferzero-sdk-ruby/blob/master/example/client.rb#L237)
- [Javascript webhook example](https://github.com/transferzero/transferzero-sdk-javascript/blob/master/examples/examples.js#L219)
- [PHP webhook example](https://github.com/transferzero/transferzero-sdk-php/blob/master/examples/client.php#L310)
- .NET webhook examples:
    - [C# webhook example](https://github.com/transferzero/transferzero-sdk-dotnet/blob/master/examples/TransferZero.Example.CS/Program.cs#L204)
    - [VB.NET webhook example](https://github.com/transferzero/transferzero-sdk-dotnet/blob/master/examples/TransferZero.Example.VB/Example.vb#L164)

The following are examples of some possible webhook flows and events. Please note this is not an exhaustive list however covers the majority of cases:

## Transaction success

![transaction-success]({{ "/img/uml/webhook-success.png" | prepend: site.baseurl }})

## Transaction canceled

![transaction-canceled]({{ "/img/uml/webhook-canceled.png" | prepend: site.baseurl }})

## Transaction refunded

![transaction-refund-simple]({{ "/img/uml/webhook-refund-simple.png" | prepend: site.baseurl }})

You can obtain an up-to-date list of available webhook events using the [Webhook Events endpoint](https://api.transferzero.com/documentation/#/Webhooks/get-webhook-events) of our API.

# Metadata

Most models in the TransferZero API allow storing any metadata, which will be returned when querying the object, including callouts from webhooks. This facility can be used to store any data on the models.

# External ID

An external ID can be included when Transactions are created, which are typically used for linking transactions to the models inside the API user's system. If the specified external ID already exists in our system the transaction will fail to validate, and the corresponding duplicate transaction will be returned along with an error.

For more information on External IDs, see the [Transaction flow documentation]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#external-id)

# Senders

The senders model stores information about who sends the money for the transaction. Only senders that are KYC'd are allowed to pay in money.

If your site already does KYC on the senders, then let us know as we might waive the requirement to send us sender documents to ease the usage of our API. Otherwise you will have to send us documents for each sender which we will validate. Please also check our [KYC documentation](({{ "/docs/kyc/" | prepend: site.baseurl }})) for more info.

As with transactions, external IDs can also be included for senders when a transaction is created. If this ID already exists in our system, any details sent along with the external ID are used to update the sender.

You can read more on creating senders in the [Transaction flow documentation]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}).

# Recipients

The recipient model stores information about who receives money from a transaction, and whether the money has already been paid out or not. Any issues during the payout process are also stored against the recipient, therefore when checking for transaction issues one has to also subscribe for events on the recipients.

You can read more on recipients and how they work during transactions in the [Transaction flow documentation]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}).

# Transactions

The main model of the TransferZero API is the Transaction, which store the flow for sending money from one Sender in a specific currency, to one or multiple Recipients in another currency. You can read more on transactions in the [Transaction flow documentation]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}).

# Balances

By default when creating a transaction we will do both the collection of the money from the senders, and the payout to the recipients. If your site already does collection on the sender's behalf then please contact us, and we can set up an internal account with us.

Once we approve your request and set up your balance, you can use that balance to fund the payin part of the transaction. You can read more on funding transactions from your internal balance in the [Transaction flow documentation]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}).

If you have a balance with us you can use the `GET /v1/accounts` to get all or `GET /v1/accounts/[CURRENCY_NAME]` endpoint to obtain a specific currency's balance with us.

Please contact us to obtain our list of supported currency pairs for transactions.
