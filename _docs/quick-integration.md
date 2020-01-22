---
title: Quick Integration
permalink: /docs/quick-integration/
---

* Table of contents
{:toc}

Before you start with the implementation please [contact our team](mailto:info@transferzero.com) as they will assess whether we can waive some of the requirements around our API, including the need for KYC'ing the senders and whether you can collect money on our behalf.

Once you finish with the integration we will have a call to check that your implementation works as expected, and as a minimum supports the following functionalities:

* Authenticate to our site
* Create and re-use senders
* Create and fund transactions
* Check the status of transactions both via webhooks and manually
* Handling and cancelling failed transactions

# Software Development Kits

To facilitate easier integration with our API, we have SDKs available for the following languages:

- [Java 7]({{ "/docs/sdk-java7/" | prepend: site.baseurl }})
- [Java 8]({{ "/docs/sdk-java8/" | prepend: site.baseurl }})
- [Ruby]({{ "/docs/sdk-ruby/" | prepend: site.baseurl }})
- [Javascript]({{ "/docs/sdk-javascript/" | prepend: site.baseurl }})
- [PHP]({{ "/docs/sdk-php/" | prepend: site.baseurl }})
- [.NET (C# / VB.NET)]({{ "/docs/sdk-dotnet/" | prepend: site.baseurl }})

Please read our [Architecture Guide]({{ "/docs/architecture/" | prepend: site.baseurl }}) and the [Transaction Flow Guide]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}) before going through the implementation, but to make the process of creating a minimum approved integration easier, we encourage you to make use of our SDKs and implement the required steps in this order:

# The sandbox environment

All development has to be done on our sandbox environment, which is a fully-fledged environment with some limitations, and some features that can be used to help testing. Please read about these features in out [Sandbox environment documentation]({{ "/docs/sandbox-testing/" | prepend: site.baseurl }})

# Authentication

Please read our [Authentication guide]({{ "/docs/authentication/" | prepend: site.baseurl }}) on how to register for an API key and how to use it on our site. You can also find example implementations around authentication for some of the major programming languages.

# Creating transactions

Please read [our guide on creating transactions]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#creating-transactions)
 on how you can create transactions, and the various options you have. Please make sure you already have discussed with us how your transactions will be funded before you start with this task.

# Funding transactions

If you are going to have a balance with us, then please read [our guide on funding transactions]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#funding-transactions) on how you can fund the transaction. Funding the transaction means you approve the amounts that were returned in the transaction and you are happy for us to initate the payout.

# Checking transaction status

Once a transaction is funded you can use our webhook facilities to listen in changes in the transaction state. You should listen to both the transaction and the recipient events. On more info about webhooks please see our [webhook guide]({{ "/docs/architecture/" | prepend: site.baseurl }}#webhooks). You should also be able to query transactions manually, but this facility should only be used rarely.

# Handling errors

You need to be sure that you can handle transactions where the payout has failed. For a generic guide please see [how you receive error messages]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#receiving-error-messages) and [how you can cancel recipients and transactions]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#cancelling-recipients-and-transactions). Note that by default we will never cancel funded transactions without your request but [you can enable this feature if you'd like]({{ "/docs/additional-features/" | prepend: site.baseurl }}#auto-cancellation-and-refund-of-transactions).

Since there can be a wide range of different errors, as a starting implementation we usually propose the following logic:

* Wait for at least 24 hours after the transaction is funded to see if it has been paid out successfully or not
* If hasn't been paid out, then please cancel the transaction using the API, and wait for the cancellation to finish
* If it cannot be cancelled please contact our Customer Service team to investigate

Once you have been successfully integrated with us you can add additional logic for a few specific error messages (for example the ability to change the bank account number if the error states it is invalid). However these are not required for a successful integration, and the logic mentioned above works for most of the cases where there was an error.

# Re-using senders

Finally you need to be able to re-use senders. This means any time you wish to create a transaction for the same sender you already used, you should use the same sender ID instead of creating a completely new sender object. For more details please see [senders on transactions]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}#sender).
