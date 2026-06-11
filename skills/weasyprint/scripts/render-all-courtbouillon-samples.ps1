# Render every CourtBouillon weasyprint-samples example to PDF (local preview / QA).
$RenderOne = Join-Path $PSScriptRoot 'render-courtbouillon-sample.ps1'
$samples = @('ticket', 'report', 'poster', 'flyer', 'letter', 'invoice', 'book', 'book-classical')

Write-Host 'Rendering all CourtBouillon samples...'
foreach ($sample in $samples) {
    & $RenderOne $sample
}
Write-Host 'Done. Open PDFs under references/examples/<sample>/'
