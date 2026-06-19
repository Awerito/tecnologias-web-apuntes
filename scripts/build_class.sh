#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PANDOC_COMMAND="${PANDOC_COMMAND:-pandoc}"
PDF_ENGINE="${PDF_ENGINE:-xelatex}"
DATE_LOCALE="${DATE_LOCALE:-es_CL.utf8}"

if [ $# -ne 1 ]; then
  echo "Usage: $0 <class-folder>" >&2
  echo "Example: $0 06-react" >&2
  exit 1
fi

# Accepts a folder name (06-react) or a path
class_dir="$1"
[ -d "$ROOT_DIR/$class_dir" ] && class_dir="$ROOT_DIR/$class_dir"
class_dir="$(cd "$class_dir" && pwd)"

md_file="$(find "$class_dir" -maxdepth 1 -name '*.md' ! -name 'README.md' | head -1)"
if [ -z "$md_file" ]; then
  echo "No .md found in $class_dir" >&2
  exit 1
fi

# Today's date in long Spanish format: "09 de noviembre de 2025"
today="$(LC_TIME="$DATE_LOCALE" date '+%d de %B de %Y')"

# Rewrite the frontmatter date: field to today
sed -i -E "s/^date:.*/date: \"$today\"/" "$md_file"

base_name="$(basename "$md_file")"
output_name="${base_name%.md}.pdf"

echo "Date -> $today"
echo "Generating ${output_name}"
(
  cd "$class_dir"
  "$PANDOC_COMMAND" -t beamer --pdf-engine="$PDF_ENGINE" "$base_name" -o "$output_name"
)
