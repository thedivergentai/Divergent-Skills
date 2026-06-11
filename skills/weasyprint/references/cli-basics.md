# WeasyPrint CLI Basics

**When to load**: One-off PDF from HTML/URL, shell scripts, CI smoke tests, or debugging before embedding the Python API.

## Expert lesson

The CLI shape is fixed: `weasyprint [options] <input> <output>`. Input is a URL, file path, or `-` for stdin; output is a path or `-` for stdout. There is no separate “page size” or “margin” flag — layout is entirely CSS.

Page geometry, margins, headers/footers, and named pages all belong in a stylesheet passed with `-s` / `--stylesheet`. Repeat `-s` for multiple user sheets (same as Python `stylesheets=[...]`). Quick experiments on bash/zsh can pipe CSS without a file:

```bash
weasyprint report.html out.pdf \
  -s <(echo '@page { size: A4 landscape; margin: 2cm; }')
```

Default `@media` is **print** (`-m print`). Use `-m screen` only when you intentionally want screen rules. Relative URLs in stdin HTML need `-u <base-url>` — without it, resolution falls back to the current working directory, not the HTML file’s directory.

Sanity check after install: `weasyprint --info` (Pango, Python, library paths). Version only: `--version`.

High-value flags beyond `-s`:

| Flag | Expert use |
|------|------------|
| `-u` / `--base-url` | Required for stdin or when assets are relative to another directory |
| `-m` / `--media-type` | `print` (default) vs `screen` |
| `-t` / `--timeout` | HTTP fetch timeout (seconds); default 10 |
| `--allowed-protocols` | Coarse SSRF guard, e.g. `https,data` |
| `--fail-on-http-errors` | Fail closed on 4xx/5xx instead of silent missing assets |
| `--pdf-variant` | PDF/A, PDF/UA, PDF/X — must match your compliance checklist |
| `--pdf-tags` | Tagged PDF for accessibility |
| `-p` / `--presentational-hints` | **Trusted HTML only** — legacy attrs become CSS (see `security-untrusted-html.md`) |
| `-c` / `--cache-folder` | Disk cache for repeated renders (batch invoices) |
| `-D` / `--dpi`, `-j` / `--jpeg-quality`, `--optimize-images` | Size/quality tradeoffs for embedded images |

Stderr warnings about unsupported CSS are normal; they do not fail the process unless you add HTTP/error policies above.

For many documents in one process, prefer the Python API — CLI pays full startup + font/Pango init every invocation.

## Related example

```bash
weasyprint https://weasyprint.org /tmp/site.pdf \
  -s page.css \
  -t 20 \
  --custom-metadata
```

## Traps

- **No `-size` / `-margin` flags** — agents invent them constantly; only `@page` via `-s` or embedded CSS works.
- **Stdin without `-u`** — `./images/logo.png` resolves against CWD, not your project tree.
- **`presentational_hints` on untrusted HTML** — CVE-2026-49452; keep off for user content.
- **Assuming failure on CSS warnings** — unsupported properties log and skip; check stderr when output looks wrong.
- **PDF/A from CLI alone** — variant flag is necessary but not sufficient; raster images often need `image-rendering: crisp-edges` in CSS.

---
## Further research
Official stable documentation: [Command-Line](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#command-line), [Description (manpage)](https://doc.courtbouillon.org/weasyprint/stable/manpage.html)
