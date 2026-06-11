# Meta Socials Webhooks & Errors

Subscribe at app level; verify signatures on every POST. Treat (#190) as refresh signal, (#200) as scope/token-type bug, (#368) as stop-retry.

## Webhook Setup Checklist

1. App Dashboard → Webhooks → subscribe `page` (and/or `instagram`) object
2. Fields: `feed`, `messages`, `messaging_postbacks`, `comments` (as needed)
3. `POST /{app-id}/subscriptions` with `callback_url` + `verify_token`
4. Page subscription: `POST /{page-id}/subscribed_apps` with Page token
5. HTTPS callback; respond to verification `hub.challenge` within 20s

## Verification (GET)

```
hub.mode=subscribe & hub.verify_token={YOUR_TOKEN} & hub.challenge={CHALLENGE}
→ respond body = hub.challenge (200, text/plain)
```

## Signature (POST)

```
X-Hub-Signature-256: sha256={hex}
HMAC-SHA256(raw_body, APP_SECRET) → compare timing-safe
```

Reject unsigned or mismatched before parsing JSON.

## Payload Handling

- Batch array — process each `entry` independently
- Dedupe via `entry.id` + `time` + `changes[].value.post_id` (store 24h)
- Return **200** quickly; queue heavy work (Meta retries on non-2xx)
- `instagram` field subscriptions differ from `page` — check `object` key

## Critical Error Codes

| Code | Subcode | Meaning | Fix |
|------|---------|---------|-----|
| **190** | — | Invalid/expired token | Refresh long-lived; re-fetch Page token; check `debug_token` |
| **190** | 463 | Expired | Exchange or re-auth user |
| **190** | 467 | Invalid session | User changed password / revoked app |
| **200** | — | Permission denied | Wrong token type, missing scope, or Advanced Access |
| **200** | 10 | Permission (often Page) | Use Page token not user token |
| **368** | — | Temporarily blocked | Policy/rate abuse — **stop retrying**, fix content pattern |
| **4** | — | App rate limit | Backoff; inspect `X-App-Usage` / `X-Business-Use-Case-Usage` headers |
| **17** | — | User/Page rate limit | Spread calls; cache reads |
| **100** | 33 | Invalid parameter | Wrong id type (User id vs Page id vs IG id) |
| **9007** | — | Media not ready | Poll container to FINISHED before publish |

## Rate Limit Headers

```
X-App-Usage: {"call_count":28,"total_cputime":15,"total_time":20}
X-Business-Use-Case-Usage: {"{business-id}":[{"type":"pages","call_count":10,...}]}
```

Threshold ~100 (app-dependent) → exponential backoff. Batch reads via `?ids=` where possible.

## Retry Policy

| Error | Retry? |
|-------|--------|
| 190 | Refresh token once, then re-auth |
| 200 | No — fix permissions |
| 368 | No — human review |
| 4, 17 | Yes — backoff + jitter |
| 5xx | Yes — limited retries |

## Batch / Debug

```bash
curl -G "https://graph.facebook.com/v21.0/" \
  -d "ids={id1},{id2}" -d "fields=id,name" -d "access_token={TOKEN}"
```

`POST /` batch: max 50 sub-requests; independent failure per entry.

Guides: [`full-docs/graph-api/webhooks.md`](full-docs/graph-api/webhooks.md), [`full-docs/graph-api/guides/error-handling.md`](full-docs/graph-api/guides/error-handling.md) (≤120 lines each).
