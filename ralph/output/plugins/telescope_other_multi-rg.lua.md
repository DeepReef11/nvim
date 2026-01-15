# Telescope Multi-RG Custom Picker

**File:** `lua/plugins/telescope/other/multi-rg.lua`

## Description

This is a custom telescope ripgrep picker that accepts predefined shortcuts after two spaces in input.
The shortcuts filter files by selected extension only.

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<S-P>` | n | Open multi-rg picker | Open the custom ripgrep picker with shortcuts (mentioned in comments, binding defined elsewhere) |

## Shortcuts (In-Picker)

When using this picker, type your search pattern followed by two spaces and a shortcut:

| Shortcut | File Pattern | Description |
|----------|--------------|-------------|
| `c` | `*.c` | C files |
| `js` | `*.{js,jsx}` | JavaScript/JSX files |
| `json` | `*.json` | JSON files |
| `l` or `lua` | `*.lua` | Lua files |
| `md` | `*.md` | Markdown files |
| `styles` | `{styles.tsx,styles.ts,styles.js,*.styles.tsx,*.styles.ts,*.styles.js}` | Style files |
| `stories` | `{stories.tsx,stories.ts,stories.js,*.stories.tsx,*.stories.ts,*.stories.js}` | Storybook files |
| `test` or `tests` | `*{.test.tsx,.test.ts,.test.js,-test.tsx,-test.ts,-test.js}` | Test files |
| `typescript` | `*.ts` | TypeScript files |
| `ts` | `*.{ts,tsx}` (excluding tests) | TypeScript/TSX files without tests |
| `tsx` | `*.tsx` (excluding tests) | TSX files without tests |
| `xml` | `*.xml` | XML files |

## Usage Example

To search for "useState" only in TypeScript files:
```
useState  ts
```
(Note: two spaces before the shortcut)

## Notes

- This picker provides a debounce of 100ms for performance
- Uses ripgrep with smart-case matching
- The actual keybinding `<S-P>` to invoke this picker is defined elsewhere (likely in telescope keymaps)
