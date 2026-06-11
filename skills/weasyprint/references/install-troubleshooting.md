# WeasyPrint Install Troubleshooting

**When to load**: Import/runtime failure after install — `cannot load library`, blank PDFs, tofu text, or version mismatch.

## Expert lesson

Work in order: **verify toolchain → fix native libs → fix fonts → pin versions**.

### 1. Baseline diagnostics

```bash
python -m weasyprint --info    # or weasyprint --info
python3 --version              # ≥ 3.10
pango-view --version           # ≥ 1.44 (Linux/macOS; Windows: DLL path first)
```

`--info` prints WeasyPrint, Python, Pango, and related library versions — paste this into bug reports.

### 2. Missing native libraries

Error pattern: `cannot load library 'xxx': error xxx` — WeasyPrint cannot find Pango/GObject/HarfBuzz/Fontconfig.

| OS | Fix |
|----|-----|
| **Windows** | `set WEASYPRINT_DLL_DIRECTORIES=C:/msys64/mingw64/bin` — directory must contain the actual `.dll` files |
| **macOS** | `export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib:$DYLD_FALLBACK_LIBRARY_PATH` (or `/usr/local/lib` on Intel) |
| **Linux** | Install distro packages from `install-linux.md`; do not rely on pip alone |

On Windows/macOS, **list the folder** and confirm `pango`, `gobject`, `harfbuzz` artifacts exist. Typos in env var names are frequent (`WEASYPRINT_DLL_DIRECTORIES` is plural).

Linux Docker: minimal images often lack Pango and fonts — add runtime packages in the image, not only at build time.

### 3. Missing fonts (not a crash)

Symptoms: **empty text**, **squares/tofu**, or wrong weights — PDF generates but glyphs are wrong.

- Install system fonts (`fonts-liberation`, `fontconfig`, brand OTFs).
- For `@font-face`, use shared `FontConfiguration` (see `python-instantiation.md`).
- `@font-face` URLs must resolve via `base_url` or absolute URLs.

This is the most misreported “WeasyPrint broken” issue — logs stay clean.

### 4. Pango version pins

Current stable expects **Pango ≥ 1.44**. Older RHEL/CentOS/legacy LTS:

- Upgrade Pango if possible, **or**
- `pip install 'weasyprint<=52.5'` as documented fallback.

Mixing new WeasyPrint with decade-old Pango fails at import or produces subtle layout bugs.

### 5. When to open a GitHub issue

Search [existing issues](https://github.com/Kozea/WeasyPrint/issues) first. New issue should include `--info` output, OS, install path (distro vs pip vs brew), and minimal HTML if rendering-related. Do not comment on closed threads — open a new one.

## Traps

- **Chasing pip upgrades when Pango is the blocker** — `pip install -U weasyprint` does not upgrade system Pango.
- **Setting DLL path to MSYS2 root** — must be `mingw64\bin`, not `C:\msys64` alone.
- **Font issue treated as install failure** — reinstalling WeasyPrint does not install Liberation Sans.
- **WSL vs native Windows confusion** — different Pango stacks; fix the environment actually running Python.
- **Ignoring stderr CSS warnings** — missing stylesheets look like “install” problems but are URL/base_url bugs.

---
## Further research
Official stable documentation: [Troubleshooting](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#troubleshooting), [Missing Library](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#missing-library), [Missing Fonts](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#missing-fonts)
