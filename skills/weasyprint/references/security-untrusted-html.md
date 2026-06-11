# Untrusted HTML: Attack Surface & Hardening

Use when WeasyPrint renders HTML or CSS from users, templates you do not fully control, or any server-side conversion pipeline.

## Mental Model

WeasyPrint on untrusted input is a **network-capable document renderer inside your trust boundary**. It parses HTML/CSS, may fetch remote resources, reads local files via `file://`, and runs layout with no built-in time or memory caps. Treat it like running a headless browser worker — not a pure string-to-PDF function.

## Attack Surface

| Vector | Mechanism | Default exposure |
|--------|-----------|------------------|
| Long render | Crafted HTML/CSS → high CPU/memory | No timeout on layout |
| Infinite loop | Bug-triggering CSS/HTML | No guard |
| Huge values | Absurd `font-size`, `@page size` | No limits; `%`/`em` bypass pre-scan |
| Network SSRF | `url()` in CSS, `<img src>`, `@import` | HTTP 10s timeout; **no limit on `file://`** |
| Local file read | `file://`, `/dev/urandom` | Embeds in PDF or hangs |
| Info leak | `@font-face` probes installed fonts; timing on HTTPS | Always |
| CSS injection | `presentational_hints` + legacy HTML attrs | **CVE-2026-49452** |

SVG images inherit the same URL-fetcher and SSRF risks as HTML.

## presentational_hints (CVE-2026-49452)

WeasyPrint ≥69 restricts `--presentational-hints` / `presentational_hints=True` when rendering untrusted HTML with restricted CSS. Legacy attributes (`bgcolor`, `width`, `align`, etc.) are translated into CSS and become an **injection surface** when combined with a restricted stylesheet.

**Rules:**

- Keep `presentational_hints=False` (default) on any user-supplied HTML.
- Safe use: **trusted** legacy templates only, after confirming the HTML source is not attacker-controlled.
- Upgrade to ≥69.0 immediately if you ever enabled presentational hints on mixed-trust content.

## Process Limits (Required)

WeasyPrint has no internal render timeout. Small documents can still trigger pathological layout — **limiting HTML size alone does not help**.

| Layer | Examples |
|-------|----------|
| App server | uWSGI `harakiri`, `evil-reload-on-as` |
| OS | `ulimit` memory, dedicated non-root user |
| Container | cgroup memory cap, CPU quota |
| Watchdog | External script kills stuck workers |

Pair process limits with input sanitization (truncate HTML, strip external URLs when not needed).

## What Does NOT Help Alone

- Scanning CSS for large pixel values — relative units (`em`, `%`) expand after cascade.
- Assuming "small template = safe" — a few kilobytes can still exhaust memory.

## Minimum Checklist

1. Process limits (above).
2. Custom URL fetcher — see [`security-url-fetcher.md`](security-url-fetcher.md).
3. `presentational_hints=False` on untrusted input.
4. Configure logging; raise `FatalURLFetchingError` for missing stylesheets in production.
5. Non-root service account with minimal filesystem access.

---
## Further research

Official stable documentation: [Security](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#security), [Changelog 69.0](https://doc.courtbouillon.org/weasyprint/stable/changelog.html)
