#!/bin/bash
set -euo pipefail
INSTALLED="$HOME/.codex/codex-skin-workshop/scripts/verify-skin-workshop-macos.sh"
OUTPUT="$HOME/Desktop/Codex Skin Workshop Verification.png"
if [ ! -x "$INSTALLED" ]; then
  /usr/bin/osascript -e 'display alert "请先双击 Install Codex Skin Workshop.command 完成安装。" as warning' >/dev/null
  exit 1
fi
"$INSTALLED" --screenshot "$OUTPUT"
/usr/bin/open "$OUTPUT"
