# Web Performance: Images, Cache & Workers

WeasyPrint is slower than headless browsers. High-traffic endpoints: **do not render synchronously** without timeouts and queue depth limits.

## When NOT per-request

| Traffic | Architecture |
|---------|--------------|
| Low | Sync view with timeout |
| Medium | Celery/RQ job + poll/download |
| High | Worker pool, queue limits, object storage |

Return 202 + job ID; store PDF externally.

## optimize_images trade-off

```python
from weasyprint import HTML

HTML(url).write_pdf("lite.pdf", optimize_images=True, jpeg_quality=60, dpi=150)
```

| Parameter | Effect |
|-----------|--------|
| `optimize_images=True` | Recompress — CPU per asset |
| `jpeg_quality` | 60–85 reports; 95 print |
| `dpi` | 150 screen; 300 prepress |

**Trap:** `optimize_images` without cache = repeated CPU on every request for same logo.

## Shared cache dict

```python
cache = {}
for i in range(100):
    HTML(template_url).write_pdf(f"invoice-{i}.pdf", cache=cache,
                                 optimize_images=True, jpeg_quality=75, dpi=150)
```

Same dict across renders in a worker. New dict per request defeats caching.

## Disk cache (multi-worker)

```python
HTML(url).write_pdf("out.pdf", cache="/var/cache/weasyprint")
```

**Trap:** Invalidate cache path on deploy when templates/CSS change.

## Worker pattern

```python
@shared_task(time_limit=120, soft_time_limit=90)
def render_pdf(html, base_url):
    return HTML(string=html, base_url=base_url).write_pdf(
        cache=_process_cache, optimize_images=True, jpeg_quality=75)
```

Add container memory caps, concurrency limits — WeasyPrint is memory-hungry.

## Speed traps

| Slow | Faster |
|------|--------|
| Large CSS frameworks | Minimal print CSS |
| Multi-page `<table>` | Block layout |
| Thousands of DOM nodes | Paginate server-side |

Benchmarks: [WeasyPerf](https://kozea.github.io/WeasyPerf/)

```python
import logging
logging.getLogger("weasyprint").setLevel(logging.WARNING)
```

## Further research

- [Cache and Optimize Images](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#cache-and-optimize-images)
- [Improve Rendering Speed](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#improve-rendering-speed-and-memory-use)
