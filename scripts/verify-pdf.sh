#!/usr/bin/env bash
set -euo pipefail

pdf=${1:-cv.pdf}
expected_pages=${EXPECTED_PAGES:-2}

for command in pdfinfo pdftotext; do
  if ! command -v "$command" >/dev/null 2>&1; then
    echo "error: $command is required (install poppler-utils)" >&2
    exit 2
  fi
done

if [[ ! -s "$pdf" ]]; then
  echo "error: missing or empty PDF: $pdf" >&2
  exit 1
fi

pages=$(pdfinfo "$pdf" | awk '/^Pages:/ {print $2}')
page_size=$(pdfinfo "$pdf" | awk -F: '/^Page size:/ {sub(/^[[:space:]]+/, "", $2); print $2}')

if [[ "$pages" != "$expected_pages" ]]; then
  echo "error: expected $expected_pages pages, found $pages" >&2
  exit 1
fi

if [[ "$page_size" != *"(A4)"* ]]; then
  echo "error: expected A4 pages, found: $page_size" >&2
  exit 1
fi

text_file=$(mktemp)
trap 'rm -f "$text_file"' EXIT
pdftotext "$pdf" "$text_file"

if ! grep -q 'Yipeng Xu' "$text_file"; then
  echo "error: expected CV text was not found; PDF may be malformed" >&2
  exit 1
fi

printf 'validated %s: %s pages, %s, searchable text present\n' "$pdf" "$pages" "$page_size"
