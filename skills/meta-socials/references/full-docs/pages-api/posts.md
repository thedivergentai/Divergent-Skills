# Posts - Facebook Pages API

Source: https://developers.facebook.com/docs/pages-api/posts

# Posts

This guide explains how to create, publish, and update a post, and reply to a post on your Facebook Page as the Page, and delete a post using the Pages API from Meta.

## Before you start

This guide assumes you have read the [Overview](pages/overview.md)

For a person who can perform tasks on the page, you will need to implement Facebook Login to ask for the following permissions and receive a Page access token:

- `pages_manage_engagement`
- `pages_manage_posts`
- `pages_read_engagement`
- `pages_read_user_engagement`
- `publish_video` permission, if you are publishing a video to the Page

Your app user must be able to perform the `CREATE_CONTENT`, `MANAGE`, and `MODERATE` tasks on the Page in the API requests.

If your app users do not own or manage the Page in the API requests, your app will need a User access token and the following features:

- Page Public Content Access

### Best practices

When testing an API call, you can include the `access_token` parameter set to your access token. However, when making secure calls from your app, use the [access token class.](https://developers.facebook.com/docs/facebook-login/guides/access-tokens#portabletokens)
