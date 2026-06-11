# Meta Socials Resource Decision Matrix

**MANDATORY**: Read this entire file when task scope is unclear — before any other reference.

**Rule**: Distilled ref → one full-docs section (≤120 lines). Never bulk-load `full-docs/graph-api/reference/` or endpoint dumps.

## Layer Overview

| Layer | Location | Budget |
|-------|----------|--------|
| Skill body | `SKILL.md` | Full file (~140 lines) — bisect & traps only |
| Distilled refs | `references/*.md` | Full file each (60–75 lines) |
| Full docs | `references/full-docs/` | ≤120 lines per section |

---

## MANDATORY Workflow Triggers

### Auth / token / which login stack?

**READ ENTIRE FILE**: [`auth-matrix.md`](auth-matrix.md)

**Do NOT load**: `publishing-workflows.md`, random `reference/*` endpoint pages

### Permission denied / App Review / scopes

**READ ENTIRE FILE**: [`permissions-matrix.md`](permissions-matrix.md)

**Do NOT load**: full `graph-api/reference/` index — one endpoint section only if matrix insufficient

### Publish post, reel, carousel, schedule

**READ ENTIRE FILE**: [`publishing-workflows.md`](publishing-workflows.md)

**Do NOT load**: `webhooks-errors.md` unless delivery confirmation needed

### Webhooks, (#190)/(#200)/(#368), rate limits

**READ ENTIRE FILE**: [`webhooks-errors.md`](webhooks-errors.md)

**Do NOT load**: `publishing-workflows.md` for pure webhook subscription tasks

---

## Primary Decision Matrix

| If the user wants… | Read first | Then (if needed) | Do NOT load |
|--------------------|------------|------------------|-------------|
| OAuth / token exchange | `auth-matrix.md` | `full-docs/graph-api/get-started.md` (≤120 lines) | All reference pages |
| FB vs IG Login choice | `auth-matrix.md` | `full-docs/instagram-platform/instagram-api-with-facebook-login.md` OR `...-instagram-login.md` (≤120 lines each) | Other login doc |
| Scope list for feature | `permissions-matrix.md` | `full-docs/graph-api/reference/debug_token.md` (≤120 lines) | Entire reference tree |
| Page feed / photo / video | `publishing-workflows.md` | `full-docs/pages-api/posts.md` (≤120 lines) | `instagram-platform/` |
| IG image / reel / carousel | `publishing-workflows.md` | `full-docs/instagram-platform/content-publishing.md` (≤120 lines) | `pages-api/` |
| Webhook subscribe / verify | `webhooks-errors.md` | `full-docs/graph-api/webhooks.md` (≤120 lines) | Publishing refs |
| Error 190 / expired token | `webhooks-errors.md` | `auth-matrix.md` § debug_token | Bulk changelog |
| Error 200 / permission | `permissions-matrix.md` | `auth-matrix.md` § token type | reference index |
| Rate limit / 368 | `webhooks-errors.md` | `full-docs/graph-api/guides/error-handling.md` (≤120 lines) | — |
| API version / breaking change | `SKILL.md` Expert Notes | `full-docs/graph-api/changelog.md` latest block (≤80 lines) | Full changelog |
| Endpoint field list | `SKILL.md` Critical Patterns | **One** `full-docs/.../reference/{node}.md` section (≤120 lines) | Adjacent endpoints |

---

## Distilled Reference Matrix

| File | Lines | When |
|------|-------|------|
| `auth-matrix.md` | ~70 | Hosts, login stack, token ladder |
| `permissions-matrix.md` | ~70 | Scopes, App Review, (#200) |
| `publishing-workflows.md` | ~75 | Page POST, IG container/reels/carousel |
| `webhooks-errors.md` | ~75 | Webhooks, 190/200/368, rate limits |

---

## full-docs Matrix

| Area | Path pattern | Budget |
|------|--------------|--------|
| Graph overview | `graph-api/overview.md`, `get-started.md` | ≤120 lines |
| Error handling | `graph-api/guides/error-handling.md` | Full file OK if small |
| Webhooks | `graph-api/webhooks.md` | ≤120 lines |
| Pages | `pages-api/*.md` | One topic file |
| IG platform | `instagram-platform/*.md` | One topic file |
| Reference endpoints | `graph-api/reference/{node}.md` | **One node**, ≤120 lines |
| Manifest | `full-docs/manifest.md` | Routing only — never bulk-read table |

Policy: [`full-docs/manifest.md`](full-docs/manifest.md)

---

## Conflict Resolution

1. **auth-matrix** wins for host/token-type disputes (`graph.facebook.com` vs `graph.instagram.com`).
2. **permissions-matrix** before expanding OAuth scope requests.
3. **publishing-workflows** for any IG media — container polling is mandatory for video/reels.
4. **webhooks-errors** for retry/stop decisions — never retry (#368).
5. **SKILL.md** for bisect; this matrix for routing.

---

## Routing Flowchart

```
START → scope unclear? → READ THIS FILE
  ├─ Login / token / host ──────────► auth-matrix.md
  ├─ Scope / App Review / #200 ─────► permissions-matrix.md
  ├─ Post / reel / carousel ────────► publishing-workflows.md
  ├─ Webhook / #190 / #368 / limits ► webhooks-errors.md
  ├─ Endpoint fields ───────────────► one full-docs/reference/*.md (≤120 lines)
  └─ Version break ─────────────────► graph-api/changelog.md (≤80 lines)
```
