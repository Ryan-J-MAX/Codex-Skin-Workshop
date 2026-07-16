#!/bin/bash
set -euo pipefail
INSTALLED="$HOME/.codex/codex-skin-workshop/scripts/restore-skin-workshop-macos.sh"
if [ ! -x "$INSTALLED" ]; then
  /usr/bin/osascript -e 'display alert "没有找到已安装的 Codex Skin Workshop。" as warning' >/dev/null
  exit 1
fi
exec "$INSTALLED" --restore-base-theme --restart-codex
