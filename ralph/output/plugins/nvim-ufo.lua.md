# nvim-ufo.lua - Keybindings

**Plugin:** kevinhwang91/nvim-ufo
**Source:** `lua/plugins/nvim-ufo.lua`

## Custom Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `zR` | n | `require("ufo").openAllFolds` | Open all folds (overrides vim default) |
| `zM` | n | `require("ufo").closeAllFolds` | Close all folds (overrides vim default) |
| `zr` | n | `require("ufo").openFoldsExceptKinds` | Open folds except certain kinds |

## Notes

- This plugin enhances Neovim's native folding with LSP/treesitter support
- The keymaps `zR`, `zM`, and `zr` override Vim's default fold operations
- Provider selector uses LSP with indent fallback for most filetypes
- C files have folding disabled
