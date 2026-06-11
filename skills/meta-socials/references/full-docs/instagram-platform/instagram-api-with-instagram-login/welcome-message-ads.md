# Welcome message ads - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-api-with-instagram-login/welcome-message-ads

# Welcome Message Flows

When creating ads that Click to Instagram Direct, you can connect a message flow from a messaging partner app. A message flow can include text, images, emoji, buttons, and other message types supported by the [Send API](instagram-platform/instagram-api-with-instagram-login/messaging-api.md).

This guide shows how to create and manage welcome message flows via the Instagram Platform.

## Requirements

This guide assumes you have read the [Instagram Platform Overview](instagram-platform/overview.md) and implemented the needed components for using this API, such as a Meta login flow and a webhooks server to receive notifications.

You will need the following:

#### Access Level

- Advanced Access if your app serves Instagram professional accounts you don't own or manage
- Standard Access if your app serves Instagram professional accounts you own or manage and have added to your app in the App Dashboard

#### Access tokens

- An Instagram User access token requested from a person who can manage messages on the Instagram professional account

#### Base URL

All endpoints can be accessed via the `graph.instagram.com` host.

#### Endpoints

- [`/welcome_message_flows`](instagram-api/reference.md)
- `/<APP_USERS_INSTAGRAM_PRO_ID>` or `/me`

#### IDs

- The ID for the Instagram professional account that is creating the welcome message flow

#### Permissions

- `instagram_business_basic`
- `instagram_business_manage_messages`

### Limitations

- Welcome message flows are only available through Instagram Boost Ads if the Instagram professional account is not linked to a Facebook Page.
- Welcome message flows will not appear in Meta's Ads Manager if the Instagram professional account is not linked to a Facebook Page.

Linking a Facebook Page to the Instagram professional account allows for the welcome message flows to be visible in Ads Manager and accessible for other ad types.
