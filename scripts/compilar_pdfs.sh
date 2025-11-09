#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PANDOC_COMMAND="${PANDOC_COMMAND:-pandoc}"
PDF_ENGINE="${PDF_ENGINE:-xelatex}"

find "$ROOT_DIR" -type f -name '*.md' \
  ! -name 'README.md' \
  -print0 | sort -z | while IFS= read -r -d '' md_file; do
  base_name="$(basename "$md_file")"
  # Omite archivos auxiliares que no representan clases
  case "$base_name" in
    README.md|LICENSE.md)
      continue
      ;;
  esac

  dir_name="$(dirname "$md_file")"
  output_name="${base_name%.md}.pdf"
  rel_dir="${dir_name#$ROOT_DIR/}"

  echo "Generando ${rel_dir}/${output_name}"
  (
    cd "$dir_name"
    "$PANDOC_COMMAND" -t beamer --pdf-engine="$PDF_ENGINE" "$base_name" -o "$output_name"
  )
done
