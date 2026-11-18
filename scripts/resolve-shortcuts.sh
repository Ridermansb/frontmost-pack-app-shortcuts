#!/bin/sh
# List shortcut JSON files under apps/ (basename without .json = app id).
# Installed as a global script — receives argv: appId pid (and FRONTMOST_* env).
set -eu

ROOT="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
APPS="$ROOT/apps"

echo "appId=${1:-${FRONTMOST_BUNDLE_ID:-}}"
echo "appName=${FRONTMOST_APP_NAME:-}"
echo "apps=$APPS"
echo "---"

# Skip underscore-prefixed helpers (_default, _example).
for path in "$APPS"/*.json; do
  [ -f "$path" ] || continue
  name="$(basename "$path")"
  case "$name" in
    _*) continue ;;
  esac
  printf '%s\n' "$name"
done
