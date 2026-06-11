# Flexbox & Grid in WeasyPrint

Both modules work for **simple** layouts. Neither is as battle-tested as block flow or paged media. Validate every PDF — do not assume browser parity.

## Flexbox (Level 1)

> "Works for simple use cases but is not deeply tested."

**Supported:** all `flex-*` properties, `align-*`, `justify-*`, `order`, plus `flex` and `flex-flow` shorthands.

### Reliable patterns

- Single-row toolbars, ticket stubs, invoice line items
- `display: flex` with explicit widths on children
- Simple `flex-direction: column` stacks

The **ticket** sample uses flex for a compact landscape layout — see [`examples/ticket/ticket.css`](examples/ticket/ticket.css).

### Risk areas

- Deeply nested flex with `flex-grow` / `flex-shrink` across page breaks
- `min-content` / `max-content` / `fit-content()` sizing (unsupported globally)
- Complex wrapping combined with fragmentation — test page breaks explicitly
- Flex items containing images with intrinsic sizing edge cases

**Fallback:** for multi-page documents, prefer block flow + floats or tables for tabular data.

## Grid (Level 2)

> "Works for simple cases, but has some limitations."

### Supported

- `display: grid` (not `inline-grid`)
- `grid-template-*`, `grid-auto-*`, all `grid-*` shorthands
- `fr` units, line names, `grid-template-areas`
- Auto rows/columns, `repeat(N, *)`, `minmax()`
- `align-*`, `justify-*`, `gap` / `*-gap`, dense auto-flow, `order`
- Margins, borders, padding on containers and items
- Fragmentation **between rows**

### Unsupported or untested

| Feature | Notes |
|---------|-------|
| `display: inline-grid` | Use `grid` |
| Auto content size for containers | Set explicit `grid-template` |
| `grid-auto-flow: column` | Use row flow |
| Subgrids | Not implemented |
| `repeat(auto-fill/fit, *)` | Use fixed `repeat(N, …)` |
| Auto margins on grid items | Set explicit alignment |
| `span` with line names / flexible tracks | Simplify track definitions |
| `safe` / `unsafe` alignments | Use default alignment |
| Baseline alignment | Use `start` / `center` |
| Grid items with intrinsic size (images) | Set explicit dimensions |
| Items larger than container | Constrain with fixed tracks |
| `min/max-width/height` on grid items | Avoid or test carefully |
| Absolutely positioned / floating grid items | Keep items in normal flow |
| Fragmentation **within** rows | Breaks between rows only |

## Decision Guide

```
Need headers/footers/TOC?     → Paged media (not flex/grid)
Simple horizontal bar?        → Flexbox (test once)
Fixed-column invoice table?   → Table or grid with explicit tracks
Multi-page complex dashboard? → Block flow; avoid grid until simplified
```

## Debugging Checklist

1. Simplify to a minimal grid/flex — does the PDF improve?
2. Replace `auto-fill` / `auto-fit` with fixed `repeat()`.
3. Give images explicit `width` / `height`.
4. Remove `min-content` / `max-content` from track sizes.
5. If layout spans pages badly, switch affected sections to block flow.

## Further research

- [WeasyPrint stable documentation](https://doc.courtbouillon.org/weasyprint/stable/)
- [CSS Flexible Box Layout](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#css-flexible-box-layout-module-level-1)
- [CSS Grid Layout Module Level 2](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#css-grid-layout-module-level-2)
