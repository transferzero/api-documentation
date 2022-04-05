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

Whenever we face a problem during payment we will add a note to the recipient's `state_reason` and `state_reason_details` fields [as shown here]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#receiving-error-messages). These notes contain human readable error informations that can help you debug the issue. Note that both should never be shown to your customers as they could be technical in nature. They can be shown in your internal system for your customer service team to see however.

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

* `temporary_error`: errors where the problem is usually temporary. This includes connectivity issues with banks and providers, and problems with the central banking switch of the country. We constantly retry these transactions and they usually pay out within 24 hours. For these errors the `retriable` flag on the recipient will be set to `true`.
* `recipient_error`: errors where the problem is usually permanent. This includes issues like the recipient details being incorrect, or the recipient's account is locked. As occasionally we get invalid reports from our providers we sometimes retry these transactions as well, however it is usually unlikely that these transactions pay out in the future, and should either be cancelled, or the recipient's details should be changed. For these errors the `retriable` flag on the recipient will be set to `false`, however the `editable` flag will be `true`.
* `sender_error`: these are issues where either the sender or the transaction details provided mean that the transaction cannot be paid out - even if the recipient details are changed. In this case both the `retriable` and the `editable` flag will be set to false.
* `pending`: this is not an error, but means that the transaction has not yet been fully processed. Please see the next section for more details.
* `exception` / `manual_reconciliation_required`: errors where there was an unknown error during processing. These transactions will be investigated by the technical team, and will either be retried or need to be cancelled.

# Error codes

| Error Code | Tier 1 | Tier 2 | Tier 3 | Description | Category |
|-|-|-|-|-|-|
| 0 | Success | Success | Success | The transaction was successfully completed. | paid |
| 1 | Pending | Pending | Pending | This transaction is awaiting a status update from the provider. | pending |
| 11 | /// | Unknown | Unknown | This transaction is awaiting a status update from the provider. | pending |
| 12 | /// | Timeout error | Timeout error | This transaction is awaiting a status update from the provider. | timeout_error |
| 13 | /// | Manual reconciliation required | Manual reconciliation required | This transaction requires manual verification. Please wait until this is done. | manual_reconciliation_required |
| 14 | /// | Pending | Pending | This transaction is awaiting a status update from the provider. | pending |
| 2 | User action required | User action required | User action required | This transaction requires an action by the user. | recipent_action_required |
| 21 | /// | Pickupable | Pickupable | This transaction is awaiting pickup by the recipient. | recipent_action_required |
| 22 | /// | Mandate signing required | Mandate signing required  | This transaction required the user to sign a mandate before it can be deposited. | recipent_action_required |
| 3 | Temporary error | Provider Error | Undefined provider error | The payment provider is not accepting transactions at the moment. We will retry the transaction at a later date. You can also edit or cancel this transaction. | temporary_error |
| 31 | /// | Switch Error | Undefined switch error | The central switch is not accepting transfers at the moment. We will retry the transaction. You can also edit or cancel this transaction. | temporary_error |
| 311 | /// | /// | Issuer/Switch inoperative | The central switch is not accepting transfers at the moment. We will retry the transaction. You can also edit or cancel this transaction. | temporary_error |
| 32 | /// | User bank Error | Undefined bank error | The user's bank is not accepting transfers at the moment. We will retry the transaction. You can also cancel or edit the transaction | temporary_error |
| 321 | /// | /// | Beneficiary bank not available | The user's bank is not accepting transfers at the moment. We will retry the transaction. You can also cancel or edit the transaction. | temporary_error |
| 33 | /// | Not Found | Transaction code already exists | There was an issue while creating the transaction. We will retry the payment. You can also edit or cancel this transaction. | temporary_error |
| 331 | /// | /// | Transaction does not exist | There was an issue while creating the transaction. We will retry the payment. You can also edit or cancel this transaction. | temporary_error |
| 4 | User Error | User error | Unspecified user error | User details are invalid. Please update the details. You can also cancel this transaction. | recipient_error |
| 41 | /// | Invalid user details | Invalid user details | User details are invalid. Please update the details. You can also cancel this transaction. | recipient_error |
| 411 | /// | /// | Invalid card number | Card details are invalid. Please update the card details. You can also cancel this transaction. | recipient_error |
| 412 | /// | /// | Invalid mobile number | Mobile details are invalid. Please update the mobile details. You can also cancel this transaction. | recipient_error |
| 413 | /// | /// | Mobile number not registered for network | Mobile number is not registered on the network. Please update the mobile details. You can also cancel this transaction. | recipient_error |
| 414 | /// | /// | Mobile number not registered for mobile money | Mobile number is not registered for mobile money. Please update the mobile details. You can also cancel this transaction. | recipient_error |
| 42 | /// | Exceeded limits | Exceeded limits | Transfer limits have been exceeded. Please update the details. You can also cancel this transaction. | recipient_error |
| 421 | /// | /// | Exceeded daily transfer limits | Daily transfer limits have been exceeded. Please update the details. You can also cancel this transaction. | recipient_error |
| 422 | /// | /// | Bank approval required for transfer | Bank approval needed for transaction. Please update the details. You can also cancel this transaction. | recipient_error |
| 43 | /// | User action required | User not allowed to receive funds | User not allowed to receive funds. Please update the details. You can also cancel this transaction. | recipient_error |
| 431 | /// | /// | User account is dormant | User account is dormant. Please update the details. You can also cancel this transaction. | recipient_error |
| 432 | /// | /// | User account has invalid status | User account has invalid status. Please update the details. You can also cancel this transaction. | recipient_error |
| 433 | /// | /// | User did not take action within the required time window. You can cancel this transaction. | recipient_error |
| 44 | /// | Validation error | Name validation failed | Name has failed validation against the account holder name. Please update the details. You can also cancel this transaction. | recipient_error |
| 45 | /// | Validation error | Invalid amount | Invalid amount sent for this transaction. | recipient_error |
| 5 | Sender / Regulatory Error | Transaction error | Unspecified transaction error | Transaction cannot be processed. Please cancel this transaction. | sender_error |
| 51 | /// | AML suspicion | An AML suspicion alert was raised | An AML suspicion alert was raised. Please cancel this transaction. | sender_error |
| 511 | /// | /// | Sender not allowed to transact | Sender is not allowed to transact. Please cancel this transaction. | sender_error |
| 52 | /// | Invalid sender details | Invalid sender details | Invalid sender details provided. Please cancel this transaction. | sender_error |
| 53 | /// | Invalid transaction details | Invalid transaction details | Invalid transaction details provided. Please cancel this transaction. | sender_error |
| 531 | /// | /// | Invalid amount provided | Invalid transaction details provided. Please cancel this transaction. | sender_error |
| 54 | /// | Explicit cancellation requested | Explicit cancellation requested | Transaction was requested to be cancelled at the provider. Please cancel this transaction. | sender_error |
| 541 | /// | /// | Explicit cancellation requested by user | Transaction was cancelled by the user. Please update the details. You can also cancel this transaction. | recipient_error |
| 542 | /// | /// | Explicit cancellation requested by sender | Transaction was cancelled by the sender. Please cancel this transaction. | sender_error |
| 543 | /// | /// | Explicit cancellation requested by provider | Transaction was cancelled by the provider. Please update the recipient details. You can also cancel this transaction. | recipient_error |

# Note
The categories `recipient_action_required` and `recipient_error` get mapped to `user_action_required` and `user_invalid_data_error` when dealing with a Collection Transaction.

# Pending transactions

Occasionally a transaction has neither errored, nor has paid out. We call these transactions pending. There are two main cases for pending transactions:

* For any kind of cash pickup transactions, pending means that the recipient has received a pickup notice, but didn't pick up the funds yet. This is also called the `recipient_action_required` state. These transactions can be cancelled, in which case the pickup notice will be invalidated and the recipient will not be able to use it to pick up the funds anymore.
* For some providers there might need to be action taken by the beneficiary to pick up the funds, for example they need to sign a mandate form. TTransactions here will also be in the `recipient_action_required` state.
* For other transactions pending means that the recipient's bank or mobile provider is still processing the transaction and will note at a later date whether it could deposit the funds or not. These transactions will have a `may_cancel` field set to `false`. If you try to cancel them using the `DELETE /v1/recipients/[TRANSFERZERO_RECIPIENT_ID]` endpoint they get cancelled right after we get confirmation from our bank or mobile provider that the funds could not be debited. However if the confirmation we receive says that the funds are sent out these transactions will not be cancelled, they will be marked as successful.
* For collections in `user_action_required` means that we sent the notification to the User and we are currently awaiting for the User to proceed with sending the funds.

<div class="alert alert-info" markdown="1">
**Note!** Occasionally a transaction can end up in a "pending loop", where once we get confirmation that the transaction has failed we immediately retry the payment - potentially making it pending again. To cancel these transactions you can either use the auto-cancellation feature (which is enabled by default), or ask our CS team to help cancel them.
</div>
