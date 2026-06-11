# Publish Content - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-api-with-instagram-login/content-publishing

# Content Publishing

This guide shows you how to publish single images, videos, reels (single media posts), or posts containing multiple images and videos (carousel posts) on Instagram professional accounts using the Instagram Platform.

On March 24, 2025, we introduced the new `alt_text` field for image posts on the `/<INSTAGRAM_PROFESSIONAL_ACCOUNT_ID>/media` endpoint. Reels and stories are not supported.

## Requirements

This guide assumes you have read the [Instagram Platform Overview](instagram-platform/overview.md) and implemented the needed components for using this API, such as a Meta login flow and a webhooks server to receive notifications.

#### Media on a public server

We cURL media used in publishing attempts, so the media must be hosted on a publicly accessible server at the time of the attempt.

#### Page Publishing Authorization

An Instagram professional account connected to a [Page](instagram-api/overview.md#pages) that requires [Page Publishing Authorization](https://www.facebook.com/business/m/one-sheeters/page-publishing-authorization) (PPA) cannot be published to until PPA has been completed.

It's possible that an app user may be able to perform [Tasks](instagram-api/overview.md#tasks) on a Page that initially does not require PPA but later requires it. In this scenario, the app user would not be able to publish content to their Instagram professional account until completing PPA. Since there's no way for you to determine if an app user's Page requires PPA, we recommend that you advise app users to preemptively complete PPA.

You will need the following:

| Instagram API with Instagram Login | Instagram API with Facebook Login || **Access Levels** | - Advanced Access - Standard Access | - Advanced Access - Standard Access |
| **Access Tokens** | - Instagram User access token | - Facebook Page access token |
| **Host URL** | `graph.instagram.com` | `graph.facebook.com` `rupload.facebook.com` (For resumable video uploads) |
| **Login Type** | Business Login for Instagram | Facebook Login for Business |
| [**Permissions**](permissions/reference.md#i) | - `instagram_business_basic` - `instagram_business_content_publish` | - `instagram_basic` - `instagram_content_publish` - `pages_read_engagement`   If the app user was granted a role on the [Page](instagram-api/overview.md#pages) connected to your app user's Instagram professional account via the Business Manager, your app will also need:   - `ads_management` - `ads_read` |
| **Webhooks** |  |  |

#### Endpoints

- [`/<IG_ID>/media`](instagram-api/reference/ig-user/media.md#creating) — Create media container and upload the media
  - `upload_type=resumable` — Create a resumbable upload session to upload large videos from an area with frequent network interruptions or other transmission failures. Only for apps that have implemented Facebook Login for Business.
- [`/<IG_ID>/media_publish`](instagram-api/reference/ig-user/media_publish.md#creating) — publish uploaded media using their media containers.
- [`/<IG_CONTAINER_ID>?fields=status_code`](instagram-api/reference/ig-container.md#reading) — check media container publishing eligibility and status.
- [`/<IG_ID>/content_publishing_limit`](instagram-api/reference/ig-user/content_publishing_limit.md) — check app user's current publishing rate limit usage.
- `POST https://rupload.facebook.com/ig-api-upload/<IG_MEDIA_CONTAINER_ID>` — Upload the video to Meta servers
- `GET /<IG_MEDIA_CONTAINER_ID>?fields=status_code` — Check publishing eligibility and status of the video

#### HTML URL encoding troubleshooting

- Some of the parameters are supported in list/dict format.
- Some characters need to be encoded into a format that can be transmitted over the Internet. For example: `user_tags=[{username:’ig_user_name’}]` is encoded to `user_tags=%5B%7Busername:ig_user_name%7D%5D` where `[` is encoded to `%5B` and `{` is encoded to `%7B`. For more conversions, please refer to the HTML URL Encoding standard.

### Limitations

- JPEG is the only image format supported. Extended JPEG formats such as MPO and JPS are not supported.
- Shopping tags are not supported.
- Filters are not supported.

For additional limitations, see each endpoint's reference.

#### Rate Limit

Instagram accounts are limited to 100 API-published posts within a 24-hour moving period. Carousels count as a single post. This limit is enforced on the `POST /<IG_ID>/media_publish` endpoint when attempting to publish a media container. We recommend that your app also enforce the publishing rate limit, especially if your app allows app users to schedule posts to be published in the future.

To check an Instagram professional account's current rate limit usage, query the `GET /<IG_ID>/content_publishing_limit` endpoint.
