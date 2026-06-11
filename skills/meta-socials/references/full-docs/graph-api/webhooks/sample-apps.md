# Sample Apps - Webhooks from Meta

Source: https://developers.facebook.com/docs/graph-api/webhooks/sample-apps

# Sample Apps

We provide [sample apps on GitHub](https://l.facebook.com/l.php?u=https%3A%2F%2Fgithub.com%2Ffbsamples%2Fgraph-api-webhooks-samples&h=AUCmcRTjVLHOkX7zOCW1496xvQaAhhWgDJAJIGPRdbnSvr-CCwd7JWKZyzt9wAo-14Nkx1tuSKRG4jNIVvDZKu6bauuaxxg2eaAdDX86CZU0Y-QKit8CghIvmb4uXvTxTLRhzaX96ssB2R8S), which you can set up and repurpose, or which you can use to quickly test your Webhooks configuration.

## Setting up the Sample App

Let's walk through setting up a sample app on [Heroku](https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.heroku.com%2F&h=AUDfwFdJw6cNH4JTnKGn0RtMBosQVXM9fRyGNOAdjur1h_g8e0del0GfVcJc3ZUWOYMq-kYvm21qrY_b-mzaB12viF69JI8rCc_PzKa2VHRARXPYml5rgQqbNl5YFMQh_GbTMyNHkqZCeHbu):

1. Create a free Heroku account if you don't already have one, then sign into it.
2. While signed in, go to [GitHub](https://l.facebook.com/l.php?u=https%3A%2F%2Fgithub.com%2Ffbsamples%2Fgraph-api-webhooks-samples%2Ftree%2Fmaster%2Fheroku&h=AUD3BdbGsTUkZAHA3JDZF1k9EpX7EOzPxmmu0Bemn0PEN2eDYgjLBksdDs1DoJjnqkhe0ZVY-W7V8To3TaIP9_I1y0MVXFNxCzsllXw7W97llD-L2cf6-Ock231M8pL1SWFcaQmDLFs2GrI_) and deploy the app to Heroku. The app name you choose will be a part of your Callback URL, so choose something you can remember. Deploying will take a few seconds.
3. In a new browser tab, go to your app's [App Dashboard](/apps) Settings, and copy your app's App Secret.
4. In your Heroku app's settings, set up two config vars: `APP_SECRET` and `TOKEN`. Assign (paste) your App Secret to the `APP_SECRET` config var, and assign any string to `TOKEN`. We will include this string in any verification requests when you configure the Webhooks product in the App Dashboard (the app will validate the request on its own).

Your app should now be ready to go. Before you return to your App Dashboard to [configure the Webhooks product](graph-api/webhooks/getting-started.md#configure-webhooks-product):

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
