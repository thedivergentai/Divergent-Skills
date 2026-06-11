# oEmbed - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/oembed

# Embed an Instagram Post

You can query the Instagram oEmbed endpoint to get an Instagram post’s embed HTML and basic metadata in order to display the post in another website or app. Supports photo, video, Reel, and Feed posts.

Visit the [Instagram Help Center](https://l.facebook.com/l.php?u=https%3A%2F%2Fhelp.instagram.com%2F620154495870484&h=AUBm4YTmYPsXd4Vv1RGV9qGwQldYn9TcXhiJBZWaJffHPFqp0Em46iE-2gkxu0fsCuaaiSRbkTsRHRUfWe-3aVLdmyZCTe0PNVbBjd68UyqM2-X7n_0P5A22sUGaYt2LvKJk1OP074s0rhkh) to learn how to get the embed code from a public Instagram post or profile.

### Common uses

- Embed a post in a blog
- Embed a post in a website
- Render a post in a content management system
- Render a post in a messaging app

## Requirements

#### Base URL

All endpoints can be accessed via the `graph.facebook.com` host.

#### Endpoints

- [`GET /instagram_oembed`](graph-api/reference/instagram-oembed.md)

### Limitations

- The Instagram oEmbed endpoint is **only** meant to be used for embedding Instagram content in websites and apps. It is not to be used for any other purpose. **Using metadata and page, post, or video content (or their derivations) from the endpoint for any purpose other than providing a front-end view of the page, post, or video is strictly prohibited**. This prohibition encompasses consuming, manipulating, extracting, or persisting the metadata and content, including but not limited to deriving information about pages, posts, and videos from the metadata for analytics purposes.
- Posts on private, inactive, and age-restricted Instagram accounts are not supported.
- Accounts that have [disabled **Embeds**](https://l.facebook.com/l.php?u=https%3A%2F%2Fhelp.instagram.com%2F252460186989212%2F&h=AUBR5EJDrND0PVvm3yaJvkgxK8Z_SPBBBl4IkIZewk0jS_e3B-zID0NV3MWAPlyh-y7D-9Pfge8d_zsr8FjrOnJ-SBfME3olCyfEeaRyYRpLD2BX8oL7QwPyIDPytDx5gL3MPqzbto37GaTs) are not supported.
- Stories are not supported.
- Shadow DOM is not supported.

### Rate limits

You can make up to 1,000 requests every hour.
