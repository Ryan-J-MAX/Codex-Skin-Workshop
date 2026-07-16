#!/bin/bash
set -euo pipefail
INSTALLED="$HOME/.codex/codex-theme-studio/scripts/verify-theme-studio-macos.sh"
OUTPUT="$HOME/Desktop/Codex Theme Studio Verification.png"
if [ ! -x "$INSTALLED" ]; then
  /usr/bin/osascript -e 'display alert "请先双击 Install Codex Theme Studio.command 完成安装。" as warning' >/dev/null
  exit 1
fi
"$INSTALLED" --screenshot "$OUTPUT"
/usr/bin/open "$OUTPUT"
