#!/bin/bash
set -euo pipefail
INSTALLED="$HOME/.codex/codex-theme-studio/scripts/restore-theme-studio-macos.sh"
if [ ! -x "$INSTALLED" ]; then
  /usr/bin/osascript -e 'display alert "没有找到已安装的 Codex Theme Studio。" as warning' >/dev/null
  exit 1
fi
exec "$INSTALLED" --restore-base-theme --restart-codex
