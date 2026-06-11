#!/usr/bin/env bash
# Package the extension as a zip ready for AMO / Chrome Web Store upload.
# Only ships the files the extension needs at runtime (manifest must be at zip root).
set -euo pipefail

cd "$(dirname "$0")/.."

version=$(python3 -c "import json; print(json.load(open('manifest.json'))['version'])")
out="dist/bsky-to-mu-$version.zip"

mkdir -p dist
rm -f "$out"
zip -r "$out" manifest.json rules.json icons -x '.*'
echo "Created $out"
