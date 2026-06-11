# WeasyPrint Documentation (scraped archive)

- **Upstream**: https://doc.courtbouillon.org/weasyprint/stable/
- **Version**: WeasyPrint 69.0 (stable)
- **Scraped**: 2026-06-10
- **Total**: ~282 KB / ~7913 lines

## Agent Load Policy

**Prefer flat expert lessons at `references/` root** (`resource-matrix.md` catalog). Use this archive **only as last resort** when a lesson is insufficient.

| Rule | Detail |
|------|--------|
| **NEVER** bulk-load | One section at a time |
| **Prefer lessons** | `cli-basics.md`, `css-paged-media.md`, `pdf-a-archival.md`, etc. |
| **changelog.md** | Latest version block only, ≤80 lines — or use `debug-version-upgrades.md` |
| **api_reference.md** | One section, ≤120 lines |
| **Excluded** | contribute.md, support.md |

## Pages

| File | Lines | Size | Agent use |
|------|-------|------|----------|
| [api_reference.md](api_reference.md) | 1214 | 62 KB | Last resort, ≤120 lines/section |
| [changelog.md](changelog.md) | 4817 | 146 KB | Last resort — prefer `debug-version-upgrades.md` |
| [common_use_cases.md](common_use_cases.md) | 568 | 21 KB | Last resort, ≤120 lines/section |
| [contribute.md](contribute.md) | 78 | 2 KB | **Do not load** |
| [first_steps.md](first_steps.md) | 640 | 23 KB | Last resort, ≤120 lines/section |
| [going_further.md](going_further.md) | 223 | 11 KB | Last resort — prefer `debug-pipeline.md` |
| [index.md](index.md) | 196 | 8 KB | TOC only |
| [manpage.md](manpage.md) | 155 | 5 KB | Last resort — prefer `cli-basics.md` |
| [support.md](support.md) | 22 | 0 KB | **Do not load** |

Refresh: `python .resources/weasyprint/scripts/scrape_weasyprint_docs.py`
