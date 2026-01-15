# Plugin: refactoring.nvim

**Source file:** `lua/plugins/refactoring.lua`
**Plugin:** ThePrimeagen/refactoring.nvim

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>re` | x | `:Refactor extract ` | Extract function |
| `<leader>rf` | x | `:Refactor extract_to_file ` | Extract function to file |
| `<leader>rv` | x | `:Refactor extract_var ` | Extract variable |
| `<leader>ri` | x, n | `:Refactor inline_var` | Inline variable |
| `<leader>rI` | n | `:Refactor inline_func` | Inline function |
| `<leader>rb` | n | `:Refactor extract_block` | Extract block |
| `<leader>rf` | n | `:Refactor extract_block_to_file` | Extract block to file |

## Notes

- Plugin requires treesitter and plenary as dependencies
- Note: `<leader>rf` is defined twice with different modes and actions:
  - In visual mode (x): Extract function to file
  - In normal mode (n): Extract block to file
