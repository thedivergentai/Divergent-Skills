# Tables of Contents, Running Headers & Cross-References

WeasyPrint implements CSS Generated Content Level 3 features that browsers ignore — the foundation for professional PDF navigation.

## Named Strings (`string-set`)

Capture text for reuse in margin boxes:

```css
h2 { string-set: heading content(); }
@page chapter { @top-center { content: string(heading); } }
```

Strings can embed static text, counters, cross-references, content, and attributes. Pair with named pages so headers update per chapter — see [`examples/book/book.css`](examples/book/book.css).

## Cross-References & TOC

Link TOC entries to section headings; pull page numbers and titles from targets:

```css
#contents a::after {
  content: leader(dotted) " " target-counter(attr(href), page);
}
```

Also available: `target-text(attr(href))` for heading text, and custom counters:

```css
h2 { counter-increment: h2-counter; }
#contents a::before { content: target-counter(attr(href), h2-counter) '. '; }
#contents a::after { content: target-counter(attr(href), page); }
```

**Classical dotted TOC** — [`examples/book/book-classical.css`](examples/book/book-classical.css):

```css
#contents a::after {
  content: target-text(attr(href)) ' ' leader('.') ' ' target-counter(attr(href), page);
}
```

## Leaders

`leader(dotted)`, `leader('.')`, and other styles fill space between TOC title and page number in `::before` / `::after` content.

## PDF Bookmarks

Control PDF outline (sidebar) with `bookmark-level`, `bookmark-label`, `bookmark-state`. UA stylesheet auto-bookmarks `<h1>`–`<h6>`; exclude with `bookmark-level: none`.

## End-to-End Samples

| Pattern | File |
|---------|------|
| Report TOC + running header | [`examples/report/report.css`](examples/report/report.css) |
| Book headers + TOC counters | [`examples/book/book.css`](examples/book/book.css) |
| Classical dotted TOC | [`examples/book/book-classical.css`](examples/book/book-classical.css) |

```bash
weasyprint report/report.html report/report.pdf
weasyprint -s book/book.css book/book.html book/book.pdf
```

**Not supported:** `content: open-quote` / `close-quote`.

## Further research

- [WeasyPrint stable documentation](https://doc.courtbouillon.org/weasyprint/stable/)
- [Named strings & cross-references](https://doc.courtbouillon.org/weasyprint/stable/api_reference.html#css-generated-content-module-level-3)
- [TOC example (GitHub #652)](https://github.com/Kozea/WeasyPrint/pull/652#issuecomment-403276559)
