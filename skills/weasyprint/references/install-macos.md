# WeasyPrint Install — macOS

**When to load**: Mac dev machine, local PDF generation, or debugging `cannot load library` on Apple Silicon / Intel.

## Expert lesson

### Fastest path — Homebrew formula

```bash
brew install weasyprint
weasyprint --info
```

Pulls Python, Pango, and dependencies as a maintained stack. Good for CLI and ad-hoc use.

### App development — venv + pip

For projects pinned to a specific WeasyPrint version:

```bash
brew install pango   # native stack
python3 -m venv venv && source venv/bin/activate
pip install weasyprint
weasyprint --info
```

Verify Pango: `pango-view --version` (≥ 1.44 for current stable).

### Library path — Apple Silicon vs Intel

Homebrew on Apple Silicon uses `/opt/homebrew`; Intel uses `/usr/local`. If import fails with `cannot load library 'libpango-1.0-0'` (or similar dylib errors), Python cannot find brew-built libs:

```bash
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib:$DYLD_FALLBACK_LIBRARY_PATH
# Intel Homebrew:
# export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/lib:$DYLD_FALLBACK_LIBRARY_PATH
```

Confirm the directory actually contains `libpango-1.0.0.dylib` (and harfbuzz, fontconfig, gobject). Set the variable in shell profile, launchd plist, or IDE run config — not only in interactive terminal.

**Note**: macOS SIP and hardened runtimes can restrict `DYLD_*` in some spawned contexts (certain IDEs, sandboxed apps). If export works in Terminal but not in a GUI app, point the app’s environment or use the brew-installed `weasyprint` shim.

### MacPorts alternative

```bash
sudo port install py-pip pango libffi
python3 -m venv venv && source venv/bin/activate
pip install weasyprint
```

Less common than brew; keep Port’s lib path in mind for the same dylib issues.

### Conda

`conda-forge/weasyprint` bundles dependencies — viable when brew conflicts with corporate-managed Macs.

## Traps

- **Wrong Homebrew prefix** — `/opt/homebrew/lib` vs `/usr/local/lib` mismatch after migration or Rosetta confusion.
- **DYLD only in one terminal tab** — CI and GUI runners need the same env.
- **Xcode CLT without brew Pango** — pip alone does not install native text stack.
- **Old system Python** — use `python3` from brew or python.org (≥ 3.10).
- **Assuming Linux Docker fixes local Mac** — host still needs its own Pango for local dev.

---
## Further research
Official stable documentation: [Installation — macOS](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#macos), [Troubleshooting — Missing Library](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#missing-library)
