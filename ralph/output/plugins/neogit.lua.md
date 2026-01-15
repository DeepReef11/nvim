# Neogit Plugin Keybindings

**Plugin:** `NeogitOrg/neogit`
**Source:** `lua/plugins/neogit.lua`

## Custom Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>ggg` | n | `<cmd>Neogit<CR>` | Open Neogit |
| `<Leader>ggc` | n | `<cmd>Neogit commit<CR>` | Open Neogit commit |
| `<Leader>ggP` | n | `<cmd>Neogit push<CR>` | Push |
| `<Leader>ggp` | n | `<cmd>Neogit pull<CR>` | Pull |

## Notes

- Integrates with telescope.nvim for fuzzy finding
- Integrates with diffview.nvim for diff viewing
- Uses unicode graph style for commit history
- Worktrees section configured but hidden by default
