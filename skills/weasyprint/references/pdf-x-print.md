# PDF/X Print Exchange

PDF/X targets prepress: defined color spaces, output intent, no RGB surprises on press. WeasyPrint supports PDF/X-4 (preferred) and earlier variants via `pdf_variant`.

## Enable PDF/X-4

```bash
weasyprint job.html out.pdf --pdf-variant=pdf/x-4 --output-intent=/path/to/ISOcoated_v2.icc
```

```python
from pathlib import Path
from weasyprint import HTML

HTML("job.html").write_pdf(
    "out.pdf",
    pdf_variant="pdf/x-4",
    output_intent=Path("ISOcoated_v2_300_eci.icc").read_bytes(),
)
```

`output_intent` embeds the ICC profile declaring how the PDF should be interpreted on press. **Without it, PDF/X validation fails.**

## CMYK via @color-profile

Device-dependent CMYK is the straightforward path — define a named profile, reference it in `device-cmyk()`:

```css
@color-profile device-cmyk {
  components: cyan, magenta, yellow, black;
  src: url(profiles/ISOcoated_v2_300_eci.icc);
}

body {
  color: device-cmyk(0% 10% 0% 80%);
}

.accent {
  background: device-cmyk(0% 70% 100% 0%);
}
```

The `@color-profile` `src` and `--output-intent` should reference the **same ICC file** — mismatch causes preflight rejection.

## Variant comparison

| Variant | Transparency | Notes |
|---------|--------------|-------|
| **pdf/x-4** | Allowed | Prefer for modern workflows |
| pdf/x-3, pdf/x-1a | Limited/none | Legacy print shops only |

## Expert traps

| Trap | Consequence |
|------|-------------|
| `color: #ff0000` everywhere | Device RGB — fails PDF/X preflight |
| RGB images without conversion | Embed CMYK TIFFs or convert upstream |
| Missing output intent | Instant validator failure |
| Wrong ICC for territory | US vs EU coated stock — pick FOGRA39/ISOcoated deliberately |
| sRGB photos in marketing PDF | Convert to CMYK with profile before `<img src>` |
| Transparency in X-1a | Use X-4 or flatten layers externally |

## Images on press

WeasyPrint does not auto-convert RGB photos to CMYK. Pre-convert assets:

```html
<img src="hero-cmyk.tif" alt="Product" style="image-rendering: crisp-edges">
```

For PDF/A **and** PDF/X, combine `crisp-edges` with CMYK assets.

## Validation workflow

1. Define ICC in CSS `@color-profile` + `output_intent` parameter.
2. Use `device-cmyk()` for all spot colors and text.
3. Render with `pdf_variant="pdf/x-4"`.
4. Preflight with callas pdfToolbox, Acrobat Preflight, or printer RIP.
5. Ship only after pass — WeasyPrint does not run preflight.

## Further research

- [PDF/X (Graphics Exchange)](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#pdf-x-graphics-exchange)
- [Generate Specialized PDFs](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#generate-specialized-pdfs)
