#!/usr/bin/env sh
# Render one CourtBouillon weasyprint-samples example to PDF (local preview / QA).
# Requires weasyprint on PATH. PDFs are written beside the sample HTML (not committed).
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EX="$SCRIPT_DIR/../references/examples"

usage() {
  cat <<'EOF'
Usage: render-courtbouillon-sample.sh <sample>

Samples:
  ticket           Event ticket (landscape, barcode font)
  report           Report with TOC and running headers
  poster           Large poster layout (poster.css)
  flyer            Same HTML as poster, flyer.css stylesheet
  letter           Letterhead letter
  invoice          Business invoice
  book             Book layout (book.css)
  book-classical   Book with classical dotted TOC stylesheet

Example:
  sh scripts/render-courtbouillon-sample.sh report
  open references/examples/report/report.pdf
EOF
}

if [ ! -d "$EX" ]; then
  echo "Examples directory not found: $EX" >&2
  exit 1
fi

cd "$EX"

case "${1:-}" in
  ticket)
    weasyprint ticket/ticket.html ticket/ticket.pdf
    echo "Wrote $EX/ticket/ticket.pdf"
    ;;
  report)
    weasyprint report/report.html report/report.pdf
    echo "Wrote $EX/report/report.pdf"
    ;;
  poster)
    weasyprint -s poster/poster.css poster/poster.html poster/poster.pdf
    echo "Wrote $EX/poster/poster.pdf"
    ;;
  flyer)
    weasyprint -s poster/flyer.css poster/poster.html poster/flyer.pdf
    echo "Wrote $EX/poster/flyer.pdf"
    ;;
  letter)
    weasyprint letter/letter.html letter/letter.pdf
    echo "Wrote $EX/letter/letter.pdf"
    ;;
  invoice)
    weasyprint invoice/invoice.html invoice/invoice.pdf
    echo "Wrote $EX/invoice/invoice.pdf"
    ;;
  book)
    weasyprint -s book/book.css book/book.html book/book.pdf
    echo "Wrote $EX/book/book.pdf"
    ;;
  book-classical)
    weasyprint -s book/book-classical.css book/book.html book/book-classical.pdf
    echo "Wrote $EX/book/book-classical.pdf"
    ;;
  -h|--help|help|"")
    usage
    exit 0
    ;;
  *)
    echo "Unknown sample: $1" >&2
    usage
    exit 1
    ;;
esac
