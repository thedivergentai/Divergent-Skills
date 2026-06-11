# Agent coordination (this repo)

## Subagent strategy

See [`.cursor/rules/subagent-strategy.mdc`](.cursor/rules/subagent-strategy.mdc) — **always applied** in this project.

Parent agents decompose work before dispatch. Three modes:

| Mode | Purpose |
|------|---------|
| **Research** | One topic per agent → dense output doc; parallel when sources are independent; always synthesize after |
| **Parallel** | Independent workstreams with no shared mutable state (distinct files, read-only exploration) |
| **Compressed** | Pre-decided repetitive edits; minimal context checklist — template at [`.cursor/templates/compressed-executor-prompt.md`](.cursor/templates/compressed-executor-prompt.md) |

Do not force parallel. Do not relay the raw user prompt to a single monolithic subagent.

## Global User Rule (all Cursor projects)

Paste into **Cursor Settings → Rules** for workspace-agnostic behavior:

```
Subagent discipline: Decompose before dispatch. Never relay the user's full prompt unchanged to one subagent.

Three modes:
1. Research — one topic/source per agent; write to a fixed path; return path + 5-bullet summary; synthesize after parallel research.
2. Parallel — only when all pass: distinct output paths, no same-file concurrent edits, no shared resources, failures are isolated. Never parallelize judge→fix loops or same-file refactors.
3. Compressed executor — checklist-only tasks with explicit file ownership; minimal thinking; parent already decided what to do.

Anti-patterns: monolithic "complete all todos" workers, false parallel on shared state, skipped synthesis after multi-agent research.
```

## Skill development layout

| Path | Purpose |
|------|---------|
| `skills/` | Agent-facing skill packages |
| `.resources/` | Per-skill maintenance: scrapers, evals (not loaded by agents) |
| `.scripts/` | Repo maintenance: link audits, README banner tooling (gitignored; not skills) |
| `.agent/workflows/` | Maintainer workflows (e.g. create-update-banner) |
| `assets/` | Public README images (hero/update banners) |

Examples: `skills/weasyprint/`, `.resources/weasyprint/`, `.scripts/audit_repo_links.py`
