# Browser vs Print: Diagnosing CSS Gaps

Use this lesson when CSS looks correct in a browser but fails or differs in WeasyPrint PDF output.

## First Diagnostic Checklist

1. **Media type** — WeasyPrint defaults to `print`, not `screen`. Rules inside `@media screen` are ignored unless you pass `-m screen` or `media_type='screen'`. Put print-specific rules in `@media print` or leave them unqualified.
2. **Presentational hints** — Legacy HTML may rely on attributes (`width`, `align`, `bgcolor`). Enable once with `--presentational-hints` or `presentational_hints=True` **only on trusted input** (untrusted HTML + hints is a security risk; see CVE-2026-49452).
3. **Unsupported features** — Before rewriting layout, confirm the property is implemented. Many “bugs” are spec gaps (see sections below).
4. **Logs** — Run with verbose logging; missing glyphs, fetch failures, and font warnings appear in stderr.

## Hard Unsupported (CSS 2.1)

| Feature | Impact |
|---------|--------|
| `visibility: collapse` on tables | Use `hidden` or restructure |
| Min/max width/height on table boxes | Avoid on `<table>`, rows, cells |
| Min/max on page-margin boxes | Fixed margin-box sizing only |
| Spec-conforming `font-family` matching | Passed raw to Pango — test with `fc-match` |
| RTL / bidi text | No right-to-left layout |
| System colors / system fonts | Deprecated; use explicit values |

## Selectors That Never Match

PDF is not interactive. These parse as valid CSS but **never match**:

`:hover`, `:active`, `:focus`, `:target`, `:visited`

Selectors Level 4 gaps: no `:dir`, no input pseudo-classes (`:valid`, `:invalid`…), no column selectors (`||`, `:nth-col`).

## Text Module Gaps

Not supported: `line-break`, `match-parent` for `text-align`, `text-indent`, `hanging-punctuation`, Text 4 spacing/wrap properties (`text-wrap`, `text-spacing`, etc.).

**Hyphenation** requires both `hyphens: auto` **and** `lang` on `<html>` for a [Pyphen dictionary](https://github.com/Kozea/Pyphen/tree/main/pyphen/dictionaries). Disable locally with `hyphens: manual` where needed (e.g. URLs in `::after` content).

## Other Common Surprises

- **Transforms** — 2D only (`translate`, `rotate`, `scale`, `skew`). No 3D, `perspective`, or `backface-visibility`.
- **Color** — CSS Color 4 fully supported except system colors. Level 5: `light-dark()`, `device-cmyk()`, `@color-profile` yes; `color-mix()` / `contrast-color()` no.
- **Tables** — Multi-page tables are a known slow path; prefer block layout when performance matters.
- **Box shadow** — `box-shadow` not supported in stable releases.
- **Intrinsic sizing** — `min-content`, `max-content`, `fit-content()` not supported.

## Paged Media: Where WeasyPrint Excels

Unlike browsers, WeasyPrint fully implements `@page`, margin boxes, running elements, footnotes, named strings, `target-counter()` / `target-text()`, leaders, and PDF bookmarks. If screen layout “works” but print headers/TOC fail, you likely need paged-media CSS — not a flexbox rewrite.

Limits: `element()` **`start` parameter not supported**; `footnote-display: compact` not supported.

## Migration Strategy

1. Confirm media type and check logs.
2. Map the failing property to the supported-features matrix in [`full-docs/api_reference.md`](full-docs/api_reference.md) § Supported Features.
3. Replace unsupported layout (e.g. `box-shadow`, complex grid) with print-native alternatives.
4. Use official samples in [`examples/index.md`](examples/index.md) for TOC, headers, and `@page` patterns.

## Further research

- [WeasyPrint stable documentation](https://doc.courtbouillon.org/weasyprint/stable/)
- [Supported Features — API Reference](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#supported-features)
- [CSS 2.1 unsupported list](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#css-level-2-revision-1)
