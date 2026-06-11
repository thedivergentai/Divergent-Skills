# Business Login for Instagram - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-api-with-instagram-login/business-login

# Business Login for Instagram

Business Login is a custom login flow that allows your app to ask for permissions to access your app user's Instagram professional account data and to get an access token to use in your app's API requests.

To ensure consistency between scope values and permission names, we are introducing new `scope` values for the Instagram API with Instagram login. The new `scope` values are:

- `instagram_business_basic`
- `instagram_business_content_publish`
- `instagram_business_manage_messages`
- `instagram_business_manage_comments`

These will replace the existing `business_basic`, `business_content_publish`, `business_manage_comments` and `business_manage_messages` `scope` values, respectively.

Please note that the old scope values will be deprecated on **January 27, 2025**. It is essential to update your code before this date to avoid any disruption in your app's functionality. Failure to do so will result in your app being unable to call the Instagram endpoints.

### How it works

Your app user launches the login flow on your app or website by clicking your embed URL link or button. This embed URL, that you set up in the App Dashboard with the permissions you are requesting from your app users, opens an authorization window. Your app user uses this window to grant your app permissions. When the user submits the login flow, Meta redirects your app user to your redirect URI and sends an authorization code. Your app can then exchange this authorization code for a short-lived Instagram User access token, an Instagram-scoped user ID for your app user, and a list of permissions the app user granted your app. Your app can exchanged this short-lived access token for a long-lived Instagram user access token that is valid for 60 days.

## Before you start

If you haven't already, [add the Instagram product](instagram-platform/instagram-api-with-instagram-login/create-a-meta-app-with-instagram.md) to your app and configure your [**Business login settings**](instagram-platform/instagram-api-with-instagram-login/create-a-meta-app-with-instagram.md#step-9--set-up-business-login) in the Meta App Dashboard.

### Embed the business login URL

You should have completed this step during Instagram app setup in the App Dashboard, but if not, complete the following steps.

1. Copy the **Embed URL** from the **Set up business login** in the App Dashboard.
2. Paste the URL in an anchor tag or button on your app or website to launch the login flow.
