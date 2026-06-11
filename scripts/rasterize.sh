#!/usr/bin/env bash
# Rasterize icon.svg to the PNG sizes referenced by manifest.json.
# Requires rsvg-convert (brew install librsvg).
set -euo pipefail

cd "$(dirname "$0")/.."

sizes=(16 32 48 128)
mkdir -p icons

for size in "${sizes[@]}"; do
  rsvg-convert -w "$size" -h "$size" icon.svg -o "icons/icon-$size.png"
  echo "icons/icon-$size.png"
done
