# Plugin: lualine.lua

## Source File
`lua/plugins/ui/lualine.lua`

## Plugin
`nvim-lualine/lualine.nvim` - A blazing fast and easy to configure Neovim statusline

## Keybindings Found

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `0` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `1` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `2` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `3` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `4` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `5` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `6` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `7` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `8` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |
| n | `9` | Track pending keys | Updates `vim.g.pending_keys` and redraws statusline (expr mapping) |

## Notes

- These mappings use `expr = true` to return the original key value while also tracking it
- The digit keys (0-9) are remapped to track count prefixes for display in the statusline
- This allows showing pending operator counts like `3d` in the statusline via `%S`
- The mappings preserve normal Vim behavior (motion counts, `0` for beginning of line, etc.)
- `CursorHold` autocmd clears the pending keys display after the cursor is idle
