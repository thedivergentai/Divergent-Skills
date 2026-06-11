# PDF/UA Accessibility

PDF/UA (ISO 14289) adds structure tags so screen readers navigate headings, lists, and tables. WeasyPrint maps **HTML document order → PDF tag tree** — broken semantics in HTML become broken accessibility in PDF.

## Enable tagging

```bash
weasyprint report.html out.pdf --pdf-variant=pdf/ua-1 --pdf-tags
```

```python
from weasyprint import HTML

HTML("report.html").write_pdf(
    "out.pdf",
    pdf_variant="pdf/ua-1",
    pdf_tags=True,
)
```

`pdf_tags=True` without `pdf_variant=pdf/ua-*` still emits structure tags, but full UA compliance requires both plus correct HTML.

## Required HTML metadata

| Element | Requirement |
|---------|-------------|
| `<title>` in `<head>` | Document title in tagged PDF |
| `lang` on `<html>` | e.g. `<html lang="en">` — sets document language |
| Logical heading hierarchy | One `<h1>`, no skipped levels (`h1` → `h3`) |
| Semantic elements | `<main>`, `<nav>`, `<article>`, `<table>` with `<th scope>` |

```html
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Rapport annuel 2025</title>
</head>
<body>
  <main>
    <h1>Rapport annuel</h1>
    <section aria-labelledby="fin">
      <h2 id="fin">Finances</h2>
      <table>
        <caption>Revenus par trimestre</caption>
        <thead><tr><th scope="col">Trimestre</th><th scope="col">Montant</th></tr></thead>
        <tbody>...</tbody>
      </table>
    </section>
  </main>
</body>
</html>
```

## Expert traps

| Trap | Why it fails |
|------|--------------|
| `<div>` soup for layout | No tags → flat undifferentiated content |
| CSS `display` changing semantics | Visual order may diverge from tag order — keep DOM logical |
| `position: absolute` reordering | Screen readers follow HTML order, not visual position |
| Missing `alt` on informative images | Empty figure tags — add `alt` or `aria-label` |
| Decorative images | Use `alt=""` explicitly |
| Tables for layout | Tagged as data tables — use CSS grid/flex instead |
| Multiple `<h1>` | Confuses outline; one primary title only |

## Tag order rule

**PDF reading order = HTML source order.** If you float sidebars before main content in the DOM for CSS convenience, assistive tech reads the sidebar first. Restructure HTML; do not patch with PDF post-processing.

## Validation responsibility

As with PDF/A, WeasyPrint attempts valid output but **does not certify**. Run PAC (PDF Accessibility Checker), axesPDF, or equivalent. Common failures: missing `lang`, empty `<title>`, non-standard tags from custom elements.

## Forms in UA documents

Interactive PDF forms (`pdf_forms=True`) interact with tagging — test target readers. Some combinations of form fields and tags fail validation in strict checkers.

## Further research

- [PDF/UA (Universal Accessibility)](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#pdf-ua-universal-accessibility)
- [Generate Specialized PDFs](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#generate-specialized-pdfs)
