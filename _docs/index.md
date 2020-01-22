---
title: Get started
permalink: /docs/home/
redirect_from: /docs/index.html
---

The TransferZero API allows users to create transactions programmatically to send and receive money from various African countries. This documentation provides a tutorial for the most common flows of using the API.

To use our API please register and obtain valid API keys on the [TransferZero developer portal](https://developers.transferzero.com).

Initially the keys will only be valid to be used on our sandbox environment at `https://api-sandbox.transferzero.com`

You can read more about what is available on our sandbox environment in the [sandbox testing]({{ "/docs/sandbox-testing/" | prepend: site.baseurl }}) documentation.

Once development is finished against our API, please contact TransferZero where our representatives will validate your implementation and if successful allow access to the live environment.

<div class="alert alert-warning"><b>Warning!</b>
During this verification we will check that your implementation works as expected, and as a minimum supports the following functionalities:
<ul>
<li>Authenticate to our site</li>
<li>Create and re-use senders</li>
<li>Create and fund transactions</li>
<li>Check the status of transactions both via webhooks and manually</li>
<li>Handling and cancelling failed transactions</li>
</ul>
</div>

You can also check our [quick integration guide]({{ "/docs/quick-integration/" | prepend: site.baseurl }}) that contains the major points in making sure your implementation will be approved. You can also check our [additional features guide]({{ "/docs/additional-features/" | prepend: site.baseurl }}) for some of the other features we support and you might want to use, and also the [reference documentation](https://api.transferzero.com/documentation) which contains a reference of all of the available API endpoints we have.
