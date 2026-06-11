# Error Codes - Facebook Pages API

Source: https://developers.facebook.com/docs/pages-api/error-codes

# Facebook Pages API Error Codes

This guide displays common error codes, error messages, and descriptions related to the Facebook Pages API .

Error Codes | Error Message | Description || `1713216` | You can't create a video engagement Custom Audience with video {object\_id} because this video isn't associated with a Facebook Page. | This video must be associated with a Facebook Page to create a [video engagement Custom Audience](marketing-api/reference/custom-audience.md). |
| `200` with subcode `2069030` | This endpoint is not supported. | The endpoint in your call is not supported. |
| `200` with subcode `2069031` | This field is not supported. | The field of the endpoint in your call is not supported. |
| `190` with subcode `2069032` | A Page access token is required for this call. | This endpoint must be called with a [Page access token](pages/npe-reference/npe-endpoints.md#access-tokens--features--permissions--and-tasks). |
| `200` with subcode `2069033` | The corresponding UI feature of this API is deprecated or not available. | The corresponding UI feature of this API is deprecated or not available. Please review the [Graph API Reference](graph-api/reference.md) or the [Overview](pages/npe-reference/npe-endpoints.md) for more information about this endpoint and its fields. |
| `2446158` | This ad objective is not supported. You can create it with a Page instead. | This [ad objective](marketing-api/campaign-structure.md#objectives) is not supported. |
| `1` with subcode `2853006` | Viewer doesn't have permission to perform this action. | You do not have permission to [perform this task](pages/overview/permissions-features.md#tasks). Contact an admin of the Page to request access. |
| `2874008` | Facebook Page insights are only available for Pages with at least 100 Page followers. | [Page insights](graph-api/reference/page/insights.md) are only available for Pages that have at least 100 followers. |
| `2932001` | To access this info, the post needs to be set to public. | [Page insights](platforminsights/page.md) are only available for public posts. |
| `2932003` | You can only get insights on the original post of a shared post but only if you own the original post. You can only boost the original post of a shared post but only if you own the original post. | You can only get insights on the original post, as long as you are the owner, of a [shared post](graph-api/reference/page-post/sharedposts.md). |
| `2932004` | To access this info, you need to be the creator of the post. | To get insights or boost a [shared Page post](graph-api/reference/page-post/sharedposts.md), you must be the owner of the original post and must use the original post to get insights or boost the post. |
| `2932005` | {Name} tagged you in this post. To access this info, you need to be the creator of the post. | To get insights or boost a post in which your [Page was mentioned](pages/mentions.md), you must own the post. |
| `2932006` | This info isn't available for profile pictures. To get insights or boost a post, you can add this photo to a new post. | Insights or boosting a [profile picture](graph-api/reference/page/picture.md) change is not supported. Create a post with the new profile picture to boost and get insights. |
| `2932007` | This info isn't available for cover photos. To get insights or boost a post, you can add this photo to a new post. | Insights or boosting a [cover photo](graph-api/reference/cover-photo.md) change is not supported. Create a post with the new cover photo to boost and get insights. |
| `2932009` | This info isn't available for live videos. | Insights or boosting a [live video](live-video-api/guides/streaming.md) is not supported. |
| `2932010` | This info isn't available right now. | Insights are not available for this post. |
