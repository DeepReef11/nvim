# Plugin: nvim-scissors

**File:** `lua/plugins/scissors.lua`

## Overview
Snippet management plugin for creating and editing snippets.

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>asa` | n | `require("scissors").addNewSnippet()` | Add new snippet |
| `<Leader>ase` | n | `require("scissors").editSnippet()` | Edit snippet |
| `<Leader>asa` | x | `require("scissors").addNewSnippet()` | Add new snippet from selection |

## Which-Key Groups

| Prefix | Description |
|--------|-------------|
| `<leader>as` | Snippets (normal mode) |
| `<leader>as` | Snippets (visual mode) |

## Configuration Notes
- Snippet directory: `~/.config/nvim/snippets`
- Integrates with Telescope (optional dependency)
- Uses which-key for keybinding registration
