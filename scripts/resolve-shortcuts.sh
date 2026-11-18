#!/bin/sh
# Optional helper: print which shortcuts JSON would be used for the frontmost app.
# Installed as a global script — receives argv: appId pid (and FRONTMOST_* env).
set -eu

ROOT="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
APP_ID="${1:-${FRONTMOST_BUNDLE_ID:-}}"
APP_NAME="${FRONTMOST_APP_NAME:-}"
INDEX="$ROOT/apps/index.json"

if [ ! -f "$INDEX" ]; then
  echo "Missing $INDEX" >&2
  exit 1
fi

python3 - "$ROOT" "$APP_ID" "$APP_NAME" <<'PY'
import json, os, sys

root, app_id, app_name = sys.argv[1], sys.argv[2], sys.argv[3]
with open(os.path.join(root, "apps", "index.json"), encoding="utf-8") as f:
    index = json.load(f)

aliases = index.get("aliases") or {}
fallback = index.get("fallback") or "_default.json"

candidates = []
if app_id:
    candidates.append(aliases.get(app_id) or f"{app_id}.json")
if app_name:
    candidates.append(aliases.get(app_name) or f"{app_name}.json")
candidates.append(fallback)

chosen = None
for name in candidates:
    path = os.path.join(root, "apps", name)
    if os.path.isfile(path):
        chosen = path
        break

print(f"appId={app_id!r} appName={app_name!r}")
print(f"file={chosen or '(none)'}")
if chosen:
    with open(chosen, encoding="utf-8") as f:
        print(f.read())
PY
