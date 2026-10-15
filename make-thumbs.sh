#!/bin/sh
# Regenerates web-sized JPEG thumbnails for every PNG render (macOS, uses sips).
cd "$(dirname "$0")"
for f in */*.png; do
  case "$f" in thumbs/*) continue;; esac
  out="thumbs/${f%.png}.jpg"
  [ -f "$out" ] && continue
  mkdir -p "$(dirname "$out")"
  sips -s format jpeg -s formatOptions 82 -Z 960 "$f" --out "$out" >/dev/null && echo "made $out"
done
