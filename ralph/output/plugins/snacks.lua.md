# Plugin: snacks.nvim

**File:** `lua/plugins/snacks.lua`

## Status
All keybindings are **commented out** (disabled).

## Disabled Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gll` | n | `Snacks.lazygit()` | Lazygit (disabled) |
| `<leader>gla` | n | `Snacks.lazygit.log()` | Lazygit Log (cwd) (disabled) |
| `<leader>glc` | n | `Snacks.lazygit.log_file()` | Lazygit Current File History (disabled) |
| `<leader>z` | n | `Snacks.zen()` | Zen Mode (disabled) |
| `<leader>Z` | n | `Snacks.zen.zoom()` | Zoom Mode (disabled) |

## Configuration

The plugin has most features disabled:
- bigfile: disabled
- dashboard: disabled
- indent: disabled
- input: disabled
- notifier: disabled
- quickfile: disabled
- scroll: disabled
- statuscolumn: disabled
- words: disabled

## Notes
- The plugin is loaded eagerly (lazy = false) with high priority (1000)
- All keymaps are commented out, so no active bindings from this plugin
