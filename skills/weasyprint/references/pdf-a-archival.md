# PDF/A Archival (A-3u)

WeasyPrint can emit PDF/A variants via `--pdf-variant` / `pdf_variant`. **Validity is never guaranteed** — the engine applies subset rules; you must validate with spec tooling (veraPDF, etc.) before archiving.

## Variant choice

| Variant | Use when |
|---------|----------|
| **pdf/a-3u** | Default recommendation — transparency OK (vs A-1), arbitrary attachment MIME types (vs A-2) |
| **pdf/a-3b** | Factur-X base profile — binary text layer, not Unicode |
| pdf/a-1*, pdf/a-2* | Legacy archives only — stricter transparency/attachment limits |

The **`u`** suffix means Unicode text extraction — required for searchable archival in most jurisdictions.

## CLI / Python

```bash
weasyprint invoice.html out.pdf --pdf-variant=pdf/a-3u
```

```python
from weasyprint import HTML

HTML("doc.html").write_pdf(
    "out.pdf",
    pdf_variant="pdf/a-3u",
    pdf_identifier=b"unique-id-for-this-revision",  # optional versioning
)
```

List all supported variants: `weasyprint --help`.

## Image trap: crisp-edges

PDF/A **forbids anti-aliasing** on raster images. Without this, veraPDF fails even when WeasyPrint reports success.

```css
img, svg image {
  image-rendering: crisp-edges;
}
```

Apply globally in print CSS — do not rely on browser defaults. Vector SVG is unaffected; embedded JPEG/PNG must comply.

## Other common validation failures

| Trap | Fix |
|------|-----|
| RGB-only workflow | Embed fonts; avoid device RGB where spec demands ICC |
| External hyperlinks without action | Audit `<a href>` — some profiles restrict launch actions |
| JavaScript, video, audio | Strip before render — not emitted but invalid if injected |
| Missing embedded fonts | `@font-face` with local/WOFF; subset if needed |
| Transparency in A-1 | Switch to A-3u or flatten in pre-process |

## PDF identifier

When replacing an archived PDF, pass a stable `pdf_identifier` so receivers detect version lineage. WeasyPrint generates a valid default; override only when your records system assigns IDs.

```bash
weasyprint doc.html out.pdf --pdf-variant=pdf/a-3u --pdf-identifier="550e8400-e29b-41d4-a716-446655440000"
```

## Workflow checklist

1. Pick **pdf/a-3u** unless a downstream system mandates 3b (Factur-X).
2. Add `image-rendering: crisp-edges` to all raster rules.
3. Embed fonts; avoid forbidden features in HTML/CSS.
4. Render → **validate externally** → store only after pass.
5. Re-validate when WeasyPrint version changes — engine fixes can alter output.

WeasyPrint does not run veraPDF for you. Treat `--pdf-variant` as **intent**, not certification.

## Further research

- [PDF/A (Archiving)](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#pdf-a-archiving)
- [Generate Specialized PDFs](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#generate-specialized-pdfs)
