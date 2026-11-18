# Frontmost pack — App shortcuts (template)

Boilerplate [Config Pack](https://github.com/Ridermansb/react-frontmost-app/blob/master/docs/CONFIG_PACKS.md) for [Frontmost Reactor](https://github.com/Ridermansb/react-frontmost-app).

When you focus **Google Chrome** or **Cursor**, the companion shows a tip sheet rendered from JSON under `apps/` (in-app — not an HTML iframe).

This repository is a **GitHub Template** — use it to start your own pack, then point Frontmost Reactor at your local folder.

## Quick start

1. Click **Use this template** on GitHub (or clone this repo).
2. Edit / add JSON under `apps/`.
3. In Frontmost Reactor: **Settings → Packs → Add folder…** and select this folder.
4. Focus Chrome or Cursor — the **Shortcuts** tab should show the matching sheet.

After changing `frontmost.pack.json` or adding apps, **Reinstall** the pack (Settings → Packs).

## Layout

```text
frontmost-pack-app-shortcuts/
├── frontmost.pack.json     # manifesto (required)
├── apps/
│   ├── index.json          # optional alias map (for scripts / docs)
│   ├── Chrome.json         # Google Chrome (DevTools tips)
│   ├── Cursor.json         # Cursor tips
│   ├── _default.json       # fallback example
│   └── _example.json       # copy-me shape for a new app
├── ui/
│   └── viewer.html         # optional HTML experiment (not used by manifesto)
└── scripts/
    └── resolve-shortcuts.sh  # optional global: prints resolved file + JSON
```

## Add another app

1. Copy `apps/_example.json` → `apps/MyApp.json` and fill in shortcuts.
2. Add a `reactions[]` entry in `frontmost.pack.json`:

```json
{
  "kind": "ui",
  "name": "Shortcuts",
  "match": {
    "mode": "per-app",
    "appId": "com.example.MyApp",
    "appName": "My App"
  },
  "url": {
    "from": "file",
    "path": "apps/MyApp.json"
  }
}
```

3. Optionally register aliases in `apps/index.json` for scripts.
4. Reinstall the pack in Settings → Packs.

`appId` is the macOS bundle id when present (e.g. `com.google.Chrome`, `com.todesktop.230313mzl4w4u92`). On Windows/Linux it is often the app name.

Example sources used here:

- Chrome DevTools: https://developer.chrome.com/docs/devtools/shortcuts
- Cursor: https://cursor.com/docs/reference/keyboard-shortcuts

## Why JSON files (not HTML)?

Frontmost Reactor renders local `.json` tip sheets **in-app** via its privileged file reader. Loading arbitrary `file://` / `tiny-media://` HTML in an iframe is blocked from the Vite dev origin and is fragile across volumes — JSON tip sheets stay reliable.

## Topics

GitHub topic: `react-frontmost-app` (for later pack discovery).

## License

MIT — use this as a starting point for your own packs.
