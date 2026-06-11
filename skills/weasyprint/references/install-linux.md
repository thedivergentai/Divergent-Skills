# WeasyPrint Install — Linux

**When to load**: Fresh Linux host, Docker base image, or CI runner before `pip install weasyprint`.

## Expert lesson

WeasyPrint stable needs **Python ≥ 3.10** and **Pango ≥ 1.44**. Verify before pip:

```bash
python3 --version
pango-view --version
```

If distro Pango is too old, either upgrade the stack or **pin WeasyPrint ≤ 52.5** (last line without newer Pango features). Do not pip-install latest on ancient servers without checking Pango first.

### Path A — distro package (fastest)

| Distro | Command |
|--------|---------|
| Debian ≥ 11, Ubuntu ≥ 20.04 | `apt install weasyprint` |
| Fedora ≥ 39 | `dnf install weasyprint` |
| Alpine ≥ 3.17 | `apk add weasyprint` |
| Arch | `pacman -S python-weasyprint` |

Then `weasyprint --info`. Version may lag PyPI; acceptable for system tooling, not always for latest PDF/A features.

### Path B — venv + pip (app projects)

Install **native libs** first, then pip inside a venv. Wheel path (minimal build deps):

| Distro | Runtime packages for pip wheels |
|--------|----------------------------------|
| Debian/Ubuntu | `python3-pip libpango-1.0-0 libpangoft2-1.0-0 libharfbuzz-subset0` (Ubuntu also: `libharfbuzz0b`) |
| Fedora | `python-pip pango` |
| Alpine | `py3-pip` + `so:libgobject-2.0.so.0 so:libpango-1.0.so.0 so:libharfbuzz.so.0 so:libharfbuzz-subset.so.0 so:libfontconfig.so.1 so:libpangoft2-1.0.so.0` |
| Arch | `python-pip pango` |

No-wheel / compile fallback adds dev packages (`gcc`, `python3-dev`, `libffi-dev`, JPEG/OpenJPEG headers) — see full-docs per distro.

```bash
python3 -m venv venv && source venv/bin/activate
pip install weasyprint && weasyprint --info
```

### Production notes

- **Headless servers**: install `fonts-liberation` or your brand fonts at OS level; empty PDFs are often missing fonts, not a broken pip install.
- **Alpine/musl**: prefer distro `weasyprint` or test wheels carefully; musl builds are fussier than glibc.
- **WSL on Windows**: treat as Linux; same matrix applies.

Alternatives: Conda (`conda-forge/weasyprint`), Docker images — useful when you cannot touch host Pango.

## Traps

- **pip without libpango** — `cannot load library 'libpango-1.0-0'` at import time.
- **Old enterprise Pango** — latest WeasyPrint imports fail or render wrong; pin ≤52.5 or upgrade Pango.
- **Mixing system `weasyprint` and venv** — `which weasyprint` may point at distro wrapper while app uses venv Python.
- **Ubuntu vs Debian package names** — HarfBuzz package names differ (`libharfbuzz0b` on Ubuntu).
- **Assuming pip bundles Pango** — it does not; native stack is always required on Linux.

---
## Further research
Official stable documentation: [Installation — Linux](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#linux)
