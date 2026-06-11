# Manage a Page - Facebook Pages API

Source: https://developers.facebook.com/docs/pages-api/manage-pages

# Manage a Page

This document shows you how to perform the following tasks for a Facebook Page:

- Get a list of pages that you can perform a task on including:
  - Specific tasks you can perform on each Page
  - Page access tokens for each Page that you can use to test API calls
- Get and update details about a Page
- Get and update settings for a Page
- Get notifications about suggested changes Meta will be implementing on a Page
  - Accept or reject these suggested changes
- Get reviews for a Page
- Block a person from a Page

## Before you start

This guide assumes you have read the [Pages API Overview](pages/overview.md).

For a person who can perform tasks on the page, you will need to implement Facebook Login for Business to ask for the following permissions and receive a User or Page access token:

- `pages_manage_engagement`
- `pages_manage_metadata`
- `pages_manage_posts`
- `pages_read_engagement`
- `pages_read_user_engagement`
- `pages_show_list`
- `publish_video` permission, if you are publishing a video to the Page

If using a business system user in your API requests, the `business_management` permission is required.

Your app user must be able to perform the `CREATE_CONTENT`, `MANAGE`, and/or `MODERATE` tasks on the Page in the API requests.

### Best practices

When testing an API call, you can include the `access_token` parameter set to your access token. However, when making secure calls from your app, use the [access token class.](https://developers.facebook.com/docs/facebook-login/guides/access-tokens#portabletokens)

*Example requests are formatted for readability. Replace **bold, italics values**, such as **page\_id**, with your values.*
