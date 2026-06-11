#!/usr/bin/env sh
# Render every CourtBouillon weasyprint-samples example to PDF (local preview / QA).
# Requires weasyprint on PATH. Runs jobs in parallel; PDFs are not committed.
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RENDER_ONE="$SCRIPT_DIR/render-courtbouillon-sample.sh"

if [ ! -x "$RENDER_ONE" ] && [ ! -f "$RENDER_ONE" ]; then
  echo "Missing $RENDER_ONE" >&2
  exit 1
fi

echo "Rendering all CourtBouillon samples (parallel)..."
for sample in ticket report poster flyer letter invoice book book-classical; do
  sh "$RENDER_ONE" "$sample" &
done
wait
echo "Done. Open PDFs under references/examples/<sample>/"
