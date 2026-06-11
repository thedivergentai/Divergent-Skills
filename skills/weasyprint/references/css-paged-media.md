# CSS Paged Media in WeasyPrint

WeasyPrint treats each PDF page as a CSS page box. Paged Media is a core strength — most browser engines barely implement it.

## The `@page` Rule

```css
@page {
  size: A4;
  margin: 2.5cm 2cm;
  @top-center { content: "Report Title"; }
  @bottom-right { content: counter(page); }
}
```

**Page selectors:** `:left`, `:right`, `:first`, `:blank`, and GCPM `:nth()` — e.g. `@page :nth(1 of chapter)` for first page of each named chapter.

**Page properties:** `size`, `bleed`, `marks`, margins, borders, padding. Page-based counters have [known issues (#93)](https://github.com/Kozea/WeasyPrint/issues/93) — test on your document.

## Named Pages

```css
@page chapter { @top-center { content: string(heading); } }
h2 { page: chapter; break-before: right; }
```

**Report** sample: `page: chapter` / `page: no-chapter` for cover vs body ([`examples/report/report.css`](examples/report/report.css)). **Book** sample: `page: full`, `page: clean`, `:blank` with left/right margin boxes ([`examples/book/book.css`](examples/book/book.css)).

## Margin Boxes

Sixteen positions (`@top-left` … `@bottom-right`). Content uses `counter()`, `string()`, `element()`, and literal `content`.

**Limits:** no min/max on margin boxes; `element()` works but **`start` parameter not supported**.

## Running Elements & Footnotes

```css
.header { position: running(header); }
@page { @top-center { content: element(header); } }
```

Footnotes: `float: footnote` with `::footnote-marker`, `::footnote-call`, `footnote-display`, `footnote-policy`. `footnote-display: compact` **not** supported.

## Fragmentation & Units

`break-before/after/inside` work for **pages** (not columns). `orphans`, `widows`, `margin-break` supported.

`pvw` / `pvh` = whole page including margins; `vw` / `cm` / `px` = page area inside margins.

## Sample Index

| Task | Sample |
|------|--------|
| Cover + body | [`examples/report/report.css`](examples/report/report.css) |
| Book left/right | [`examples/book/book.css`](examples/book/book.css) |
| Invoice footer | [`examples/invoice/invoice.css`](examples/invoice/invoice.css) |

See [`examples/index.md`](examples/index.md) for render commands.

## Further research

- [WeasyPrint stable documentation](https://doc.courtbouillon.org/weasyprint/stable/)
- [CSS Paged Media Module Level 3](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#css-paged-media-module-level-3)
- [CSS Generated Content for Paged Media (GCPM)](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#css-generated-content-for-paged-media-module)
