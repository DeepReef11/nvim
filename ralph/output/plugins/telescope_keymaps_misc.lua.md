# Telescope Keymaps - Misc (telescope/keymaps/misc.lua)

## Keybindings Defined

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ns` | n | `<CMD>Telescope notify<CR>` | Search Notify |
| `<leader>rc` | n | `<cmd>TextCaseOpenTelescope<CR>` | Refactor case telescope |
| `<leader>rc` | v | `<cmd>TextCaseOpenTelescope<CR>` | Refactor case telescope |
| `gd` | n | `<cmd>Telescope lsp_definitions<CR>` | Telescope lsp definitions |

## Notes

- `<leader>ns` - Opens Telescope picker for nvim-notify history
- `<leader>rc` - Opens text-case.nvim Telescope picker for changing case (camelCase, snake_case, etc.)
- `gd` - Overrides Vim's default `gd` (go to local declaration) to use Telescope LSP definitions picker

## Potential Conflicts

- `gd` shadows Vim's default "go to local declaration" command
