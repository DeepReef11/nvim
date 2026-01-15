# Plugin: claude-code.lua

**Plugin:** `greggh/claude-code.nvim`
**Status:** Disabled (`enabled = false`)

## Keybindings

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<C-.>` | Toggle Claude Code | Open/close Claude Code terminal |
| t | `<C-.>` | Toggle Claude Code | Toggle Claude Code from terminal mode |
| n | `<C-h/j/k/l>` | Window navigation | Navigate between windows (when enabled) |
| t | `<C-f>` | Page up | Scroll up in terminal (when enabled) |
| t | `<C-b>` | Page down | Scroll down in terminal (when enabled) |

## Notes

- Plugin is currently **disabled** in this configuration
- The `continue` and `verbose` variant keymaps are commented out / set to `false`
- Window navigation keymaps (`<C-h/j/k/l>`) are enabled
- Scrolling keymaps (`<C-f/b>`) are enabled

## Disabled/Commented Keybindings

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>cC` | Continue conversation | (commented out) |
| n | `<leader>cV` | Verbose mode | (commented out) |
