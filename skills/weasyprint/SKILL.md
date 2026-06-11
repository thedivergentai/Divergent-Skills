---
name: weasyprint
description: >-
  WeasyPrint HTML/CSS-to-PDF expert skill (Kozea/CourtBouillon). CLI, Python API,
  @page paged media, PDF/A/UA/X, Factur-X, URL fetchers, FontConfiguration, server
  security. MUST use for: (1) untrusted HTML on servers, (2) PDF/A or PDF/UA,
  (3) Factur-X/ZUGFeRD, (4) print-pagination CSS. Triggers: WeasyPrint, HTML-to-PDF,
  invoices, reports, @page, footnotes, CourtBouillon. Always open
  references/resource-matrix.md first when scope is unclear — before any other file.
---

# WeasyPrint

Pagination-first CSS engine (Python + Pango). Not headless Chrome: **no JS, no RTL/bidi, print media default**.

**MANDATORY — read first when scope is unclear**: [`references/resource-matrix.md`](references/resource-matrix.md)

Load **one** flat expert lesson from `references/` root (e.g. `security-untrusted-html.md`, `css-paged-media.md`). Do not open `full-docs/` unless the matrix sends you there as last resort.

## Before You Act

1. **Trust** — Untrusted HTML/CSS? → `security-untrusted-html.md` + `security-url-fetcher.md` (before code).
2. **Runtime** — CLI one-off (`cli-basics.md`), batch, or embedded Python (`python-instantiation.md`)?
3. **Output** — Plain PDF, PDF/A/UA/X (`pdf-*.md`), Factur-X, fillable forms?
4. **Wrong tool?** — JS layout, RTL, live DOM, pixel-perfect screen CSS → Puppeteer, not WeasyPrint.

## Debug Bisect (wrong output)

1. [`debug-pipeline.md`](references/debug-pipeline.md) — enable logging; unsupported CSS fails silently by default.
2. [`css-browser-vs-print.md`](references/css-browser-vs-print.md) — print vs browser gaps?
3. Closest sample from [`resource-matrix.md`](references/resource-matrix.md) Examples catalog — ≤120 lines of relevant `.css`.
4. Still blocked? One matching flat lesson from the matrix. **`full-docs/` only as last resort** (≤120 lines/§).

## NEVER

- **NEVER** use positional string HTML or omit `base_url` on `HTML(string=...)` — see `python-instantiation.md`.
- **NEVER** enable `presentational_hints` on untrusted HTML — CVE-2026-49452; see `security-untrusted-html.md`.
- **NEVER** expose untrusted HTML without process limits + fetcher blocking `file://`.
- **NEVER** set page size via imagined CLI flags — only `@page` or `-s`; see `cli-basics.md`.
- **NEVER** assume PDF/A validity without `image-rendering: crisp-edges` + user-side validation — see `pdf-a-archival.md`.
- **NEVER** expect `:hover`, `:focus`, `:visited` to match; **NEVER** rely on RTL/bidi — see `css-browser-vs-print.md`.
- **NEVER** use `zoom != 1` casually — scales all units including `cm` and `A4`.
- **NEVER** bulk-load `full-docs/` or example `.pdf` files.
- **NEVER** load `full-docs/contribute.md` or `full-docs/support.md`.

## Common Failures → Fix

| Symptom | Lesson |
|---------|--------|
| `cannot load library 'pango...'` | `install-windows.md` or `install-macos.md` + `install-troubleshooting.md` |
| Tofu / blank text | `css-fonts.md` |
| Broken relative assets | `python-instantiation.md` (`base_url=`) |
| Styles ≠ browser | `css-browser-vs-print.md` |
| Auth assets 404 | `web-flask-django.md` |
| PDF/A rejected | `pdf-a-archival.md` |
| SSRF / file read | `security-url-fetcher.md` |
| Slow batch renders | `web-performance.md` |

## Platform Quick Pointers

| Platform | Start here |
|----------|------------|
| Linux | `install-linux.md` |
| Windows | `install-windows.md` |
| macOS | `install-macos.md` |
| Any install failure | `install-troubleshooting.md` |

## Expert Notes

- **Versions**: major bumps change **rendering** — see `debug-version-upgrades.md`; visual diff PDFs on upgrade.
- **Performance**: cascade cost ∝ selectors × elements; multi-page tables are slow — see `web-performance.md`.
- **Defaults**: `presentational_hints=False`; `finisher(document, pdf)` hooks pydyf before trailer.
