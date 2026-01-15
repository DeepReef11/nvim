# oil.lua - Plugin Keybindings

**Plugin:** stevearc/oil.nvim
**Source:** `lua/plugins/oil.lua`

## Global Keybindings (vim.keymap.set)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>e` | `require('oil').open_float(vim.fn.expand('%:p:h'))` | Open oil float at buffer location |
| n | `<leader>E` | `require('oil').open_float()` | Open oil float at cwd |

## Oil Buffer-Local Keybindings

These keybindings are active only within oil.nvim buffers (file explorer view):

| Key | Action | Description |
|-----|--------|-------------|
| `g?` | `actions.show_help` | Show help for oil keybindings |
| `<M-Up>` | `actions.parent` | Go to parent directory |
| `<M-Down>` | `actions.select` | Enter directory or open file |
| `<CR>` | `actions.select` | Enter directory or open file |
| `<C-s>` | `actions.select` (vertical) | Open the entry in a vertical split |
| `<C-h>` | `actions.select` (horizontal) | Open the entry in a horizontal split |
| `<C-t>` | `actions.select` (tab) | Open the entry in new tab |
| `<C-p>` | `actions.preview` | Preview file |
| `<C-c>` | `actions.close` | Close oil buffer |
| `<C-l>` | `actions.refresh` | Refresh oil view |
| `-` | `actions.parent` | Go to parent directory |
| `_` | `actions.open_cwd` | Open current working directory |
| `` ` `` | `actions.cd` | Change directory to current oil directory |
| `~` | `actions.cd` (tab scope) | :tcd to the current oil directory |
| `gs` | `actions.change_sort` | Change sort method |
| `gx` | `actions.open_external` | Open with external program |
| `g.` | `actions.toggle_hidden` | Toggle hidden files visibility |
| `g\` | `actions.toggle_trash` | Toggle trash view |

## Notes

- Oil uses `default_file_explorer = false` so it doesn't replace netrw by default
- `delete_to_trash = true` - deleted files go to trash
- Hidden files shown by default (`show_hidden = true`)
- Natural sorting enabled for human-friendly file ordering
