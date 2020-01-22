---
title: KYC requirements
permalink: /docs/kyc/
---

* Table of contents
{:toc}

Rules and regulations in the markets we operate require that all senders went through a KYC process before being allowed to transact funds. This is regardless whether our system is used for payout or for collection purposes. When you sign up with us our Compliance team will assess your KYC processess and based on that decide on how you'll be able to use our site. Based on their assessment there are three categories:

* We don't need to check or approve your senders before they are able to transact
* We need to check and approve your senders before they are able to transact
* We need to ask for extra documents from your senders, and then check and approve them before they are able to transact

In this document we'll go through these options and what they mean for using our site:

# No checks required

If you are already doing a full KYC on your customers then we won't need to re-do them. In this case any sender you create in our system will essentially going to become `approved` immediately and can be used for both payments and collections without further processing.

<div class="alert alert-info" markdown="1">
**Note!** The state on the sender will still remain `initial`, as that only shows whether our team has approved the sender or not, but regardless you won't need to care about the sender's state ever.
</div>

If you are doing full KYC you might also opt-in to use our relaxed WTR2 rules on senders, which means you won't need to send as many details as is usually required.

<div class="alert alert-info" markdown="1">
**Note!** Some of our corridors require more details about the sneder than others, and will not work if you are only sending limited information based on the WTR2 rules.
</div>

<div class="alert alert-info" markdown="1">
**Note!** If when creating senders or transactions you get the following error in the response: `"errors":{"documents":[{"error":"blank"}]}` it means that KYC requirements are not yet waived for your account. If we already approved your KYC process and so they should be, then please contact us so we can rectify the issue and update your account accordingly.
</div>

Even if senders are approved immediately you need to make sure that in case their details change in your system (for example they update their address), these are changed in our system as well. The easiest way to do this is by using our external ID facility for senders and always sending the latest and full sender details when creating transactions, so we can update the sender at this point if they have changed. Alternatively you can use the `PATCH /v1/senders/[TRANSERZERO_SENDER_ID]` endpoint to manually update senders if required.

# We need to approve senders

Sometimes we'll have to double check the senders you are creating in our system. In this case Senders have to be created first with all of their details and they will end up in the `initial` state first. Only once the details are checked by our team will they move to `approved`. Only when a sender is approved can they be used to create transactions, regardless whether the transaction is for payouts or collections.

The typical flow for sender approval is the following:

![Sender registration flow]({{ "/img/uml/sender-kyc.png" | prepend: site.baseurl }})

<div class="alert alert-info" markdown="1">
**Note!** If you are not doing a full KYC this means you won't be able to create senders implicitly when creating transactions, as transactions can only be created with approved senders.
</div>

You will also need to manage senders separately, e.g. if some details change on your end, like the sender's address, you'll need to make sure they are updated in our system as well. Note that some changes might require us to re-do the KYC process! To update the sender you should use the `PATCH /v1/senders/[TRANSFERZERO_SENDER_ID]` endpoint to facilitate this change.

Finally you need to subscribe to the sender webhooks which will notify you in case a sender gets approved, or if we had to revoke the approval (ban) them.

# We need to obtain documents from senders

Lastly for some use-cases we might not only require full sender details, but also require them to send us proof of ID or other documents, usually a scanned passport. In this case when creating senders you not only need to send us all of their details, but also upload these required documents as part of the sender creation.

For more information on how to send in documents please check the Sender model's description in our [API reference documentation](https://api.transferzero.com/documentation).

Once we recieve the sender details including the proof of ID documents we'll process the sender, who will only be able to initiate transactions once they get approved. You will receive a webhook notification when that has happened.
