# Insights - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-graph-api/reference/ig-media/insights

# Instagram Media Insights

Represents social interaction metrics on your app user's Instagram Media object.

Instagram Insights are now available for Instagram API with Instagram Login. [Learn more.](instagram-platform/insights.md)

Introducing the `views` metric for [`FEED`, `STORY`, and `REELS` media product types](instagram-platform/reference/instagram-media.md#fields).

The following metrics have been deprecated for v22.0 and will be deprecated for all versions on April 21, 2025:

- `plays`
- `clips_replays_count`
- `ig_reels_aggregated_all_plays_count`
- `impressions`

**Note:** API requests with the `impressions` metric will continue to return data for media created on or before July 1, 2024 for v21.0 and older. API requests made after April 21, 2025 for media created on or after July 2, 2024 will return an error.

The `video_views` metric has been deprecated.

Visit the [Instagram Platform Changelog](instagram-platform/changelog.md) for more information.
