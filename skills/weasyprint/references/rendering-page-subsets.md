# WeasyPrint Rendering & Page Subsets

**When to load**: Splitting odd/even sheets, extracting page metadata, bookmarks, or tuning `write_pdf()` output options.

## Expert lesson

Two-stage pipeline:

1. `document = HTML(...).render(**kwargs)` → `Document` (layout done, pages materialized)
2. `document.write_pdf(target, **kwargs)` → bytes, file path, or file object

`HTML.write_pdf()` is sugar for `render()` + `write_pdf()` in one call. Use `render()` when you need page count, per-page size, link targets, or subsets before writing.

### 0-based indexes vs 1-based page numbers

`document.pages` is a **list indexed from 0**. PDF viewers and `bookmark.destination` page numbers are **1-based**. The classic odd/even split:

```python
doc = HTML(filename="book.html").render()
doc.copy(doc.pages[::2]).write_pdf("odd.pdf")   # pages 1, 3, 5…
doc.copy(doc.pages[1::2]).write_pdf("even.pdf") # pages 2, 4, 6…
```

`Document.copy(pages)` takes a list of `Page` objects, not integers. Pages in one document may differ in size — do not assume uniform `len(pages)` geometry.

### Bookmarks and outline

`document.make_bookmark_tree()` returns nested bookmarks; `bookmark.destination[0]` is the 1-based page number for printing outlines.

### write_pdf options (Python mirrors CLI)

Pass through `render()` and/or `write_pdf()` as needed:

- `stylesheets`, `font_config` — layout-affecting; must be set on `render()` if you call it explicitly
- `pdf_variant`, `pdf_version`, `pdf_identifier` — PDF/A, PDF/UA, PDF/X
- `pdf_forms`, `pdf_tags` — forms and tagged PDF
- `attachments`, `metadata`, `custom_metadata` — PDF attachments and Info dict
- `optimize_images`, `jpeg_quality`, `dpi`, `full_fonts`, `hinting` — size and font embedding
- `cache` — dict or folder path for repeated asset work
- `presentational_hints` — trusted HTML only

**Warning**: filename targets overwrite without prompt.

### When to keep the Document alive

Inspect `page.width` / `page.height`, resolve anchors, or write multiple PDF subsets from one layout — pay `render()` once, then several `copy().write_pdf()` calls.

## Related example

```python
from weasyprint import HTML

document = HTML(url="https://www.w3.org/TR/CSS21/intro.html").render()
print(f"{len(document.pages)} pages")
for i, page in enumerate(document.pages):
    print(f"  index {i} → PDF page {i + 1}, {page.width}×{page.height}")
document.copy(document.pages[:3]).write_pdf("intro-only.pdf")
```

## Traps

- **Using 1-based indexes on `document.pages[n]`** — off-by-one splits and empty PDFs.
- **`copy([0, 2, 4])` with integers** — must pass `Page` instances: `doc.copy([doc.pages[i] for i in (0, 2, 4)])`.
- **Stylesheets only on `write_pdf` after manual `render()`** — if you called `render()` without them, layout is already fixed; pass stylesheets to `render()`.
- **Assuming equal page sizes** — mixed `@page` rules and breaks can vary per page.
- **Expecting `render()` to validate PDF/A** — variant flags help; external validation still required.

---
## Further research
Official stable documentation: [Rendering Individual Pages](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#rendering-individual-pages), [Python API](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#weasyprint.HTML.render)
