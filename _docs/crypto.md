---
title: Crypto Transactions
permalink: /docs/crypto-transactions/
---

* Table of contents
{:toc}

Our system also supports transactions involving BTC. You can either use the system to send or to receive BTC. These features are very similar to our [payout]({{ "/docs/individual-payments/" | prepend: site.baseurl }}) and [collection]({{ "/docs/collection-details/" | prepend: site.baseurl }}) system. Before using our crypto platform please familiarize yourself with how fiat transactions work in our system.

# Sending BTC

Please read our [transaction flow]({{ "/docs/transaction-flow/" | prepend: site.baseurl }}) and [payout documentation]({{ "/docs/individual-payments/" | prepend: site.baseurl }}) for more information on how payments work.

To send BTC to a wallet you'll have to use the following payout details:

{% capture data-raw %}
```javascript
{
    "type": "BTC",
    "details": {
        "first_name": "First",
        "last_name": "Last",
        "name": "Full Name",
        "address": "n4VQ5YdHf7hLQ2gWQYYrcxoE5B7nWuDFNF"
          // BTC Wallet address to send the funds to
    }
}
```
{% endcapture %}

{% include language-tabbar.html prefix="btc-payout" raw=data-raw %}

To fund BTC transactions you can either use your fiat account balance (e.g. `NGN` or `USD`) or create a transaction with a collection request as shown in our [collection documentation]({{ "/docs/collection-details/" | prepend: site.baseurl }}). If you create transactions with both collections and BTC payments, once the funds are collected from the customer they are sent out immediately to the specified BTC address. You can also first collect the customer's funds into your internal balance, and only once received create a transaction to send the funds out as BTC to the user.

<div class="alert alert-warning" markdown="1">
**Warning!** Due to the volatility of BTC, the exchange rates might have changed in this case between the collection and the payment.
</div>

# Receiving BTC

Please read our [collection from senders]({{ "/docs/additional-features/" | prepend: site.baseurl }}#collection-from-senders) and [collection details]({{ "/docs/collection-details/" | prepend: site.baseurl }}) documentations for more information on how collections work.

To receive BTC you have to use the following collection details.

{% capture data-raw %}
```javascript
"input_currency": "BTC",
"payin_methods": [
  {
    "type": "BTC",
    "in_details": {
      "refund_address": "n4VQ5YdHf7hLQ2gWQYYrcxoE5B7nWuDFNF"
    }
  }
],
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-btc" raw=data-raw %}

Please make sure the `refund_address` is a valid BTC address belonging to the sender, as that is going to be used in case the transaction has to be refunded.

Once the transaction has been created the `out_details` will be:

{% capture data-raw %}
```javascript
"out_details": {
  "url": "bitcoin:n4VQ5YdHf7hLQ2gWQYYrcxoE5B7nWuDFNF?amount=0.0001",
  "Address": "n4VQ5YdHf7hLQ2gWQYYrcxoE5B7nWuDFNF"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="collection-btc-out" raw=data-raw %}

The `Address` field contains the BTC address where the funds have to be sent, and the `url` contains a full URL with all details, that could be converted for example to a QR code for the customer to use.

Once the customer sends in the funds then dependent on the amount and the current state of the BTC system we will wait for a certain amount of confirmations before we consider the transaction paid.

Funds collected from BTC can either go to an internal fiat balance (e.g. `USD::Balance` or `NGN::Balance`) or can be used immediately to pay out a recipient as stated in the [payout documentation]({{ "/docs/individual-payments/" | prepend: site.baseurl }})

<div class="alert alert-warning" markdown="1">
**Warning!** Due to the volatility of BTC, the exchange rates might have changed in case the funds are first routed to an internal balance and only then used to pay out a recipient.
</div>

<div class="alert alert-info" markdown="1">
**Info!** In case the transaction was a direct payout attempt to a recipient, if the payout fails for any reason and the transaction has to be cancelled, the BTC will be refunded to the `refund_address` provided in the initial request. In case the transaction is split between putting money into the internal balance first and only then using that the pay the recipient, then the refund will be put back to the internal balance, and will not be send back to the `refund_address`.
</div>
