# Meta Socials Permissions Matrix

Minimum scopes per task. Request **least** scope; Advanced Access requires App Review + screencast per permission.

## Task → Minimum Permissions

### Facebook Page (graph.facebook.com)

| Task | Permissions | Notes |
|------|-------------|-------|
| Read Page profile | `pages_show_list` + `pages_read_engagement` | Page token from `/me/accounts` |
| Publish text/link post | `pages_manage_posts` | `POST /{page-id}/feed` |
| Publish photo | `pages_manage_posts` | `POST /{page-id}/photos` |
| Publish video | `pages_manage_posts` | `POST /{page-id}/videos` or resumable |
| Read comments | `pages_read_engagement` | `GET /{post-id}/comments` |
| Reply to comment | `pages_manage_engagement` | `POST /{comment-id}/comments` |
| Page messaging | `pages_messaging` | Messenger Platform |
| Page insights | `read_insights` | Page-level metrics |

### Instagram via Facebook Login (graph.facebook.com)

| Task | Permissions | Notes |
|------|-------------|-------|
| Read IG profile/media | `instagram_basic` | IG user id via Page's `instagram_business_account` |
| Publish photo/video/reel | `instagram_content_publish` | Container → `media_publish` |
| Read comments | `instagram_basic` | On media objects |
| Reply/hide comments | `instagram_manage_comments` | Moderation |
| IG insights | `instagram_manage_insights` | Media/user metrics |
| IG DMs | `instagram_manage_messages` | Messaging API |

### Instagram Login (graph.instagram.com)

| Task | Permissions | Notes |
|------|-------------|-------|
| Read profile/media | `instagram_business_basic` | Host is `graph.instagram.com` |
| Publish content | `instagram_business_content_publish` | Same container flow, different host |
| Manage comments | `instagram_business_manage_comments` | |
| Insights | `instagram_business_manage_insights` | |
| Messaging | `instagram_business_manage_messages` | |

## Prerequisite Graph (FB Login + IG publish)

```
User grants scopes → Page token → Page has instagram_business_account
→ IG user id → container endpoints on graph.facebook.com
```

Missing link: Creator account not connected to Page → no `instagram_business_account` field (not a scope issue).

## Permission Debugging

1. `debug_token` → list `scopes` / `granular_scopes`
2. Confirm token **type** is `PAGE` for Page publish (not USER)
3. `GET /{page-id}/permissions` — declined vs granted per user
4. App Dashboard → App Review → permission status (Standard vs Advanced)

## Standard vs Advanced Access

| Access | Who | Production |
|--------|-----|------------|
| Standard | App role holders | Dev/test only |
| Advanced | App Review approved | Any user authorizing app |

Requesting `instagram_content_publish` without approval → OAuth succeeds for testers, fails for public users with (#200).

## Scope Anti-Patterns

| Requested | Problem |
|-----------|---------|
| `publish_pages` (deprecated) | Use `pages_manage_posts` |
| All `instagram_*` + all `pages_*` | Review rejection; split apps if needed |
| User token + `pages_manage_posts` | Need Page token, not user token |

Endpoint-level permission tables: one section of [`full-docs/graph-api/reference/page.md`](full-docs/graph-api/reference/page.md) or [`full-docs/instagram-platform/reference.md`](full-docs/instagram-platform/reference.md) (≤120 lines each).
