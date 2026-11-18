# Frontmost pack — App shortcuts (template)

Boilerplate [Config Pack](https://github.com/Ridermansb/react-frontmost-app/blob/master/docs/CONFIG_PACKS.md) for [Frontmost Reactor](https://github.com/Ridermansb/react-frontmost-app).

When the frontmost app changes, the companion opens a tip sheet built from a **JSON file under `apps/`**, chosen via `apps/index.json` (Chrome and Cursor included as examples).

This repository is a **GitHub Template** — use it to start your own pack, then point Frontmost Reactor at your local folder.

## Quick start

1. Click **Use this template** on GitHub (or clone this repo).
2. Edit / add JSON under `apps/` and aliases in `apps/index.json`.
3. In Frontmost Reactor: **Settings → Packs → Add folder…** and select this folder.
4. Focus Chrome or Cursor — the **Shortcuts** tab should show the matching sheet.

Reinstall the pack after manifesto or path changes (Settings → Packs → Reinstall).

## Layout

```text
frontmost-pack-app-shortcuts/
├── frontmost.pack.json     # manifesto (required)
├── apps/
│   ├── index.json          # app id / name → JSON file
│   ├── Chrome.json         # Google Chrome (DevTools tips)
│   ├── Cursor.json         # Cursor tips
│   ├── _default.json       # fallback when nothing matches
│   └── _example.json       # copy-me shape for a new app
├── ui/
│   └── viewer.html         # renders the resolved JSON
└── scripts/
    └── resolve-shortcuts.sh  # optional global: prints resolved file + JSON
```

## Add another app

1. Copy `apps/_example.json` → `apps/MyApp.json` and fill in shortcuts.
2. Add aliases in `apps/index.json` (bundle id **and** display name help a lot):

```json
"com.example.MyApp": "MyApp.json",
"My App": "MyApp.json"
```

3. Reinstall the pack in Settings → Packs.

Example sources used here:

- Chrome DevTools: https://developer.chrome.com/docs/devtools/shortcuts
- Cursor: https://cursor.com/docs/reference/keyboard-shortcuts

## Topics

GitHub topic: `react-frontmost-app` (for later pack discovery).

## License

MIT — use this as a starting point for your own packs.
