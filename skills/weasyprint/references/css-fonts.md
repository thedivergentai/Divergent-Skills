# Fonts in WeasyPrint

WeasyPrint renders text through **Pango** → **Fontconfig** → **HarfBuzz**. CSS font properties are supported, but font resolution differs from browsers.

## System Fonts

Any font Pango finds on the system is available. List fonts with `fc-list`; test a pattern with `fc-match "Family Name"`. Install locally by copying to `~/.local/share/fonts` (Linux) or OS font directories.

Fonts are **embedded and subset** in PDF output (glyphs used in the document only). Subsetting uses hb-subset when available, fontTools as fallback.

CLI flags: `--full-fonts` embeds unmodified font files; `--hinting` keeps hinting data.

## `@font-face`

Declare web fonts in CSS as usual:

```css
@font-face {
  font-family: "My Serif";
  src: url("fonts/MySerif-Regular.woff2") format("woff2");
  font-weight: 400;
}
```

**Python API:** `@font-face` rules require a shared `FontConfiguration` instance passed to both `CSS()` and `HTML.write_pdf()` / `render()`:

```python
from weasyprint import HTML, CSS
from weasyprint.text.fonts import FontConfiguration

font_config = FontConfiguration()
css = CSS("styles.css", font_config=font_config)
HTML("doc.html").write_pdf("out.pdf", stylesheets=[css], font_config=font_config)
```

Reuse the **same** `FontConfiguration` for all stylesheets in one document.

Samples with `@font-face`: [`examples/report/`](examples/report/), [`examples/book/`](examples/book/), [`examples/letter/fonts/`](examples/letter/).

## Supported Font Properties

From CSS Fonts 3: `font-size`, `font-stretch`, `font-style`, `font-weight`, `font-kerning`, `font-variant-*`, `font-feature-settings`, `font-language-override`, shorthand `font` / `font-variant`, `@font-face`.

From Level 4: `font-variation-settings` only.

**Not supported:** `@font-feature-values`; `font-variant-alternates` beyond `normal` and `historical-forms`.

## Fontconfig Quirks

Fontconfig applies system-wide rules: fallbacks for missing glyphs, aliases (`serif`, `monospace`), emoji variants. These can **override CSS expectations**.

When fonts behave unexpectedly:

1. Run `fc-match` on your `font-family` string.
2. Check whether a system alias substitutes a different face.
3. Disable or override Fontconfig rules if you need pixel-exact CSS control.
4. Prefer explicit `@font-face` with local file paths for reproducible PDFs.

`font-family` is passed **as-is to Pango**, not via the CSS 2.1 font-matching algorithm. Common stacks work; exotic fallback chains may differ from Chrome.

## Tofu (`.notdef` Glyphs)

When no font covers a Unicode code point, Pango renders the font's **`.notdef` glyph** (often a box — "tofu") and logs a warning.

**Known quirk:** the `.notdef` glyph may have an **incorrect advance width**; surrounding glyph positions remain correct. Text search/selection behave as if the character existed.

**Fixes:**

- Embed a font that covers the script (`@font-face` + `FontConfiguration`)
- Add fallback families in `font-family`
- Verify `lang` attribute for hyphenation/dictionary coverage (separate from glyph coverage)

## Debugging Checklist

1. Check stderr for "Glyph … missing" warnings.
2. `fc-list | grep -i "family"` — is the font installed?
3. Confirm `base_url` resolves relative `url()` in `@font-face`.
4. Pass the same `font_config` to `CSS()` and `HTML.write_pdf()`.
5. For production PDFs, ship fonts with the project instead of relying on system installs.

## Further research

- [WeasyPrint stable documentation](https://doc.courtbouillon.org/weasyprint/stable/)
- [Fonts — Supported Features](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#fonts)
- [CSS Fonts Module Level 3 / 4](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#css-fonts-module-level-3-4)
- [FontConfiguration API](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#weasyprint.text.fonts.FontConfiguration)
