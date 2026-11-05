#!/bin/zsh -i
# Usage: design/run-design.sh  - builds design/imt-flow.pen from design/brief.md with pen CLI (headless)
cd ~/c-projects/imt-flow
pen --out design/imt-flow.pen \
  --prompt "$(cat design/brief.md)

The attached PNGs are the current POC screens: keep the flow, raise the quality a lot. Build every listed screen as its own top-level frame, side by side, with real Hebrew copy. Define tokens as variables. After each screen, judge it against a premium wellness app and fix what is weak." \
  --prompt-file design/poc-s0.png --prompt-file design/poc-s5.png --prompt-file design/poc-s8.png \
  --agent claude --export design/exports/imt-flow.png --usage design/usage/imt-flow.json \
  --max-failed-calls 40 > design/logs/imt-flow.log 2>&1
echo "pen exit $?"
