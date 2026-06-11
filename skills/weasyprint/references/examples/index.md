# CourtBouillon WeasyPrint Samples

Official reference implementations from [CourtBouillon/weasyprint-samples](https://github.com/CourtBouillon/weasyprint-samples).

**Source**: `main` branch, cloned into `references/examples/`

**License**: Sample code/CSS public domain; fonts have their own licenses; book text © Madcats.

## How to Render

Run from this directory (`references/examples/`):

```bash
weasyprint report/report.html report/report.pdf
```

Or render all: `sh printall.sh` (Unix). Poster and book need `-s` for alternate stylesheets:

```bash
weasyprint -s poster/poster.css poster/poster.html poster/poster.pdf
weasyprint -s book/book.css book/book.html book/book.pdf
```

**Do NOT load** `.pdf` binary files into context — read `.html` and `.css` only. PDFs are **not committed** to this repo; generate locally via commands above.

## Sample Index

| Sample | Files | Demonstrates |
|--------|-------|--------------|
| [report/](report/) | `report.html`, `report.css` | `@page` margin boxes, `:blank`, named pages (`page: chapter`, `no-chapter`), `string-set` running headers, TOC with `target-text()` + `target-counter()`, multi-column (`columns: 2`), cover `@page :first` background, `@font-face`, CSS variables, SVG figures, internal links |
| [book/](book/) | `book.html`, `book.css`, `book-classical.css` | Named pages (`full`, `clean`), left/right margin boxes with `string(heading)` + page counters, TOC with `target-counter(h2-counter)` + leaders, custom page sizes (`148mm 210mm`), `@font-face` in subfolder, two stylesheet variants |
| [book-classical.css](book/book-classical.css) | alt stylesheet | Classical TOC with `leader('.')` dots + `target-text()` / `target-counter()` |
| [invoice/](invoice/) | `invoice.html`, `invoice.css` | Business invoice layout, `@page` footer margin boxes, `@font-face`, CSS variables, table styling |
| [letter/](letter/) | `letter.html`, `style.css` | Letterhead with background images, `@font-face` from `fonts/`, `leader(dotted)`, zero-margin `@page` |
| [poster/](poster/) | `poster.html`, `poster.css`, `flyer.css`, `common.css` | Large fixed page size (`278mm 388mm`), `@import` shared CSS, same HTML + different `-s` stylesheet for poster vs flyer |
| [ticket/](ticket/) | `ticket.html`, `ticket.css` | Fixed landscape ticket (`size: landscape`, `height: 8cm`), barcode font (`Libre Barcode`), flex layout, multi-column sections |

## When to Read Which Sample

| Your task | Start here |
|-----------|------------|
| Report with TOC + running headers | `report/report.css` § `#contents`, `@page` rules |
| Multi-column body text | `report/report.css` § `#columns section` |
| Book/chapter with named pages | `book/book.css` — `page: full`, `page: clean` |
| Classical dotted TOC | `book/book-classical.css` § TOC |
| Invoice / receipt | `invoice/` |
| Event poster or flyer (custom dimensions) | `poster/` — note `-s` flag for CSS swap |
| Ticket / badge / label (small fixed size) | `ticket/ticket.css` |
| Branded letter on letterhead | `letter/style.css` |
