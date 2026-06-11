# Debug: Version Upgrades & Visual Regression

Use when upgrading WeasyPrint changes PDF appearance, breaks custom fetchers, or triggers security advisories.

## Upgrade Priority (Recent Security)

| Version | CVE | Action |
|---------|-----|--------|
| **69.0** (2026-06-02) | CVE-2026-49452 | Upgrade if `--presentational-hints` / `presentational_hints=True` on untrusted HTML |
| **68.0** (2026-01-19) | CVE-2025-68616 | Upgrade if custom code wraps `default_url_fetcher` or uses `allowed_protocols` on it |

Both are security releases — treat lagging versions as active risk on server deployments.

## 69.0 — Breaking & Notable Changes

**Security:** presentational hints no longer inject CSS on untrusted HTML with restricted stylesheets.

**API migrations:**

- `--srgb` → `--output-intent=srgb` (also `device-cmyk`, `@color-profile` identifiers)
- `srgb` boolean in default options → `output_intent` string

**Features that may shift layout:**

- Logical properties support
- Viewport units (`vw`, `vh`, etc.)
- SVG transform angle units
- Redirect-loop detection in URL fetcher (fewer hung fetches)

**Bug fixes worth retesting:** grid endless loops, flex overflow clipping, RTL auto-width alignment, table break retry after padding overflow, `calc()` in logical properties.

## 68.1 — Patch Release (2026-02-06)

Focused bug fixes — retest if you hit:

- SVG clip paths outside `<defs>`
- Transparency with Acrobat / Edge
- `calc()` on many properties
- URL scheme pattern detection
- `URLFetcherResponse` compatibility with `addinfourl`

## 68.0 — URL Fetcher Refactor

**Migrate:** `default_url_fetcher()` → `URLFetcher` class. Custom fetchers that delegated to the old function must call `super().fetch()` on the class instead.

**Security:** HTTP redirects always route through the fetcher (SSRF hardening).

**Other:** `DocumentMetadata.generate_rdf_metadata` is now an overridable method, not a constructor parameter (Factur-X workflows).

## Visual Diff Guidance

WeasyPrint is not pixel-stable across versions — Pango, fontconfig, and layout fixes change metrics.

**Before upgrading production:**

1. Pin old and new versions in separate venvs or containers.
2. Render a **golden set** of representative PDFs (invoices, tables, multi-page, SVG, custom fonts).
3. Diff with a visual tool (ImageMagick `compare`, diff-pdf, or PDF rasterize + perceptual hash) — not raw byte comparison.
4. Triage diffs:
   - **Intentional** (bug fix, security) — update golden files.
   - **Font drift** — embed fonts via `@font-face` + `FontConfiguration`; disable fontconfig surprises.
   - **Layout shift** — check changelog for grid/flex/table fixes; adjust CSS if you relied on old buggy behavior.

**CI pattern:** store hashed PNG renders of key pages; fail build on unexpected delta above a threshold.

## Quick Compatibility Checklist

- [ ] Custom `URLFetcher` (not deprecated `default_url_fetcher`)
- [ ] `presentational_hints` only on trusted HTML
- [ ] `output_intent` replaces `srgb` boolean
- [ ] Golden PDF set re-rendered and reviewed
- [ ] Server security controls from [`security-untrusted-html.md`](security-untrusted-html.md) still in place

## Further research

- [Changelog](https://doc.courtbouillon.org/weasyprint/stable/changelog.html)
- [First Steps — URL Fetchers](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#url-fetchers)
- [Common Use Cases — PDF/A & metadata](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html)
