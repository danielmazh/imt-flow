#!/usr/bin/env bash
# Render the stick man loop with HyperFrames, then encode small phone files into ../assets.
# Needs Node 22+ and ffmpeg with libvpx-vp9 and libx264.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p renders ../assets
npx --yes hyperframes@0.9.17 check
# 1080x1080 VP9 with alpha (transparent background)
npx --yes hyperframes@0.9.17 render --format webm --quality delivery -o renders/stickman-1080.webm
SRC=renders/stickman-1080.webm
# WebM 540x540, VP9 with alpha
ffmpeg -v error -y -c:v libvpx-vp9 -i "$SRC" \
  -vf "scale=540:540:flags=lanczos,format=yuva420p" \
  -c:v libvpx-vp9 -pix_fmt yuva420p -b:v 0 -crf 34 -deadline good -cpu-used 1 -row-mt 1 -auto-alt-ref 0 -an \
  ../assets/stickman-tap.webm
# MP4 540x540 H.264 for iOS Safari, composited on #16222b (no alpha in H.264)
ffmpeg -v error -y -f lavfi -i "color=c=0x16222b:s=540x540:r=30:d=8,format=rgba" -c:v libvpx-vp9 -i "$SRC" \
  -filter_complex "[1:v]scale=540:540:flags=lanczos,format=rgba[f];[0:v][f]overlay=shortest=1:format=rgb,scale=out_color_matrix=bt709:out_range=tv,format=yuv420p[v]" \
  -map "[v]" -c:v libx264 -preset slow -crf 24 -profile:v high -tune animation \
  -colorspace bt709 -color_primaries bt709 -color_trc bt709 -color_range tv -movflags +faststart -an \
  ../assets/stickman-tap.mp4
# Poster: first frame
ffmpeg -v error -y -i ../assets/stickman-tap.mp4 -frames:v 1 -q:v 3 ../assets/stickman-tap.jpg
ls -la ../assets/stickman-tap.*
