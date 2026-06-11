# Messaging - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-api-with-instagram-login/messaging-api

# Send Messages

This guide shows you how to send a message to an Instagram user from your Instagram professional account using the Instagram API with Instagram Login.

## How It Works

The Instagram API with Instagram Login enables your app users to send and receive messages between their Instagram professional account and their customers, potential customers, and followers.

#### An Instagram user sends a message

Conversations only begin when an Instagram user sends a message to your app user through your app user's Instagram Feed, posts, story mentions, and other channels.

#### Instagram Inbox

An Instagram professional account has a messaging inbox that allows the user to organize messages and control message notifications however when using the API the behavior will be a little different.

- **General** – Only after your app user to respond to a message, using your app, is the conversation moved to the General folder, regardless of the inbox settings.
- **Primary** – All new conversations from followers will initially appear in the Primary folder.
- **Requests** – All new conversations from Instagram users who aren't followers of your app user will appear in the Requests folder.

[Learn more about the Instagram Inbox.](https://www.facebook.com/business/help/1264898753662278)

#### Inbox Limitations

- Inbox folders are not supported and messages delivered by the Messenger Platform do not include folder information that is shown in the Instagram from Meta app inbox folder
- Webhooks notifications or messages delivered via the API will not be considered as **Read** in the Instagram app inbox. Only after a reply is sent will a message be considered **Read**.

#### A webhook notification is sent

When an Instagram user sends a message to your app user, an event is triggered, and a webhook notification is sent to your webhook server. The notification contains the Instagram user's Instagram-scoped ID and their message. Your app user can use this information to respond.

#### Send a message

Only after an Instagram user has sent your app user's Instagram professional account a message can your app send a message to the Instagram user. Your app has 24 hours to respond to any message sent from an Instagram user to your app user.

Messages can contain the following:

|  |  |  |
| --- | --- | --- |
| - Audio files - Images - Instagram posts (owned by your app user) | - Links - Reactions - Stickers | - Templates - Text - Videos - PDF Files |

#### Automated experiences

You can provide an escalation path for automated messaging experiences using one of the following:

- **A Single App** – You can create a custom inbox to receive or reply to messages from a person. This custom inbox is powered by the same messaging app that also provides the automated experience
- **Multiple Apps** – [Handover Protocol](https://developers.facebook.com/docs/messenger-platform/handover-protocol)  allows you pass the conversation from one app or inbox to another. For example, one app would handle the conversation with an automated experience and, when needed, would pass the conversation to another app to continue the conversation with a human agent.

#### Informing Users About Your Automated Experience

When required by applicable law, automated chat experiences must disclose that a person is interacting with an automated service:

- at the beginning of any conversation or message thread,
- after a significant lapse of time, or
- when a chat moves from human interaction to automated experience.

Automated chat experiences that serve the following groups should pay special attention to this requirement:

- California market or California users
- German market or German users

Disclosures may include but are not limited to: “I’m the [Page Name] bot,”“You are interacting with an automated experience,” “You are talking to a bot,” or “I am an automated chatbot.”

Even where not legally required, we recommend informing users when they’re interacting with an automated chat as best practice, as this helps manage user expectations about their interaction with your messaging experience.

Visit our
[Developer Policies](https://developers.facebook.com/devpolicy/#messengerplatform)
for more information.

#### Human agent experiences

If your app user uses a human agent to respond to messages and therefore may need more time to respond, your app can tag the response to allow your app to send the message outside the 24 hour messaging window.

You can provide an escalation path for human agent only messaging experiences with a custom inbox. Your messaging app must be able to:

- receive messages sent by people and render them correctly in the custom inbox
- reply to messages via the custom inbox and ensure people successfully received them

### Limitations

- Your app user must own any media or posts to be used in the message.
- Group messaging is not supported. An Instagram professional account can only converse with one customer per conversation.
- Messages in the Requests folder that have not been active for 30 days will not be returned in API calls.
- Only the URL for the shared media or post is included in the webhooks notification when a customer sends a message with a share.
- Your app testers must have a role on your app, grant your app access to all the required permissions, and have a role on the Instagram professional account that owns the app.
