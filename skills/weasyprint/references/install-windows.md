# WeasyPrint Install — Windows

**When to load**: Windows workstation or server — choosing between standalone exe vs Python library.

## Expert lesson

Two legitimate paths; pick by whether you need Python embedding.

### Path A — Standalone executable (no Python project)

Download the latest release binary from [GitHub releases](https://github.com/Kozea/WeasyPrint/releases). Run like the CLI:

```bat
weasyprint.exe input.html output.pdf -s page.css
```

**Antivirus false positives** are common ([#2081](https://github.com/Kozea/WeasyPrint/issues/2081), [#2092](https://github.com/Kozea/WeasyPrint/issues/2092)). Report to your AV vendor if blocked; do not treat detection as proof of malware.

Best for: ops scripts, users without Python, quick conversion. Not for Flask/Django integration.

### Path B — Python library (MSYS2 Pango)

WeasyPrint on Windows needs **Pango and GObject DLLs** not shipped with CPython.

1. Install [Python Install Manager](https://apps.microsoft.com/detail/9nq7512cxl7t) (or supported Python ≥ 3.10).
2. Install [MSYS2](https://www.msys2.org/) with defaults.
3. In the **MSYS2** shell (not cmd):

```bash
pacman -S mingw-w64-x86_64-pango
```

4. Close MSYS2; in **cmd**:

```bat
python -m venv venv
venv\Scripts\activate.bat
python -m pip install weasyprint
set WEASYPRINT_DLL_DIRECTORIES=C:/msys64/mingw64/bin
python -m weasyprint --info
```

`WEASYPRINT_DLL_DIRECTORIES` lists folders where `libpango-1.0-0.dll`, HarfBuzz, Fontconfig, etc. live. Use **forward slashes** in the path. Persist via System Environment Variables or `setx` for non-interactive services.

Default MSYS2 root is `C:\msys64`; adjust if installed elsewhere.

### WSL

Install as Linux inside WSL — often less friction than native Windows for server workloads. Host browser preview of PDFs still works via `\\wsl$\...`.

### .NET wrapper

Community [WeasyPrint-netcore](https://github.com/balbarak/WeasyPrint-netcore) exists for .NET shops; separate from official Python support.

## Traps

- **pip install without MSYS2 Pango** — import error `cannot load library 'libgobject-2.0-0'` / `libpango-...`.
- **Backslashes in `WEASYPRINT_DLL_DIRECTORIES`** — use `C:/msys64/mingw64/bin`.
- **Wrong MSYS2 toolchain** — need `mingw-w64-x86_64-pango`, not only MSYS2 base.
- **Forgetting env var in services** — IIS, Task Scheduler, and Docker Windows need DLL path in service env, not developer cmd.
- **Expecting exe + pip mix** — exe does not replace `import weasyprint` in your venv.

---
## Further research
Official stable documentation: [Installation — Windows](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#windows), [Troubleshooting — Missing Library](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#missing-library)
