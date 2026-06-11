# Overview - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/overview

# Overview

The Instagram Platform is a collection of APIs that allows your app to access data for Instagram professional accounts including both businesses and creators. You can build an app that only serves your Instagram professional account, or you can build an app that servers other Instagram professional accounts that you do not own or manage.

There are two Instagram API configurations you can use in your app:

Instagram API with Facebook Login for Business | Instagram API with Business Login for Instagram || - Your app serves Instagram professional accounts that are linked to a Facebook Page - Your app users use their Facebook credentials to log in to your app | - Your app serves Instagram professional accounts with a presence on Instagram only - Your app users use their Instagram credentials to log in to your app |

Depending on the configuration you choose, your app users will be able to have conversations with their customers or people interested in their Instagram professional account, moderate comments on their media, send private replies, publish content, publish ads, and get insights.

### Which API is right for my app?

Component | [Instagram API setup with Instagram Login](https://developers.facebook.com/docs/instagram/platform/instagram-api) | [Instagram API setup with Facebook Login](instagram-platform/instagram-graph-api.md) || **Access token type** | Instagram User | Facebook User or Page |
| **Authorization type** | [Business Login for Instagram](https://developers.facebook.com/docs/instagram/platform/instagram-api/business-login) | [Facebook Login for Business](https://developers.facebook.com/docs/facebook-login/facebook-login-for-business/) |
| **Comment moderation** |  |  |
| **Content publishing** |  |  |
| **Facebook Page** | x | Required |
| **Hashtag search** | x |  |
| [**Insights**](instagram-platform/instagram-api-with-facebook-login/insights.md) |  |  |
| **Mentions** |  |  |
| **Messaging** |  | [via Messenger Platform](https://developers.facebook.com/docs/messenger-platform/instagram) |
| [**Product tagging**](instagram-platform/instagram-api-with-facebook-login/product-tagging.md) | x |  |
| [**Partnership Ads**](instagram-platform/instagram-api-with-facebook-login/partnership-ads.md) | x |  |
