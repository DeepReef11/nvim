# Alpha.nvim Keybindings

**Plugin:** goolord/alpha-nvim
**Source:** lua/plugins/ui/alpha.lua
**Type:** Dashboard/Startup Screen

## Dashboard Button Shortcuts

These keybindings are only active when the alpha dashboard is displayed (at startup or via command).

| Key | Action | Description |
|-----|--------|-------------|
| `s` | `<cmd>AutoSession search<CR>` | Session Lens - search and load sessions |
| `l` | `<cmd>AutoSession restore<CR>` | Load Last Session |
| `f` | `<cmd>Telescope find_files<CR>` | Find File |
| `w` | `require('plugins.telescope.other.multi-rg')()` | Find Word (multi-rg search) |
| `h` | `<cmd>Telescope oldfiles hidden=true<CR>` | Recents - recent files including hidden |
| `u` | `<cmd>Lazy update<CR>` | Update Plugins |
| `m` | `<cmd>Lazy<CR>` | Manage Plugins |

## Notes

- These are dashboard-only shortcuts, not global keybindings
- The button function creates normal mode mappings scoped to the alpha buffer
- Session management uses auto-session plugin
- File finding uses Telescope
- Plugin management uses lazy.nvim
