# Audio API - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/content-publishing/audio-api

# Instagram Audio API

The Instagram Audio API allows you to retrieve and search for audio — both original sounds from Instagram Reels and music — and attach them to Reels at creation time. This API is available on the Instagram Platform with Facebook Login.

## Before You Start

You need the following:

- An Instagram Business or Instagram Creator account
- A Facebook Page connected to that account
- A registered Facebook App with the following permissions granted via Facebook Login:
  - `instagram_basic`
  - `instagram_content_publish`
- A valid User access token

### Limitations

- Music availability: This API returns audio that has been authorized for third party use. Note that the available selection may vary from what appears in the native app.
- Platform support: This API is only available on the Instagram API with Facebook Login. It is not supported on the Instagram API with Instagram Login.
- Reel previews: Previewing a Reel with attached audio is not supported. The Reel will be published as configured.
- Filter constraints: When retrieving audio, if no search query is provided, trending audio is returned.
