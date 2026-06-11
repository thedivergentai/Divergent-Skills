---
name: meta-socials
description: >-
  Meta Graph API expert for Facebook Pages and Instagram publishing, auth, webhooks,
  and permissions. MUST use for: (1) Page/IG post or reel publish, (2) OAuth/token
  ladder or FB Login vs IG Login, (3) scope/App Review errors (#200), (4) webhooks
  or token errors (#190/#368), (5) container/reels/carousel state machine. Triggers:
  Graph API, Meta, Facebook Page, Instagram API, instagram_content_publish,
  pages_manage_posts, media_publish, graph.facebook.com, graph.instagram.com,
  rupload.facebook.com. Always open references/RESOURCE-MATRIX.md first when scope
  is unclear — before any other file.
---

# Meta Socials

Facebook Pages + Instagram Platform via Graph API. Two login stacks, three hosts — wrong host or token type causes (#200) that looks like a code bug.

**MANDATORY — read first when scope is unclear**: [`references/RESOURCE-MATRIX.md`](references/RESOURCE-MATRIX.md)

Do not load distilled refs or full-docs until the matrix picks exactly one path.

## Before You Act

1. **Stack** — FB Login (`graph.facebook.com` + Page token) or IG Login (`graph.instagram.com` only)?
2. **Token type** — USER vs PAGE vs System User? IG publish needs Page token (FB path) or IG long-lived token (IG path).
3. **Asset** — Page synchronous POST vs IG container (async — poll before `media_publish`)?
4. **Mode** — Development (testers) vs Live (Advanced Access + App Review per permission)?

## Debug Bisect (API failure)

1. `debug_token` on failing token — `is_valid`, `type`, `scopes`, `expires_at` (see Critical Patterns).
2. Matrix → [`auth-matrix.md`](references/auth-matrix.md) if host/token mismatch suspected.
3. Matrix → [`permissions-matrix.md`](references/permissions-matrix.md) if (#200).
4. Matrix → [`publishing-workflows.md`](references/publishing-workflows.md) if media stuck `IN_PROGRESS` / (#9007).
5. Matrix → [`webhooks-errors.md`](references/webhooks-errors.md) if 368/4/17 or webhook delivery.
6. Still blocked? One § of relevant `full-docs/` (≤120 lines). Never bulk-load reference index.

## Critical Patterns

### debug_token

```bash
curl -G "https://graph.facebook.com/debug_token" \
  -d "input_token={TOKEN}" \
  -d "access_token={APP_ID}|{APP_SECRET}"
```

### Page text post (FB Login)

```bash
curl -X POST "https://graph.facebook.com/v21.0/{page-id}/feed" \
  -d "message=Hello" -d "access_token={PAGE_TOKEN}"
```

### IG image publish (container → publish)

```bash
curl -X POST "https://graph.facebook.com/v21.0/{ig-user-id}/media" \
  -d "image_url=https://cdn.example.com/p.jpg" -d "caption=Cap" \
  -d "access_token={PAGE_TOKEN}"
# creation_id → media_publish (poll video/reels to FINISHED first)
curl -X POST "https://graph.facebook.com/v21.0/{ig-user-id}/media_publish" \
  -d "creation_id={CONTAINER_ID}" -d "access_token={PAGE_TOKEN}"
```

### IG user id from Page

```bash
curl -G "https://graph.facebook.com/v21.0/{page-id}" \
  -d "fields=instagram_business_account" -d "access_token={PAGE_TOKEN}"
```

### Webhook signature check (pseudo)

```python
import hmac, hashlib
expected = "sha256=" + hmac.new(APP_SECRET.encode(), raw_body, hashlib.sha256).hexdigest()
assert hmac.compare_digest(expected, request.headers["X-Hub-Signature-256"])
```

## NEVER

- **NEVER** call `graph.instagram.com` with a Page token from `/me/accounts` — wrong stack; use matrix auth path.
- **NEVER** publish IG video/reels without polling `status_code=FINISHED` — (#9007) or orphan containers.
- **NEVER** use USER token on `/{page-id}/feed` — (#200) subcode 10; exchange for Page token.
- **NEVER** retry on (#368) — policy block; backoff alone makes it worse.
- **NEVER** request deprecated `publish_pages` — use `pages_manage_posts`.
- **NEVER** assume OAuth success = production-ready — Advanced Access + App Review required per permission for Live mode.
- **NEVER** bulk-read `full-docs/graph-api/reference/` — one endpoint section (≤120 lines) only.
- **NEVER** mix FB Login and IG Login tokens in one publish flow — recreate container on correct host.
- **NEVER** skip webhook HMAC verify — unsigned POSTs are spoofable.
- **NEVER** target personal Instagram accounts — Content Publishing requires Business/Creator; personal accounts fail at container create, not OAuth.
- **NEVER** pass `access_token` in webhook callback URLs — leaks in logs/CDN; use app secret for verify only.

## Common Failures → Fix

| Symptom | Fix |
|---------|-----|
| (#190) Invalid OAuth | Refresh long-lived; re-fetch Page token; user re-auth if subcode 467 |
| (#200) Permission | `permissions-matrix.md`; confirm PAGE token + scope + Advanced Access |
| No `instagram_business_account` | Connect IG professional to FB Page — not fixable with more scopes |
| Container `ERROR` | Codec/aspect/duration; public `video_url`; see publishing-workflows |
| Webhook never fires | `/{page-id}/subscribed_apps` + app-level subscription + HTTPS verify |
| Rate limit (#4/#17) | Parse `X-App-Usage`; backoff; batch `?ids=` reads |
| IG Login on facebook.com host | Switch to `graph.instagram.com` per auth-matrix |
| IG quota / `content_publishing_limit` | `GET /{ig-user-id}/content_publishing_limit`; wait for quota reset — not a bug |

## Expert Notes

- **Versions**: Pin `v21.0` (or current); unversioned breaks on Meta's schedule — changelog ≤80 lines only.
- **IDs**: Page id ≠ IG user id ≠ Facebook user id — wrong id → (#100) subcode 33.
- **rupload**: Large Reels/video → `rupload.facebook.com` session before container create.
- **Quota**: IG publishing is rate-limited per account (`content_publishing_limit`) — separate from Graph (#4/#17).
- **Test users**: Development mode tokens die outside app roles — don't debug Live issues in Dev mode.
