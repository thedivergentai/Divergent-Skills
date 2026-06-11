# IG Comment - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-graph-api/reference/ig-comment

# Instagram (IG) Comment

Represents a comment on an [Instagram media object](instagram-api/reference/ig-media.md).

If you are migrating from Marketing API Instagram Ads endpoints to Instagram Platform endpoints, be aware that some field names are different.

Introducing the following fields:

- `legacy_instagram_comment_id`

The following fields are not supported:

- `comment_type`
- `mentioned_instagram_users`

### Requirements

| Instagram API with Instagram Login | Instagram API with Facebook Login || **Access Tokens** | - Instagram User access token | - [Facebook User access token](facebook-login/access-tokens/.md#usertokens) |
| **Host URL** | `graph.instagram.com` | `graph.facebook.com` |
| **Login Type** | Business Login for Instagram | Facebook Login for Business |
| [**Permissions**](permissions/reference.md#i) | - `instagram_business_basic` - `instagram_business_manage_comments` | - `instagram_basic` - `instagram_manage_comments` - `pages_read_engagement`   If the app user was granted a role via the Business Manager on the [Page](instagram-api/overview.md#pages) connected to the targeted IG User, you will also need one of:   - `ads_management` - `ads_read` |
