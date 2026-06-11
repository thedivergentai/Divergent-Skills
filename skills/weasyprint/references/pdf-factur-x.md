# Factur-X / ZUGFeRD E-Invoices

Hybrid invoices: human-readable PDF/A-3 plus machine-readable EN 16931 XML. WeasyPrint **embeds** metadata you supply — it does **not** generate valid Factur-X XML or RDF.

## Two files you must author

| File | Role |
|------|------|
| `rdf.xml` | XMP/RDF extension — links PDF/A to embedded XML |
| `factur-x.xml` | CrossIndustryInvoice — amounts, parties, tax |

Base profile: **PDF/A-3b**. RDF `fx:ConformanceLevel` (MINIMUM, BASIC, EN16931) must match XML content.

## Two-phase render (required)

Attachments and XMP apply **after layout** — not on a one-liner `write_pdf()`.

```python
from pathlib import Path
from weasyprint import Attachment, HTML

doc = HTML("invoice.html").render()
doc.metadata.attachments = [
    Attachment(
        string=Path("factur-x.xml").read_text(encoding="utf-8"),
        name="factur-x.xml",    # must match rdf fx:DocumentFileName
        relationship="Data",
    ),
]
doc.metadata.xmp_metadata = [Path("rdf.xml").read_bytes()]
doc.write_pdf("invoice.pdf", pdf_variant="pdf/a-3b")
```

## CLI equivalent

```bash
weasyprint invoice.html invoice.pdf --pdf-variant=pdf/a-3a \
  --attachment=factur-x.xml --attachment-relationship=Data --xmp-metadata=rdf.xml
```

Confirm `pdf/a-3a` vs `pdf/a-3b` with your validator and buyer portal.

## RDF alignment trap

```xml
<fx:DocumentFileName>factur-x.xml</fx:DocumentFileName>
<fx:DocumentType>INVOICE</fx:DocumentType>
<fx:ConformanceLevel>MINIMUM</fx:ConformanceLevel>
```

Filename mismatch between RDF and `Attachment.name` → Chorus Pro / XRechnung rejection.

## Expert traps

| Trap | Fix |
|------|-----|
| Single-phase `write_pdf(attachments=[...])` only | Use `.render()` then `doc.metadata` |
| Wrong `relationship` | Factur-X expects `Data`, not `Source` |
| HTML totals ≠ XML totals | Auditors compare both layers |
| Hand-rolled XML | Use factur-x / drafthorse libraries |
| UTF-8 BOM in XML | Emit UTF-8 without BOM |

## Validation stack

XML schema → PDF/A-3 (veraPDF) → Factur-X profile → national portal. WeasyPrint handles embed only.

## Further research

- [Factur-X / ZUGFeRD](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#factur-x-zugferd-electronic-invoices)
- [Generate Specialized PDFs](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#generate-specialized-pdfs)
