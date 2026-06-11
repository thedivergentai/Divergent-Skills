# Insights - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-api-with-facebook-login/insights

# Insights

This guide shows you how to get insights for your app users' Instagram media and professional accounts using the Instagram Platform.

In this guide we will be using **Instagram user** and **Instagram professional account** interchangeably. An Instagram User object represents your app user's Instagram professional account.

Instagram Insights are now available for Instagram API with Instagram Login. [Learn more.](instagram-platform/insights.md)

## Before you start

You will need the following:

### Requirements

This guide assumes you have read the [Instagram Platform Overview](instagram-platform/overview.md) and implemented the needed components for using this API, such as a Meta login flow and a webhooks server to receive notifications.

| Instagram API with Instagram Login | Instagram API with Facebook Login || **Access Tokens** | - Instagram User access token | - [Facebook User access token](facebook-login/access-tokens/.md#usertokens) |
| **Host URL** | `graph.instagram.com` | `graph.facebook.com` |
| **Login Type** | Business Login for Instagram | Facebook Login for Business |
| [**Permissions**](permissions/reference.md#i) | - `instagram_business_basic` - `instagram_business_manage_insights` | - `instagram_basic` - `instagram_manage_insights` - `pages_read_engagement`   If the app user was granted a role on the [Page](instagram-api/overview.md#pages) connected to your app user's Instagram professional account via the Business Manager, your app will also need:   - `ads_management` - `ads_read` |

#### Access Level

- Advanced Access if your app serves Instagram professional accounts you don't own or manage
- Standard Access if your app serves Instagram professional accounts you own or manage and have added to your app in the App Dashboard

#### Endpoints

- [`GET /<INSTAGRAM_MEDIA_ID>/insights`](instagram-api/reference/ig-media/insights.md) — Gets metrics on a media object
- [`GET /<INSTAGRAM_ACCOUNT_ID>/insights`](instagram-api/reference/ig-user/insights.md) — Gets metrics on an Instagram Business Account or Instagram Creator account.

Refer to each endpoint's reference documentation for additional metrics, parameters, and permission requirements.

#### UTC

Timestamps in API responses use UTC with zero offset and are formatted using ISO-8601. For example: `2019-04-05T07:56:32+0000`

#### Webhook event subscriptions

- [`story_insights`  – **Only available for Instagram API with Facebook Login.**](instagram-platform/instagram-api-with-facebook-login/webhooks.md)

### Limitations

#### Media insights

- Metrics such as `comments`, `likes`, and `views` return engagement on the target Instagram media only and don't include data from other surfaces. For example, `comments` returns the number of comments on a photo, but not comments on ads that contain that photo. Use `total_comments`, `total_likes`, and `total_views` on the Insights endpoint to get aggregated counts that include engagement from promoted/boosted/ad media. These total metrics are only available for Instagram API with Facebook Login.
- Live video Instagram Media can only be read while they are being broadcast.
- This API returns only data for media owned by Instagram professional accounts. It cannot be used to get data for media owned by personal Instagram accounts.

#### Account insights

- Some metrics are not available on Instagram accounts with fewer than 100 followers.
- User Metrics data is stored for up to 90 days.
- You can only get insights for a single user at a time.
- You cannot get insights for Facebook Pages.
- If insights data you are requesting does not exist or is currently unavailable the API will return an empty data set instead of `0` for individual metrics.
