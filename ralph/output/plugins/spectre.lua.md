# Plugin: nvim-spectre

**File:** `lua/plugins/spectre.lua`
**Plugin:** nvim-pack/nvim-spectre
**Load:** Lazy (on keypress)

## Custom Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>rp` | n | `require('spectre').open_visual({select_word=true})` | Refactor Project with spectre Search and replace |
| `<Leader>rp` | v | `require('spectre').open_visual()` | Refactor Project with spectre Search and replace |

## Notes

- Opens Spectre's search and replace panel
- In normal mode, auto-selects the word under cursor
- In visual mode, uses the selected text as search term
- Part of the refactoring keybinding group (`<Leader>r`)
