# URL Fetcher Hardening

Use when WeasyPrint fetches images, fonts, stylesheets, or SVG resources — especially on servers with untrusted HTML/CSS.

## Default Behavior

The built-in fetcher opens `file://` and HTTP(S) URLs. Features **not** included:

- Cookies or session auth
- Per-request credential injection from the end user's browser

WeasyPrint on the server does **not** send user browser cookies. Use Flask-WeasyPrint / Django-WeasyPrint, or a custom fetcher that injects `Authorization` / session headers from your request context.

## HTTP Defaults

| Setting | Value |
|---------|-------|
| Timeout | **10 seconds** (HTTP, HTTPS, FTP only) |
| Redirects | Followed by default; CLI `--no-http-redirects` to disable |
| Redirect loops | Detected early (≥69.0) |
| `file://` timeout | **None** — can hang on `/dev/urandom` |
| Cookies / auth | **Not supported** — custom fetcher required |

CVE-2025-68616 (68.0): HTTP redirects must always pass through the URL fetcher. Upgrade if you wrap `default_url_fetcher` in custom code — migrate to the `URLFetcher` class (68.0+).

## SSRF Risk

Any `url()` in CSS, `<img src>`, `@import`, `@font-face`, or inline SVG triggers a fetch. Attackers probe internal networks (`http://169.254.169.254/`), scan open ports, or exfiltrate response timing.

Mitigations:

- Allowlist protocols (`https`, `data` only for strictest posture).
- Block or sandbox `file://` unless explicitly required.
- Resolve and reject private/link-local IP ranges in custom fetchers.
- Apply the same process limits as layout — slow HTTP counts as DoS.

## SafeFetcher Pattern

```python
from weasyprint import HTML
from weasyprint.urls import URLFetcher, FatalURLFetchingError

class SafeFetcher(URLFetcher):
    ALLOWED = ("https", "data")

    def fetch(self, url, headers=None):
        if not url.startswith(tuple(f"{p}:" for p in self.ALLOWED)):
            raise FatalURLFetchingError(f"Blocked URL: {url}")
        return super().fetch(url, headers)

HTML(string=html, url_fetcher=SafeFetcher()).write_pdf("out.pdf")
```

CLI coarse filter: `--allowed-protocols https,data`

For path-restricted `file://` access, validate resolved paths stay under an allowed directory before calling `super().fetch()`.

## Fatal vs Silent Errors

By default, fetch errors emit a **warning** and rendering continues. For production with untrusted input, raise `FatalURLFetchingError` on blocked protocols or missing critical stylesheets so failures are not silent.

## Cookies Gap (Web Apps)

Protected assets behind login fail unless your fetcher adds credentials:

```python
def fetch(self, url, headers=None):
    headers = dict(headers or {})
    headers["Authorization"] = f"Bearer {get_current_token()}"
    return super().fetch(url, headers=headers)
```

Map static/media to filesystem paths (Flask-WeasyPrint pattern) when assets are local.

## Further research

- [URL Fetchers (First Steps)](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#url-fetchers)
- [Security — Infinite Requests & Local Files](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#infinite-requests)
- [Changelog — 68.0 URL fetcher refactor](https://doc.courtbouillon.org/weasyprint/stable/changelog.html)
