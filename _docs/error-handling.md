---
title: Error handling
permalink: /docs/error-handling/
---

* Table of contents
{:toc}

# Errors during payments

In an ideal world payments always succeed and arrive in the recipient's account. However occasionally there are issues that only occur after the transaction has been funded. There could be various issues, for example:

* Recipient details are incorrect
* Recipient is not registered for the mobile provider's wallet
* Recipient's account is locked and doesn't accept funds
* Recipient's bank is having connectivity issues
* Recipient didn't pick up the funds in time

Whenever we face a problem during payment we will add a note to the recipient's `state_reason` field [as shown here]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#receiving-error-messages). This note contains a human readable error message that can help you debug the issue. Note that this note should never be shown to your customers as they could be technical in nature. They can be shown in your internal system for your customer service team to see however.

Once we find a problem we don't stop processing however. Due to how most of our corridors work we know that a lot of the errors are only temporary. Even errors that look fatal - for example one that says that the recipient doesn't exist - could just be a temporary issue with the bank or provider. Hence every time we receive an error we don't stop, but try again until either:

* We manage to pay out the funds
* You cancel the transaction
* You have auto-cancellation enabled and 24 hours have elapsed since the transaction was funded

<div class="alert alert-warning" markdown="1">
**Warning!** Any transaction that is not cancelled in our system - even ones that seemingly have a fatal error in their description could potentially pay out in the future. If you don't wish a transaction to pay out and you'd like to recover the debited funds you HAVE TO cancel the transaction, and then make sure it got cancelled before updating your system.
</div>

For more info on cancellations please read our [how to cancel recipients and transactions guide]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#cancelling-recipients-and-transactions).

Instead of cancelling a transaction you can sometimes also fix the problem by updating the details on the recipient, for example if the details they have entered is incorrect and you need to change it. Please see our [editing a recipient guide]({{ "/docs/additional-features/" | prepend: site.baseurl }}#editing-recipients).

# Error types

We categorize most errors into the following categories:

* `retriable`: errors where the problem is usually temporary. This includes connectivity issues with banks and providers, and problems with the central banking switch of the country. We constantly retry these transactions and they usually pay out within 24 hours. For these errors the `retriable` flag on the recipient will be set to `true`.
* `editable`: errors where the problem is usually permanent. This includes issues like the recipient details being incorrect, or the recipient's account is locked. As occasionally we get invalid reports from our providers we sometimes retry these transactions as well, however it is usually unlikely that these transactions pay out in the future, and should either be cancelled, or the recipient's details should be changed. For these errors the `retriable` flag on the recipient will be set to `false`, however the `editable` flag will be `true`.
* `pending`: this is not an error, but means that the transaction has not yet been fully processed. Please see the next section for more details.
* `exception`: errors where there was an unknown error during processing. These transactions will be investigated by the technical team, and will either be retried or need to be cancelled.

# Pending transactions

Occasionally a transaction has neither errored, nor has paid out. We call these transactions pending. There are two main cases for pending transactions:

* For any kind of cash pickup transactions, pending means that the recipient has received a pickup notice, but didn't pick up the funds yet. These transactions can be cancelled, in which case the pickup notice will be invalidated and the recipient will not be able to use it to pick up the funds anymore.
* For other transactions pending means that the recipient's bank or mobile provider is still processing the transaction and will note at a later date whether it could deposit the funds or not. These transactions will have a `may_cancel` field set to `false`. If you try to cancel them using the `DELETE /v1/recipients/[TRANSFERZERO_RECIPIENT_ID]` endpoint they get cancelled right after we get confirmation from our bank or mobile provider that the funds could not be debited. However if the confirmation we receive says that the funds are sent out these transactions will not be cancelled, they will be marked as successful.

<div class="alert alert-info" markdown="1">
**Note!** Occasionally a transaction can end up in a "pending loop", where once we get confirmation that the transaction has failed we immediately retry the payment - potentially making it pending again. To cancel these transactions you can either use the auto-cancellation feature (which is enabled by default), or ask our CS team to help cancel them.
</div>
