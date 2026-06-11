# WeasyPrint Python Instantiation

**When to load**: Building PDFs in app code, workers, or tests — before calling `write_pdf()` or `render()`.

## Expert lesson

`HTML` and `CSS` constructors **guess** the argument kind from a single positional value:

| Positional arg looks like | Interpreted as |
|---------------------------|----------------|
| Existing file path | `filename=` |
| `http://` / `https://` URL | `url=` |
| Readable file object | `file_obj=` |

**In-memory markup must use named arguments.** A bare `HTML('<h1>Hi</h1>')` is treated as a filename and fails or reads the wrong file. Always:

```python
HTML(string=html_content, base_url=base)
```

`base_url` is not optional when `string=` contains relative `href`, `src`, or `@import` paths. It should be a **directory** URL or path (trailing slash on URLs), e.g. `pathlib.Path(__file__).parent.as_uri()` or `file:///app/templates/`. Omitting it is the top cause of missing images and styles in API renders.

For files and URLs, named args avoid ambiguity:

```python
HTML(filename="invoice.html")
HTML(url="https://example.com/doc")
CSS(filename="print.css")
CSS(string="@page { size: A3; margin: 1cm }")
```

### FontConfiguration

Any `@font-face` in your CSS requires one shared `FontConfiguration` passed to **both** `CSS(..., font_config=...)` and `HTML.write_pdf(..., font_config=...)`. Without it, custom faces silently fall back to system fonts (tofu squares or wrong metrics).

```python
from weasyprint import HTML, CSS
from weasyprint.text.fonts import FontConfiguration

fc = FontConfiguration()
css = CSS(string='''
    @font-face { font-family: Brand; src: url(fonts/Brand.woff2); }
    body { font-family: Brand; }
''', font_config=fc)
HTML(string=html, base_url=template_dir).write_pdf(
    "out.pdf", stylesheets=[css], font_config=fc
)
```

`write_pdf()` with no path returns **bytes**; with a filename it **overwrites silently**. Pass a file object for streaming responses.

Long-lived workers: reuse one process and optionally a shared `cache` dict across `write_pdf()` calls to amortize font/image work (see `web-performance.md`).

## Related example

```python
from pathlib import Path
from weasyprint import HTML, CSS

root = Path("templates")
html = (root / "letter.html").read_text(encoding="utf-8")
HTML(string=html, base_url=root.as_uri()).write_pdf(
    "letter.pdf",
    stylesheets=[CSS(filename=root / "print.css")],
)
```

## Traps

- **`HTML('<tag>')` positional** — always `string=` for markup literals.
- **Missing `base_url` with `string=`** — relative assets 404 internally; output looks unstyled.
- **`FontConfiguration` only on CSS** — must also pass to `write_pdf()`.
- **Passing a path string that looks like HTML** — rare, but if a filename could be confused, use `filename=` explicitly.
- **Untrusted `string=`** — same SSRF/`file://` surface as CLI; use `security-untrusted-html.md` + custom `URLFetcher`.

---
## Further research
Official stable documentation: [Instantiating HTML and CSS Objects](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#instantiating-html-and-css-objects), [Rendering to a Single File](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#rendering-to-a-single-file)
