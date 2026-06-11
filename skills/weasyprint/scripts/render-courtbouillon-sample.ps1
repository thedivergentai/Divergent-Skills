# Render one CourtBouillon weasyprint-samples example to PDF (local preview / QA).
# Requires weasyprint on PATH. PDFs are written beside the sample HTML (not committed).
param(
    [Parameter(Position = 0)]
    [ValidateSet('ticket', 'report', 'poster', 'flyer', 'letter', 'invoice', 'book', 'book-classical', 'help')]
    [string]$Sample = 'help'
)

$Examples = Join-Path $PSScriptRoot '..\references\examples' | Resolve-Path

function Show-Usage {
    @"
Usage: .\scripts\render-courtbouillon-sample.ps1 <sample>

Samples: ticket, report, poster, flyer, letter, invoice, book, book-classical

Example:
  .\scripts\render-courtbouillon-sample.ps1 report
  Start-Process (Join-Path '$Examples' 'report\report.pdf')
"@
}

if ($Sample -eq 'help') {
    Show-Usage
    exit 0
}

Push-Location $Examples
try {
    switch ($Sample) {
        'ticket' { weasyprint ticket/ticket.html ticket/ticket.pdf; $out = 'ticket/ticket.pdf' }
        'report' { weasyprint report/report.html report/report.pdf; $out = 'report/report.pdf' }
        'poster' { weasyprint -s poster/poster.css poster/poster.html poster/poster.pdf; $out = 'poster/poster.pdf' }
        'flyer' { weasyprint -s poster/flyer.css poster/poster.html poster/flyer.pdf; $out = 'poster/flyer.pdf' }
        'letter' { weasyprint letter/letter.html letter/letter.pdf; $out = 'letter/letter.pdf' }
        'invoice' { weasyprint invoice/invoice.html invoice/invoice.pdf; $out = 'invoice/invoice.pdf' }
        'book' { weasyprint -s book/book.css book/book.html book/book.pdf; $out = 'book/book.pdf' }
        'book-classical' { weasyprint -s book/book-classical.css book/book.html book/book-classical.pdf; $out = 'book/book-classical.pdf' }
    }
    Write-Host "Wrote $(Join-Path $Examples $out)"
}
finally {
    Pop-Location
}
