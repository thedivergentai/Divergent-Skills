# Private Replies - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/private-replies

# Send a Private Reply to a Commenter

This documents shows you how to programmatically send a private reply to a person who commented on your app user's Instagram professional post, reel, story, Live, or ad post.

## How It Works

Step 1. An Instagram user comments on your app user's Instagram professional post, reel, story, Live, or ad post.

Step 2. A webhook event is triggered and Meta sends your server a notification with information about the comment including:

|  |  |
| --- | --- |
| - Your app user's Instagram professional account ID - The commenter's Instagram-scoped ID and username - The comment's ID - The media's ID, if the commenter included media in their comment - The text of the comment, if applicable   Step 3. Your app uses the comment's ID to send a private response directly to the Instagram user. This reply appears in the person's **Inbox**, if the person follows the Instagram professional account, or to the **Request** folder, if they do not. |  |

Step 4. Your app can send this private reply within 7 days of the creation time of the comment, excepting Instagram Live, where replies can only be sent during the live broadcast. The private reply message includes a link to the commented post.
