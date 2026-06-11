# Webhooks - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/webhooks

# Setup Webhooks Subscriptions

This document shows you how to create an endpoint on your server to receive webhook notifications from Meta and subscribe to webhook fields for an Instagram professional account using your app. This allows you to receive real-time notifications whenever someone comments on the Media objects of the Instagram professional account using your app, @mentions your app users, when your app users' Stories expire, or when a Instagram user sends a message to that Instagram professional account.

## The steps

The steps required to receive webhook notifications are as follows:

- **Step 1.** [Create an endpoint](#create-an-endpoint) on your server to receive webhooks from Meta
  - Verify requests from Meta – Occurs in the Meta App Dashboard
  - Accept and validate JSON payloads from Meta – Occurs on your server
- **Step 2.** Subscribe your app to webhook fields – Occurs in the Meta App Dashboard
- **Step 3.** Enable your app user's Instagram professional account to receive notifications via an API call to Meta
- **Step 4.** Test the setup by sending a message to your Instagram professional account.

### Sample app on Github

We provide a
[sample app on GitHub](https://l.facebook.com/l.php?u=https%3A%2F%2Fgithub.com%2Ffbsamples%2Fgraph-api-webhooks-samples&h=AUAa-IJS9i1wgMktrCFjg-kxl7PIxgU-X3LDGvYOFFwB7KV5i6MRZr5XarILSYdVtyrVnHNNWtn8sRBvRyJ9v09DV9ghlpaaBnopLcCsTkEUX-Yp-UYIMF1cF_mWMCBtgjtg3z5XUcpd6L6c)
that deploys on
[Heroku](https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.heroku.com%2F&h=AUD43oKoOSAaTUxRfIQgsDQBiQ6f5SRIF1xMWUwfik-ASLQmXtNeNLKWkI2y4ELvR5ebvPlgvtXElRpuvVwES67zoCMPP7UerHKOlsQ4PGRTOEeAYxHpGI6mUX-XFkJPl8lKWr1kxX3GxdGu)
which you can set up and repurpose, or which you can use to quickly test your Webhooks configuration.

You need the following:

- A free Heroku account,
- Your app's App Secret found on Meta App Dashboard **App settings > Basic**
- A Verify token which is a string. In your Heroku app's settings, set up two config vars: `APP_SECRET` and `TOKEN`. Set `APP_SECRET` to your app's App Secret and `TOKEN` to your password. We will include this string in any verification requests when you configure the Webhooks product in the App Dashboard (the app will validate the request on its own).
- View your Heroku app in a web browser. You should see an empty array (`[]`). This page will display newly received update notification data, so reload it throughout testing.
- Your app's Callback URL will be your Heroku app's URL with `/facebook` added to the end. You will need this Callback URL during product configuration.
- Copy the `TOKEN` value you set above; you'll also need this during product configuration.

#### What's in the Heroku sample app?

The app uses Node.js and these packages:

- `body-parser` (for parsing JSON)
- `express` (for routes)
- `express-x-hub` (for SHA1 support)

## Verifying the Sample App

You can easily verify that your sample app can receive Webhook events.

1. Under the **Webhooks** product in your App Dashboard, click the **Test** button for any of the Webhook fields.
2. A pop-up dialog will appear showing a sample of what will be sent. Click **Send to My Server**.
3. You should now see the Webhook information at the Heroku app's URL, or use `curl https://<your-subdomain>.herokuapp.com` in a terminal window.
