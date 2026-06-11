# Debug: Logging & Render Pipeline

Use when PDF output is wrong, incomplete, or differs from browser preview — start here before diving into full API docs.

## Silent CSS Failures (Check First)

Most unsupported CSS and missing resources are **non-fatal**. WeasyPrint logs warnings and keeps rendering — output may look "almost right" with no exception.

**CLI:** warnings go to stderr by default.

**Library:** logs are **disabled by default**. Configure explicitly:

```python
import logging

logger = logging.getLogger("weasyprint")
logger.setLevel(logging.WARNING)
logger.addHandler(logging.StreamHandler())
```

Progress feedback uses `weasyprint.progress` (CLI: `--verbose` / `--debug`).

Raise `FatalURLFetchingError` in a custom fetcher when missing stylesheets must abort render — see [`security-url-fetcher.md`](security-url-fetcher.md).

## Bisect Workflow

1. Enable WARNING-level logging — scan for ignored properties, missing images, font issues.
2. Check [`css-browser-vs-print.md`](css-browser-vs-print.md) — print media defaults, unsupported selectors, RTL gaps.
3. Isolate: render with user CSS only, then add HTML, then external assets.
4. Compare against a minimal example from [`resource-matrix.md`](resource-matrix.md) Examples catalog.

## Seven Pipeline Stages

Knowing where a bug lives narrows the search:

| Step | What happens | Key modules |
|------|--------------|-------------|
| 1. Parse HTML | DOM-like element tree | `HTML` class |
| 2. Parse CSS | tinycss2; unknown props → **warnings** | `CSS` class, `css.validation` |
| 3. Cascade | Selectors, specificity, inheritance | `css` package |
| 4. Formatting structure | Elements → boxes (`display`, UA stylesheet) | `formatting_structure.build` |
| 5. Layout | Breaks, page boxes, used values | layout (largest complexity) |
| 6. Stacking & draw | `z-index`, paint to PDF page | `stacking`, `draw` |
| 7. Metadata | Links, attachments, PDF/A fields | `pdf` |

**Rule of thumb:** if coordinates or breaks are wrong → layout (step 5). If styles never apply → cascade (step 3) or silent CSS parse (step 2). If elements missing entirely → formatting structure (step 4).

## CSS Parse Details (Step 2)

During pre-processing:

- Unknown/unsupported declarations are **ignored with warnings** (easy to miss without logging).
- Shorthands expand (`margin` → four sides).
- Hyphens become underscores in internal property names.
- Selectors pre-compile via cssselect2.

## Common Log Clues

| Message pattern | Likely cause |
|-----------------|--------------|
| Unsupported property | See `css-browser-vs-print.md`; property ignored |
| Missing image / fetch error | URL fetcher, auth, or blocked protocol |
| `.notdef` glyph / font warning | Missing font file or FontConfiguration |
| No output at all | Check `HTML(string=...)` vs positional filename trap |

## Further research

- [Show Log Messages (Common Use Cases)](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#show-log-messages)
- [Going Further — pipeline overview](https://doc.courtbouillon.org/weasyprint/stable/going_further.html#dive-into-the-source)
- [Supported Features (API Reference)](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html)
