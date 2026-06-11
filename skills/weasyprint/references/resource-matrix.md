# WeasyPrint Resource Matrix

**MANDATORY**: Read this entire file when task scope is unclear — before any other reference.

**Rule**: One flat expert lesson at `references/` root → CourtBouillon example (≤120 lines CSS) → `full-docs/` **last resort only** (≤120 lines/§). Never bulk-load.

## Layer Overview

| Layer | Location | Budget |
|-------|----------|--------|
| Skill body | `SKILL.md` | Full file — traps & bisect only |
| Router/catalog | `resource-matrix.md` | Full file (this file) |
| Expert lessons | `references/*.md` (flat root) | **One file per task** |
| Examples | `examples/` | `.html` + targeted `.css` sections |
| Archive | `full-docs/` | Last resort, ≤120 lines/§ |

---

## Expert Lesson Catalog

All lessons live at `references/` root — no subfolders. Load **one** file matching the task.

### Getting started

| File | When to load |
|------|--------------|
| [`cli-basics.md`](cli-basics.md) | CLI one-off, shell/CI, `@page` via `-s` |
| [`python-instantiation.md`](python-instantiation.md) | Python API, `HTML(string=...)`, `base_url`, fonts |
| [`rendering-page-subsets.md`](rendering-page-subsets.md) | `render()`, page subsets, `write_pdf` options |

### Installation

| File | When to load |
|------|--------------|
| [`install-linux.md`](install-linux.md) | Debian/Ubuntu/Fedora/Alpine/Arch |
| [`install-macos.md`](install-macos.md) | Homebrew, `DYLD_FALLBACK_LIBRARY_PATH` |
| [`install-windows.md`](install-windows.md) | MSYS2, `WEASYPRINT_DLL_DIRECTORIES`, exe |
| [`install-troubleshooting.md`](install-troubleshooting.md) | Missing Pango/DLL, fonts, version pins |

### Security

| File | When to load |
|------|--------------|
| [`security-untrusted-html.md`](security-untrusted-html.md) | Untrusted HTML/CSS on a server |
| [`security-url-fetcher.md`](security-url-fetcher.md) | SSRF, `file://`, cookies, custom fetcher |

### CSS & layout

| File | When to load |
|------|--------------|
| [`css-browser-vs-print.md`](css-browser-vs-print.md) | CSS works in browser, not in PDF |
| [`css-paged-media.md`](css-paged-media.md) | `@page`, named pages, margin boxes |
| [`css-toc-headers.md`](css-toc-headers.md) | TOC, running headers, `target-counter` |
| [`css-flexbox-grid.md`](css-flexbox-grid.md) | Flexbox/Grid layout gaps |
| [`css-fonts.md`](css-fonts.md) | `@font-face`, tofu, FontConfiguration |

### PDF variants

| File | When to load |
|------|--------------|
| [`pdf-a-archival.md`](pdf-a-archival.md) | PDF/A archival compliance |
| [`pdf-ua-accessibility.md`](pdf-ua-accessibility.md) | PDF/UA, tags, accessibility |
| [`pdf-x-print.md`](pdf-x-print.md) | PDF/X, CMYK, print exchange |
| [`pdf-factur-x.md`](pdf-factur-x.md) | Factur-X / ZUGFeRD e-invoice |
| [`pdf-forms-metadata.md`](pdf-forms-metadata.md) | Forms, XMP, attachments, cache |

### Web applications

| File | When to load |
|------|--------------|
| [`web-flask-django.md`](web-flask-django.md) | Flask/Django, auth, SSL, static files |
| [`web-performance.md`](web-performance.md) | Batch render, cache, workers, image opt |

### Debugging

| File | When to load |
|------|--------------|
| [`debug-pipeline.md`](debug-pipeline.md) | Wrong output, logging, pipeline bisect |
| [`debug-version-upgrades.md`](debug-version-upgrades.md) | Version regression, upgrade visual diff |

---

## MANDATORY Workflow Triggers

### Untrusted HTML on a server

**READ**: [`security-untrusted-html.md`](security-untrusted-html.md) then [`security-url-fetcher.md`](security-url-fetcher.md)

**Do NOT load**: `examples/`, `full-docs/` (until API signature needed)

### Install / DLL / missing Pango

**READ**: platform file (`install-linux.md` / `install-macos.md` / `install-windows.md`) + [`install-troubleshooting.md`](install-troubleshooting.md)

### CSS works in browser, not in PDF

**READ**: [`css-browser-vs-print.md`](css-browser-vs-print.md) → [`css-paged-media.md`](css-paged-media.md) or [`css-flexbox-grid.md`](css-flexbox-grid.md) as needed

### PDF/A, PDF/UA, PDF/X, or Factur-X

**READ**: matching `pdf-*.md` lesson for the variant

### Flask, Django, cookies, self-signed SSL

**READ**: [`web-flask-django.md`](web-flask-django.md)

### Building from a layout pattern

**READ**: [`examples/index.md`](examples/index.md) → sample `.html` + ≤120 lines of `.css` + matching css lesson if stuck

---

## Primary Decision Matrix

| If the user wants… | Read first | Then (if needed) | Do NOT load |
|--------------------|------------|------------------|-------------|
| Untrusted HTML | `security-untrusted-html.md` | `security-url-fetcher.md` | `examples/` |
| Install / DLL | `install-*` + `install-troubleshooting.md` | — | `full-docs/changelog.md` |
| CSS ≠ browser | `css-browser-vs-print.md` | `css-paged-media.md` or `css-flexbox-grid.md` | Full `full-docs/` |
| PDF/A | `pdf-a-archival.md` | `examples/invoice/` if layout | — |
| PDF/UA | `pdf-ua-accessibility.md` | — | — |
| PDF/X | `pdf-x-print.md` | — | — |
| Factur-X | `pdf-factur-x.md` | `pdf-forms-metadata.md` | — |
| Flask/Django/auth | `web-flask-django.md` | `web-performance.md` | — |
| CLI one-off | `cli-basics.md` | — | — |
| Python API | `python-instantiation.md` | `rendering-page-subsets.md` | — |
| Report + TOC + headers | `examples/index.md` → `report/` | `css-toc-headers.md` | `full-docs/` |
| Book / chapters | `examples/index.md` → `book/` | `css-paged-media.md` | — |
| Invoice / receipt | `examples/index.md` → `invoice/` | `pdf-a-archival.md` if PDF/A | — |
| Poster / flyer | `examples/index.md` → `poster/` | `css-paged-media.md` | — |
| Ticket / label | `examples/index.md` → `ticket/` | — | — |
| Letterhead | `examples/index.md` → `letter/` | `css-fonts.md` | — |
| Version regression | `debug-version-upgrades.md` | — | Full changelog |
| Pipeline debug | `debug-pipeline.md` | — | Bulk `full-docs/` |

---

## Examples Matrix

| Sample | Techniques | Pair with |
|--------|------------|-----------|
| `report/` | `@page`, `string-set`, TOC `target-*`, columns | `css-toc-headers.md` |
| `book/` | Named pages, L/R footers | `css-paged-media.md` |
| `invoice/` | Invoice table, `@page` footers | `pdf-a-archival.md` if archival |
| `poster/` | Custom page size, `-s` stylesheet swap | `css-paged-media.md` |
| `ticket/` | Fixed landscape ticket | `css-paged-media.md` |
| `letter/` | Letterhead, zero margin | `css-fonts.md` |

Detail: [`examples/index.md`](examples/index.md). **No `.pdf` in repo** — generate with `printall.sh`.

---

## full-docs (archive — last resort)

Use only when a flat lesson + example is insufficient. One section, ≤120 lines.

| File | Use when |
|------|----------|
| `api_reference.md` | Exact Python parameter not covered in lessons |
| `manpage.md` | Obscure CLI flag |
| `first_steps.md` | Install edge case not in `install-*` lessons |
| `common_use_cases.md` | Niche workflow not in `pdf-*` / `web-*` lessons |
| `going_further.md` | Deep pipeline internals beyond `debug-pipeline.md` |
| `changelog.md` | History beyond `debug-version-upgrades.md` |
| `contribute.md`, `support.md` | **Never** |

Policy: [`full-docs/manifest.md`](full-docs/manifest.md)

---

## Conflict Resolution

1. **Security wins** — `security-*` before all other lessons for untrusted input.
2. **Flat lessons** before examples; examples before `full-docs/`.
3. **`css-browser-vs-print.md`** before Puppeteer fallback.
4. **`SKILL.md`** for traps/bisect; this matrix for routing.

---

## Routing Flowchart

```
START → scope unclear? → READ THIS FILE
  ├─ Untrusted HTML ──────► security-untrusted-html.md → security-url-fetcher.md
  ├─ Install / DLL ───────► install-{platform}.md → install-troubleshooting.md
  ├─ Document type ───────► examples/index.md → sample + css-* lesson
  ├─ PDF variant ─────────► pdf-*.md
  ├─ Web app / auth ──────► web-flask-django.md
  ├─ CSS ≠ browser ───────► css-browser-vs-print.md
  ├─ CLI / Python API ────► cli-basics.md / python-instantiation.md
  ├─ Debug / upgrade ─────► debug-pipeline.md / debug-version-upgrades.md
  └─ Still blocked ───────► full-docs/ one § only (last resort)
```
