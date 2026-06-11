# Meta Socials Publishing Workflows

Pages = direct POST. Instagram = **container state machine** (async processing). Never skip status polling on video/reels.

## Facebook Page Feed (synchronous)

```bash
# Text / link
curl -X POST "https://graph.facebook.com/v21.0/{page-id}/feed" \
  -d "message=Hello" -d "link=https://example.com" -d "access_token={PAGE_TOKEN}"

# Photo
curl -X POST "https://graph.facebook.com/v21.0/{page-id}/photos" \
  -F "source=@image.jpg" -F "caption=Caption" -F "access_token={PAGE_TOKEN}"
```

Scheduled: `published=false` + `scheduled_publish_time` (unix). Video: `/{page-id}/videos` or resumable upload for large files.

## Instagram Container State Machine

```
CREATE container → (poll status_code) → media_publish → published media id
```

### Image (single)

```bash
# 1. Create
curl -X POST "https://graph.facebook.com/v21.0/{ig-user-id}/media" \
  -d "image_url=https://cdn.example.com/photo.jpg" \
  -d "caption=Caption" -d "access_token={TOKEN}"
# → { "id": "<IG_CONTAINER_ID>" }

# 2. Publish (images often skip polling; video/reels require it)
curl -X POST "https://graph.facebook.com/v21.0/{ig-user-id}/media_publish" \
  -d "creation_id=<IG_CONTAINER_ID>" -d "access_token={TOKEN}"
```

### Video / Reels

```bash
# 1. Resumable upload session (rupload.facebook.com) OR video_url for small hosted file
# 2. Create REELS container
curl -X POST ".../{ig-user-id}/media" \
  -d "media_type=REELS" -d "video_url=..." -d "access_token={TOKEN}"

# 3. Poll until status_code=FINISHED
curl -G ".../{container-id}" -d "fields=status_code,status" -d "access_token={TOKEN}"
# IN_PROGRESS → wait (exponential backoff, cap ~5 min)
# ERROR → read status field; do not publish
# FINISHED → media_publish
```

### Carousel

Child containers (`is_carousel_item=true`) → parent `media_type=CAROUSEL` + `children` ids → poll if video child → `media_publish`. Max 10 items.

## Status Codes (containers)

| status_code | Action |
|-------------|--------|
| `IN_PROGRESS` | Poll again (2^n seconds, max 60s interval) |
| `FINISHED` | Call `media_publish` |
| `ERROR` | Log `status`; fix asset spec (codec, aspect, duration) |
| `EXPIRED` | Container TTL exceeded; recreate |

## Host Note (IG Login)

Same state machine on `graph.instagram.com/{ig-user-id}/media` with IG Login token — do not mix with Page token mid-flow.

## Publishing Quota

```bash
curl -G "https://graph.facebook.com/v21.0/{ig-user-id}/content_publishing_limit" \
  -d "fields=quota_usage,config" -d "access_token={TOKEN}"
```

Quota exhaustion mimics random API failures — check before debugging container logic.

## Reels Traps

H.264+AAC, 9:16 aspect, publicly fetchable `video_url` — else container `ERROR`. Publish before `FINISHED` → (#9007).

Detail: `full-docs/instagram-platform/content-publishing.md` (≤120 lines).
