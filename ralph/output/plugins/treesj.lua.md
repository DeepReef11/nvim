# treesj.lua - Keybinding Analysis

**Plugin:** Wansmer/treesj
**Status:** Disabled (using mini splitjoin instead)
**Source:** `lua/plugins/treesj.lua`

## Keybindings Defined

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gJ` | n | `<cmd>TSJToggle<CR>` | Toggle Split/Join |

## Notes

- Plugin is **disabled** (`enabled = false`) - user prefers mini splitjoin
- Default keymaps are disabled (`use_default_keymaps = false`)
- Commands available: `TSJToggle`, `TSJSplit`, `TSJJoin`
- The `gJ` keybinding is defined but not active due to plugin being disabled

## Potential Conflicts

- `gJ` conflicts with Vim's default `gJ` (join lines without spaces)
- However, since plugin is disabled, no actual conflict exists
