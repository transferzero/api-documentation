---
title: Get started
permalink: /docs/home/
redirect_from: /docs/index.html
---

The AZA Finance API allows users to create transactions programmatically to send and receive money from various African countries. This documentation provides a tutorial for the most common flows of using the API.

To use our API please register and obtain valid API keys on the [AZA Finance developer portal](https://developers.transferzero.com). Once you obtain these keys please [contact our team](mailto:info@transferzero.com), so they can set up your environment. This includes setting up a Slack channel where you can ask technical questions, and they will also enable your API key so they can be used on our sandbox environment.

<div class="alert alert-warning" markdown="1">
**Warning!** You need to contact us to get your API keys enabled before you can use our sandbox environment.
</div>

<div class="alert alert-info" markdown="1">
**Note!** Once you are approved to use our system you'll be invited to our Slack channel. Afterwards we prefer all technical questions to go though this Slack channel instead of email or other contact methods, as we're monitoring this channel more often for partner requests.
</div>

Initially the keys will only be valid to be used on our sandbox environment at `https://api-sandbox.transferzero.com`. This environment is a testing environment where you can test our API using test funds. The environment also provides a few tools to help testing, for more info please check the  [sandbox testing]({{ "/docs/sandbox-testing/" | prepend: site.baseurl }}) documentation.

Please check our two main examples, one for [handling payments]({{ "/docs/example-payments/" | prepend: site.baseurl}}), and one for [handling collections]({{ "/docs/example-collections/" | prepend: site.baseurl}}) as a starting point.

Once development is finished against our API in the sandbox environment, please contact us again where our representatives will validate your implementation and if successful allow access to our production environment.

<div class="alert alert-warning" markdown="1">
**Warning!** During this verification we will check that your implementation works as expected, and as a minimum supports the following functionalities:

* Authenticate to our site
* Create and re-use senders
* Create and fund transactions
* Check the status of transactions both via webhooks and manually
* Handling and cancelling failed transactions
</div>

You can find more information in our [quick integration guide]({{ "/docs/quick-integration/" | prepend: site.baseurl }}) that contains the major points in making sure your implementation will be approved. You can also check our [additional features guide]({{ "/docs/additional-features/" | prepend: site.baseurl }}) for some of the other features we support and you might want to use, and also the [reference documentation](https://api.transferzero.com/documentation) which contains a reference of all of the available API endpoints we have.
