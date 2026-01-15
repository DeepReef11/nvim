# trouble.nvim Default Keybindings

**Plugin:** [folke/trouble.nvim](https://github.com/folke/trouble.nvim)

A pretty diagnostics, references, telescope results, quickfix and location list viewer for Neovim.

## Default Keybindings

These keybindings are active within the Trouble window.

### Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<cr>` | n | jump | Jump to the diagnostic location |
| `<2-leftmouse>` | n | jump | Jump to location (double-click) |
| `o` | n | jump_close | Jump to location and close Trouble |
| `<c-s>` | n | jump_split | Open location in horizontal split |
| `<c-v>` | n | jump_vsplit | Open location in vertical split |
| `}` | n | next | Go to next item |
| `]]` | n | next | Go to next item (alternative) |
| `{` | n | prev | Go to previous item |
| `[[` | n | prev | Go to previous item (alternative) |

### Window Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `q` | n | close | Close Trouble window |
| `<esc>` | n | cancel | Cancel and close |
| `?` | n | help | Show help |
| `r` | n | refresh | Refresh the diagnostics list |
| `R` | n | toggle_refresh | Toggle auto-refresh |

### Preview & Inspection

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `p` | n | preview | Preview the diagnostic |
| `P` | n | toggle_preview | Toggle preview mode |
| `i` | n | inspect | Inspect the item details |

### Filtering

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gb` | n | (filter) | Toggle current buffer filter |
| `s` | n | (filter) | Toggle severity filter |

### Folding

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `zo` | n | fold_open | Open fold under cursor |
| `zO` | n | fold_open_recursive | Open fold recursively |
| `zc` | n | fold_close | Close fold under cursor |
| `zC` | n | fold_close_recursive | Close fold recursively |
| `za` | n | fold_toggle | Toggle fold under cursor |
| `zA` | n | fold_toggle_recursive | Toggle fold recursively |
| `zm` | n | fold_more | Fold more |
| `zM` | n | fold_close_all | Close all folds |
| `zr` | n | fold_reduce | Reduce folding |
| `zR` | n | fold_open_all | Open all folds |
| `zx` | n | fold_update | Update folds |
| `zX` | n | fold_update_all | Update all folds |
| `zn` | n | fold_disable | Disable folding |
| `zN` | n | fold_enable | Enable folding |
| `zi` | n | fold_toggle_enable | Toggle fold enable |

### Deletion

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `dd` | n | delete | Delete item under cursor |
| `d` | v | delete | Delete selected items |

## Mode Legend

- `n` = Normal mode
- `v` = Visual mode

## Notes

- All keybindings are active only within the Trouble window
- The plugin uses standard Vim fold commands (`z*`) for fold management
- Navigation keys (`}`, `{`, `]]`, `[[`) follow Vim conventions
- Use `gb` to toggle showing only items from the current buffer
- Use `s` to cycle through severity filters (Error, Warning, Info, Hint)
