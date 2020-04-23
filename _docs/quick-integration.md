---
title: Quick Integration
permalink: /docs/quick-integration/
---

* Table of contents
{:toc}

Note that our system generally requires that you have your senders fully KYC'd for them to be able to transact. Therefore before you start with the implementation please [contact our team](mailto:info@transferzero.com) as they will assess how you'll plan to use our API and what KYC requirements you'll need to have. Also your sandbox API keys are only activated once you'll contact us and we approve you using our test system.

Development should be done on our sandbox environment. Once you finish with the integration we will have a call to check that your implementation works as expected, and as a minimum supports the following functionalities:

* Authenticate to our site
* Create and re-use senders
* Create and fund transactions
* Check the status of transactions both via webhooks and manually
* Handling and cancelling failed transactions

Once you pass these requirements we'll approve your API and allow it to be used on our production system.

# Software Development Kits

To facilitate easier integration with our API, we have SDKs available for the following languages:

- [Java 7]({{ "/docs/sdk-java7/" | prepend: site.baseurl }})
- [Java 8+]({{ "/docs/sdk-java8/" | prepend: site.baseurl }})
- [Ruby]({{ "/docs/sdk-ruby/" | prepend: site.baseurl }})
- [Javascript]({{ "/docs/sdk-javascript/" | prepend: site.baseurl }})
- [PHP]({{ "/docs/sdk-php/" | prepend: site.baseurl }})
- [.NET (C# / VB.NET)]({{ "/docs/sdk-dotnet/" | prepend: site.baseurl }})

For a quick overview with examples please check our two main examples, one for [handling payments]({{ "/docs/example-payments/" | prepend: site.baseurl}}), and one for [handling collections]({{ "/docs/example-collections/" | prepend: site.baseurl}}) as a starting point.

Afterwards please check our [Architecture Guide]({{ "/docs/architecture/" | prepend: site.baseurl }}) and the [Transaction Flow Guide]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}) which contain more details about our system. Also to make the process of creating a minimum approved integration easier, we encourage you to make use of our SDKs and implement the required steps in this order:

# The sandbox environment

All development has to be done on our sandbox environment, which is a fully-fledged environment with some limitations, and some features that can be used to help testing. Please read about these features in out [Sandbox environment documentation]({{ "/docs/sandbox-testing/" | prepend: site.baseurl }})

# Authentication

If you're not using our SDKs then please read our [Authentication guide]({{ "/docs/authentication/" | prepend: site.baseurl }}) on how to register for an API key and how to use it on our site. Since our authentication system is fairly complex we'd prefer you try out our SDKs as they have these steps already implemented.

# Creating transactions

Please read [our guide on creating transactions]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#creating-transactions)
 on how you can create transactions, and the various options you have. Please make sure you already have discussed with us how your transactions will be funded before you start with this task.

# Funding transactions

If you are going to have a balance with us, then please read [our guide on funding transactions]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#funding-transactions) on how you can fund the transaction. Funding the transaction means you approve the amounts that were returned in the transaction and you are happy for us to initate the payout.

<div class="alert alert-info" markdown="1">
**Note!** You can also do transaction creation and funding in one single call, however in this case the approval of the transaction will be implicit.
</div>

# Checking transaction status

Once a transaction is funded you can use our webhook facilities to listen in changes in the transaction state. You should listen to both the transaction and the recipient events. On more info about webhooks please see our [webhook guide]({{ "/docs/architecture/" | prepend: site.baseurl }}#webhooks). You should also be able to query transactions manually, but this facility should only be used rarely.

# Handling errors

You need to be sure that you can handle transactions where the payout has failed. For a generic guide please see [how you receive error messages]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#receiving-error-messages) and [how you can cancel recipients and transactions]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#cancelling-recipients-and-transactions). A more in-depth guide as available in our [error handling documentation]({{ "/docs/error-handling/" | prepend: site.baseurl }}).

Note that by default we will cancel funded transactions if we cannot pay them out within 24 hours, but [you can disable this feature if you'd like]({{ "/docs/additional-features/" | prepend: site.baseurl }}#auto-cancellation-and-refund-of-transactions).

<div class="alert alert-info" markdown="1">
**Note!** Although the auto cancellation feature makes it much easier to handle failing transactions on your end, we still require that your system can receive error messages from us, and can cancel these transactions manually as well if required.
</div>

If you don't wish to use the auto cancellation feature then note that since there can be a wide range of different errors, as a starting implementation we usually propose the following logic:

* Wait for at least 24 hours after the transaction is funded to see if it has been paid out successfully or not
* If hasn't been paid out, then please cancel the transaction using the API, and wait for the cancellation to finish
* If it cannot be cancelled please contact our Customer Service team to investigate

Once you have been successfully integrated with us you can add additional logic for a few specific error messages (for example the ability to change the bank account number if the error states it is invalid). However these are not required for a successful integration, and the logic mentioned above works for most of the cases where there was an error.

<div class="alert alert-warning" markdown="1">
**Warning!** Any transaction that is not cancelled - even ones that seemingly have a fatal error in their description could potentially pay out in the future. If you don't wish a transaction to pay out and you'd like to recover the debited funds you HAVE TO cancel the transaction, and then make sure it got cancelled before you update your system.
</div>

# Re-using senders

Finally you need to be able to re-use senders. This means any time you wish to create a transaction for the same sender you already used, you should use the same sender ID instead of creating a completely new sender object. This is so we can tie the transactions made by the same sender together for KYC and AML purposes. For more details please see [senders on transactions]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#sender). We propose using our External ID feature on the senders as that makes this step easier to implement.
