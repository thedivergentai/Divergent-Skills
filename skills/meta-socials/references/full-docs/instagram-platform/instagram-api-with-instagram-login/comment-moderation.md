# Comment Moderation  - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-api-with-instagram-login/comment-moderation

# Comment Moderation

This guide shows you how to get comments, reply to comments, delete comments, hide/unhide comments, and disable/enable comments on Instagram Media owned by your app users using the Instagram Platform.

In this guide we will be using **Instagram user** and **Instagram professional account** interchangeably. An Instagram User object represents your app user's Instagram professional account.

## Requirements

This guide assumes you have read the [Instagram Platform Overview](instagram-platform/overview.md) and implemented the needed components for using this API, such as a Meta login flow and a webhooks server to receive notifications.

You will need the following:

| Instagram API with Instagram Login | Instagram API with Facebook Login || **Access Tokens** | - Instagram User access token | - [Facebook Page access token](facebook-login/access-tokens.md) |
| **Host URL** | `graph.instagram.com` | `graph.facebook.com` |
| **Login Type** | Business Login for Instagram | Facebook Login for Business |
| [**Permissions**](permissions/reference.md#i) | - `instagram_business_basic` - `instagram_business_manage_comments` | - `instagram_basic` - `instagram_manage_comments` - `pages_read_engagement`   If the app user was granted a role on the [Page](instagram-api/overview.md#pages) connected to your app user's Instagram professional account via the Business Manager, your app will also need:   - `ads_management` - `ads_read` |
| **Webhooks** | - `comments` - `live_comments` | - `comments` - `live_comments` |

#### Access Level

- Advanced Access if your app serves Instagram professional accounts you don't own or manage
- Standard Access if your app serves Instagram professional accounts you own or manage and have added to your app in the App Dashboard

#### Endpoints

- [`GET /<IG_MEDIA_ID>/comments`](instagram-api/reference/ig-media/comments.md#reading) — Get comments on an IG Media
- [`GET /<IG_COMMENT_ID>/replies`](instagram-api/reference/ig-comment/replies.md#read) — Get replies on an IG Comment
- [`POST /<IG_COMMENT_ID>/replies`](instagram-api/reference/ig-comment/replies.md#create) — Reply to an IG Comment
- [`POST /<IG_COMMENT_ID>`](instagram-api/reference/ig-comment.md#update) — Hide/unhide an IG Comment
- [`POST /<IG_MEDIA_ID>`](instagram-api/reference/ig-media.md#update) — Disable/enable comments on an IG Media
- [`DELETE /<IG_COMMENT_ID>`](instagram-api/reference/ig-comment.md#delete) — Delete an IG Comment
