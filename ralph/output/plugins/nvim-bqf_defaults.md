# nvim-bqf Default Keybindings

## Overview

nvim-bqf (Better QuickFix) is a Neovim plugin that enhances the quickfix window with features like preview, fzf integration, item signing, and improved navigation. It polishes the old quickfix window experience with modern functionality.

## Default Keybindings

All keybindings work in the quickfix window (normal mode unless otherwise specified).

### Opening Items

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<CR>` | n | open | Open the item under cursor |
| `o` | n | openc | Open item and close quickfix window |
| `O` | n | drop | Use drop command to open item and close quickfix window |
| `t` | n | tab | Open item in a new tab |
| `T` | n | tabb | Open item in a new tab, but stay in quickfix window |
| `<C-t>` | n | tabc | Open item in a new tab and close quickfix window |
| `<C-x>` | n | split | Open item in a horizontal split |
| `<C-v>` | n | vsplit | Open item in a vertical split |

### Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-p>` | n | prevfile | Navigate to previous file under cursor in quickfix list |
| `<C-n>` | n | nextfile | Navigate to next file under cursor in quickfix list |
| `<` | n | prevhist | Cycle to previous quickfix list in history |
| `>` | n | nexthist | Cycle to next quickfix list in history |
| `'"` | n | lastleave | Go to last selected item when leaving quickfix window |

### Item Signing (Selection)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Tab>` | n | stoggledown | Toggle sign of item and move cursor down |
| `<S-Tab>` | n | stoggleup | Toggle sign of item and move cursor up |
| `<Tab>` | v | stogglevm | Toggle signs for multiple items in visual mode |
| `'<Tab>` | n | stogglebuf | Toggle signs for items in the same buffer as current item |
| `z<Tab>` | n | sclear | Clear all signs in current quickfix list |

### Preview Window

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-f>` | n | pscrolldown | Scroll preview window down half-page |
| `<C-b>` | n | pscrollup | Scroll preview window up half-page |
| `zo` | n | pscrollorig | Scroll preview window to original position |
| `zp` | n | ptogglemode | Toggle preview window between normal and max size |
| `p` | n | ptoggleitem | Toggle preview for an item |
| `P` | n | ptoggleauto | Toggle automatic preview when cursor moves |

### Filtering

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `zn` | n | filter | Create new quickfix list containing only signed items |
| `zN` | n | filterr | Create new quickfix list containing only unsigned items |
| `zf` | n | fzffilter | Enter fzf mode for fuzzy filtering |

## fzf Mode Keybindings

When in fzf mode (after pressing `zf`), the following keybindings are available:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-t>` | n | - | Open selected item in a new tab |
| `<C-x>` | n | - | Open selected item in a horizontal split |
| `<C-v>` | n | - | Open selected item in a vertical split |
| `<C-q>` | n | - | Toggle sign for selected items |
| `<C-c>` | n | - | Close quickfix window and abort fzf |

## Notes

- The `tabdrop` function exists but has no default keybinding assigned
- All function mappings can be customized via `require('bqf').setup({func_map = {...}})`
- fzf preview scrolling can be customized via `$FZF_DEFAULT_OPTS` or the `extra_opts` setup option
- Preview window features require the preview to be enabled (default: enabled)

## Customization Example

```lua
require('bqf').setup({
  func_map = {
    vsplit = '<C-v>',
    ptogglemode = 'zp',
    stoggleup = '<S-Tab>',
  },
  preview = {
    auto_preview = true,
    border = 'rounded',
  },
})
```

## References

- [GitHub Repository](https://github.com/kevinhwang91/nvim-bqf)
- [README Documentation](https://github.com/kevinhwang91/nvim-bqf/blob/main/README.md)
