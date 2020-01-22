---
title: The sandbox environment
permalink: /docs/sandbox-testing/
---

* Table of contents
{:toc}

Our sandbox environment is a trimmed down version of our production API that allows you test out new features. It is also the environment where you'll need to demonstrate you can use our system well enough before we approve your API and give access to our production system.

To facilitate testing our sandbox environment has a few features that can help in developing your integration. These features are not available on our production environment.

# Forcing transactions to pay out

You can use the `POST /transactions/{Transaction ID}/payout` endpoint with an empty body to force a funded, but not yet paid transaction to succeed. You can use this endpoint to test out if you are receiving successful transaction webhooks properly.

# Forcing collections to succeed

When using our [collections feature]({{ "/docs/additional-features/" | prepend: site.baseurl }}#collections-from-senders) you can force the collection to succeed. Please see the documentation of this feature in our [API specification guide](https://api.transferzero.com/documentation/#/Transactions/payin-transaction)

# Account validation

When testing our account validation feature for GHS and NGN bank payments any account number starting with a `9` will return a failure. All other account numbers will return a user with name `TEST USER`. This applies to both the [bank account name enquiry]({{ "/docs/additional-features/" | prepend: site.baseurl }}#bank-account-name-enquiry) feature and the [name validation in transactions]({{ "/docs/additional-features/" | prepend: site.baseurl }}#name-validation-in-transactions) feature.

# Testing additional scenarios

When developing your integration and you wish to test a different scenario you can also ping us in your partners slack channel where we're happy to help you set up the scenarios during normal working hours.
