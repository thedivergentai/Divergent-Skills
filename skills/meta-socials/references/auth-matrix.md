# Meta Socials Auth Matrix

Two login stacks, three API hosts. Pick one stack per product — mixing hosts on one request breaks auth.

## Login Stack Decision

| Stack | Host | IG account type | When to use |
|-------|------|-----------------|-------------|
| **Facebook Login** | `graph.facebook.com` | IG Business/Creator linked to FB Page | Page posting, IG via Page token, webhooks on Page |
| **Instagram Login** | `graph.instagram.com` | IG professional (no FB Page required) | Standalone IG apps, creator tools, IG-only scopes |

**Rule**: IG-with-FB-Login never calls `graph.instagram.com`. IG Login never uses Page tokens from `/me/accounts`.

## API Hosts

| Host | Protocol | Used for |
|------|----------|----------|
| `graph.facebook.com` | Graph API v21+ | Users, Pages, IG user via Page, debug_token, OAuth exchange |
| `graph.instagram.com` | Instagram Graph subset | IG Login user/media/messaging endpoints only |
| `rupload.facebook.com` | Resumable upload | Large video/Reels binary upload (`ig`-prefixed upload sessions) |

Version prefix: `https://graph.facebook.com/v21.0/...` — pin version in prod; `unversioned` tracks latest breaking changes.

## Token Ladder (FB Login path)

```
1. Short-lived user token     OAuth redirect / JS SDK
2. Long-lived user token      GET /oauth/access_token?grant_type=fb_exchange_token
3. Page access token          GET /me/accounts?fields=id,name,access_token
4. IG user id (via Page)      GET /{page-id}?fields=instagram_business_account
5. Publish as Page/IG         Use Page token on graph.facebook.com
```

**System User** (Business Manager): server-to-server; generate token in BM → assign assets → never embed in client. Refresh via BM, not user OAuth.

## Token Ladder (IG Login path)

```
1. Authorization code         instagram.com/oauth/authorize
2. Short-lived IG token       POST graph.instagram.com/oauth/access_token
3. Long-lived IG token        GET graph.instagram.com/refresh_access_token
4. API calls                  Bearer on graph.instagram.com only
```

IG Login tokens **cannot** access Page endpoints or `graph.facebook.com` IG nodes.

## debug_token (always on failure)

```bash
curl -G "https://graph.facebook.com/debug_token" \
  -d "input_token={TOKEN}" \
  -d "access_token={APP_ID}|{APP_SECRET}"
```

Check: `is_valid`, `expires_at`, `scopes`, `granular_scopes`, `type` (`USER`/`PAGE`), `profile_id` (Page id for Page tokens).

## App Modes

| Mode | Tokens | Review |
|------|--------|--------|
| Development | App admins/testers only | No App Review for listed testers |
| Live | Any authorized user | Advanced Access + App Review per permission |

Expired tester grants → error **190** even when code is correct.

## Common Auth Mistakes

| Mistake | Symptom |
|---------|---------|
| User token on `/{page-id}/feed` | (#200) permission |
| Page token on `graph.instagram.com` | Invalid OAuth |
| IG Login token on `/{ig-user-id}/media` via facebook.com | Wrong host |
| Unexchanged short-lived token in cron | 190 after ~1–2 h |

Full OAuth fields: [`full-docs/graph-api/get-started.md`](full-docs/graph-api/get-started.md) (≤120 lines). IG Login: [`full-docs/instagram-platform/instagram-api-with-instagram-login.md`](full-docs/instagram-platform/instagram-api-with-instagram-login.md) (≤120 lines).
