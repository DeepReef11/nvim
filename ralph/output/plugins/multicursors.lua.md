# Plugin: multicursors.nvim

**File:** `lua/plugins/editor/multicursors.lua`
**Plugin:** smoka7/multicursors.nvim
**Status:** DISABLED (`enabled = false`)

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>m` | n | `<CMD>MCstart<CR>` | Start multicursor mode |
| `<Leader>m` | v | `<CMD>MCvisual<CR>` | Start multicursor from visual selection |
| `<C-Down>` | n | `<CMD>MCunderCursor<CR>` | Add cursor below current position |

## Notes

- Plugin requires `nvim-treesitter` and `hydra.nvim` as dependencies
- Uses floating hint window with rounded border at bottom of screen
- Plugin is currently disabled in this config
