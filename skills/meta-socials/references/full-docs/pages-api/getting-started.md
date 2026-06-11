# Get Started - Facebook Pages API

Source: https://developers.facebook.com/docs/pages-api/getting-started

# Get Started

This document explains how to successfully call the Pages API to post to your Page.

## Before You Start

You will need the following:

- A Facebook Page, this can be an unpublished or published Page on which you can perform the `CREATE_CONTENT` task.
- A Page access token for the Page
- The following permissions:
  - `pages_manage_metadata`
  - `pages_manage_posts`
  - `pages_manage_read_engagement`
  - `pages_show_list`

### Best Practices

When testing an API call, you can include the `access_token` parameter set to your access token. However, when making secure calls from your app, use the [access token class.](https://developers.facebook.com/docs/facebook-login/guides/access-tokens#portabletokens)
