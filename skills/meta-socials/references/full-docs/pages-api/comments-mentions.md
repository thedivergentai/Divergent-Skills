# Comments and @Mentions - Facebook Pages API

Source: https://developers.facebook.com/docs/pages-api/comments-mentions

# Comments and @mentions

This guide explains how to comment on a Facebook Page post or comment on a Facebook Page post and @mention or tag a specific person or Page who has published a post on your Page or commented on a Page post using the Pages API from Meta.

## Before you start

This guide assumes you have read the [Overview](pages/overview.md) and the [Posts guide](pages/publishing.md) for the Facebook Pages API.

#### Permissions

For a person who can perform tasks on the page, you will need to implement Facebook Login or Business on your app to ask for the following permissions and receive a Page access token:

- `pages_manage_engagement`
- `pages_read_engagement`
- `pages_read_user_engagement`

#### Page tasks

Your app user must be able to perform the following tasks on the in the API requests:

- `MODERATE`
- `CREATE_CONTENT`

#### Page features

Your app will need the following features:

- Page Mentioning

#### IDs

- The Page Post ID for the Page post
- The Page-scoped ID for the person who created the Page post or comment, if you want to @mention that person

### Best Practices

When testing an API call, you can include the `access_token` parameter set to your access token. However, when making secure calls from your app, use the [access token class.](https://developers.facebook.com/docs/facebook-login/guides/access-tokens#portabletokens)
