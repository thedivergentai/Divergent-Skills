# Web Integration: Flask, Django & Auth

Server-side WeasyPrint **does not send browser cookies**. Protected assets 404 unless you bridge request context into the URL fetcher.

## The cookie trap

```python
# BROKEN — user's session cookie not sent to WeasyPrint HTTP client
def pdf_view(request):
    html = render_template("invoice.html")
    return HTML(string=html).write_pdf()
```

## Framework extensions (preferred)

| Extension | Framework |
|-----------|-----------|
| [Flask-WeasyPrint](https://github.com/Kozea/Flask-WeasyPrint) | Maps static paths to filesystem |
| [Django-WeasyPrint](https://github.com/fdemmer/django-weasyprint) | Resolves STATIC/MEDIA locally |

FastAPI/Starlette: copy their pattern — **disk resolve**, not HTTP loopback.

## Custom URLFetcher with auth

```python
from weasyprint import HTML
from weasyprint.urls import URLFetcher

class AuthFetcher(URLFetcher):
    def __init__(self, cookies, headers=None):
        super().__init__()
        self._cookies, self._headers = cookies, headers or {}

    def fetch(self, url, headers=None):
        return super().fetch(url, headers={**self._headers, **(headers or {})},
                             cookies=self._cookies)

def pdf_view(request):
    fetcher = AuthFetcher(cookies={"sessionid": request.COOKIES.get("sessionid", "")})
    html = render_to_string("invoice.html", request=request)
    return HTML(string=html, base_url=request.build_absolute_uri("/"),
                url_fetcher=fetcher.fetch).write_pdf()
```

**Trap:** Allowlist URLs in fetcher — SSRF risk. See `security-url-fetcher.md`.

## Self-signed SSL (same-server fetch)

Loopback HTTPS fails trust validation — images silently missing.

```bash
sudo cp localhost.crt /usr/local/share/ca-certificates/ && sudo update-ca-certificates
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
```

Better: filesystem paths or internal HTTP without TLS.

**Trap:** `verify=False` is dev-only.

## Security & response headers

Untrusted templates → [`security-untrusted-html.md`](security-untrusted-html.md): process limits, block `file://`, `presentational_hints=False`.

```python
response = HttpResponse(pdf, content_type="application/pdf")
response["Content-Disposition"] = 'inline; filename="invoice.pdf"'
```

## Further research

- [Include in Web Applications](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#include-in-web-applications)
- [Rights Management](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#rights-management)
- [Self-Signed SSL](https://doc.courtbouillon.org/weasyprint/stable/common_use_cases.html#server-side-requests-self-signed-ssl-certificates)
