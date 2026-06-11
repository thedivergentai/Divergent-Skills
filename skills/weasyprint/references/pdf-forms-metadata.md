# PDF Forms, Metadata, Attachments & Cache

Fillable forms, Info/XMP metadata, file attachments, and render-time caching.

## PDF forms

Default: inputs flatten to static shapes. Real AcroForm fields:

```python
from weasyprint import HTML
HTML(string='<input name="email" value="a@b.com">').write_pdf("form.pdf", pdf_forms=True)
```

Selective fields — override [html5_ua_form.css](https://github.com/Kozea/WeasyPrint/blob/main/weasyprint/css/html5_ua_form.css):

```html
<style>
  .interactive { appearance: auto; }
  .interactive::before { visibility: hidden; }
</style>
<input value="static">
<input class="interactive" name="qty" value="1">
```

**Trap:** Reader support varies — test Acrobat, Foxit, browser viewers separately.

## Metadata from HTML

```html
<head>
  <title>Quarterly Report</title>
  <meta name="author" content="Jane Doe">
  <meta name="dcterms.created" content="2025-01-15T09:00:00+01:00">
</head>
```

Non-standard meta: `custom_metadata=True` (not `custsom_metadata` — docs typo).

## XMP (Factur-X, custom RDF)

Two-phase render required:

```python
from pathlib import Path
from weasyprint import HTML

doc = HTML("invoice.html").render()
doc.metadata.xmp_metadata = [Path("rdf.xml").read_bytes()]
doc.write_pdf("out.pdf", pdf_variant="pdf/a-3b")
```

CLI: `--xmp-metadata=rdf.xml`

## Attachments

```html
<link rel="attachment" href="terms.pdf">
<a rel="attachment" href="spec.xlsx">Download</a>
```

```python
from weasyprint import Attachment, HTML
HTML(string="<p>Doc</p>").write_pdf("out.pdf", attachments=[Attachment("terms.pdf")])
```

**Trap:** Relative `href` needs `base_url` on `HTML()`.

## Image cache

```python
cache = {}
for i, url in enumerate(urls):
    HTML(url).write_pdf(f"batch-{i}.pdf", cache=cache,
                        optimize_images=True, jpeg_quality=75, dpi=150)
```

Disk: `cache="/var/cache/weasyprint"` or `--cache-folder=/tmp/wp-cache`

**Trap:** Stale cache after deploy — invalidate on template/CSS changes.

## Further research

- [Include PDF Forms](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#include-pdf-forms)
- [Define PDF Metadata](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#define-pdf-metadata)
- [Attach Files](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#attach-files)
- [Cache and Optimize Images](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#cache-and-optimize-images)
