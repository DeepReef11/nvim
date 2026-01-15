# fzf-lua Default Keybindings

## Overview

fzf-lua is an improved version of fzf.vim written in Lua for Neovim. It provides a highly performant and featureful fuzzy finder that integrates with fzf, offering file finding, grep, LSP integration, git operations, and much more. The plugin uses two types of keymaps: builtin (Neovim terminal mode mappings) and fzf (native fzf binary bindings).

**Requirements:** Neovim >= 0.9, fzf > 0.36 or skim binary

## Default Keybindings

### Builtin Keymaps (Neovim Terminal Mode)

These keymaps are processed by Neovim and attached to the fzf window.

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<M-Esc>` | t | hide | Hide fzf-lua window (resume with `:FzfLua resume`) |
| `<F1>` | t | toggle-help | Display/hide help window |
| `<F2>` | t | toggle-fullscreen | Switch between fullscreen and windowed mode |
| `<F3>` | t | toggle-preview-wrap | Enable/disable line wrapping in preview (builtin previewer only) |
| `<F4>` | t | toggle-preview | Show/hide the preview panel |
| `<F5>` | t | toggle-preview-cw | Rotate preview clockwise/counter-clockwise |
| `<F6>` | t | toggle-preview-behavior | Cycle preview behavior modes (default/extend) |
| `<F7>` | t | toggle-preview-ts-ctx | Toggle treesitter context in preview (requires nvim-treesitter-context) |
| `<F8>` | t | preview-ts-ctx-dec | Decrease treesitter context lines |
| `<F9>` | t | preview-ts-ctx-inc | Increase treesitter context lines |
| `<S-Left>` | t | preview-reset | Reset preview position |
| `<S-Down>` | t | preview-page-down | Scroll preview down by one page |
| `<S-Up>` | t | preview-page-up | Scroll preview up by one page |
| `<M-S-Down>` | t | preview-down | Scroll preview down by line |
| `<M-S-Up>` | t | preview-up | Scroll preview up by line |

### FZF Native Keymaps

These keybindings are sent to fzf's `--bind=` flag and processed by the fzf binary.

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `ctrl-z` | fzf | abort | Cancel/abort fzf operation |
| `ctrl-u` | fzf | unix-line-discard | Clear current input line |
| `ctrl-f` | fzf | half-page-down | Move down half a page in results |
| `ctrl-b` | fzf | half-page-up | Move up half a page in results |
| `ctrl-a` | fzf | beginning-of-line | Jump to beginning of input line |
| `ctrl-e` | fzf | end-of-line | Jump to end of input line |
| `alt-a` | fzf | toggle-all | Select/deselect all items |
| `alt-g` | fzf | first | Jump to first item in list |
| `alt-G` | fzf | last | Jump to last item in list |
| `f3` | fzf | toggle-preview-wrap | Toggle line wrapping in preview |
| `f4` | fzf | toggle-preview | Show/hide preview |
| `shift-down` | fzf | preview-page-down | Page down in preview |
| `shift-up` | fzf | preview-page-up | Page up in preview |
| `alt-shift-down` | fzf | preview-down | Scroll preview down |
| `alt-shift-up` | fzf | preview-up | Scroll preview up |

### Default File Actions

These actions apply to file-related pickers: files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist, tags, btags, args, tagstack.

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `enter` | fzf | file_edit_or_qf | Open single selection or send multiple to quickfix |
| `ctrl-s` | fzf | file_split | Open file in horizontal split |
| `ctrl-v` | fzf | file_vsplit | Open file in vertical split |
| `ctrl-t` | fzf | file_tabedit | Open file in new tab |
| `alt-q` | fzf | file_sel_to_qf | Send selection to quickfix list |
| `alt-Q` | fzf | file_sel_to_ll | Send selection to location list |
| `alt-i` | fzf | toggle_ignore | Toggle ignore patterns |
| `alt-h` | fzf | toggle_hidden | Toggle hidden files visibility |
| `alt-f` | fzf | toggle_follow | Toggle following symlinks |

### Default Buffer Actions

These actions apply to buffer-related pickers: buffers, tabs, lines, blines.

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `enter` | fzf | buf_switch | Switch to selected buffer |
| `ctrl-x` | fzf | buf_del | Delete selected buffer (with reload) |

### Git Status Actions

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `enter` | fzf | file_edit | Open selected file |
| `right` | fzf | git_unstage | Unstage selected file (with reload) |
| `left` | fzf | git_stage | Stage selected file (with reload) |
| `ctrl-x` | fzf | git_reset | Reset selected file (with reload) |

### Git Branches Actions

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `enter` | fzf | git_switch | Switch to selected branch |
| `ctrl-x` | fzf | git_branch_del | Delete selected branch (with reload) |
| `ctrl-a` | fzf | git_branch_add | Add new branch from query (with reload) |

## Mini.sh Test Keybindings

When using the mini.sh sandbox script for testing, these Neovim-level keybindings are set:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-\>` | n | buffers | Open buffer picker |
| `<C-p>` | n | files | Open file picker |
| `<C-g>` | n | grep | Open grep picker |
| `<C-l>` | n | live_grep | Open live grep picker |
| `<C-k>` | n | builtin | Open builtin commands picker |
| `<F1>` | n | help_tags | Open Neovim help tags |

## Profiles

fzf-lua comes with preconfigured profiles that modify default behavior:

| Profile | Description |
|---------|-------------|
| `default` | fzf-lua defaults with neovim builtin previewer and devicons |
| `fzf-native` | Uses fzf's native previewing with bat |
| `telescope` | Closest match to telescope defaults in look, feel, and keybinds |
| `max-perf` | Similar to fzf-native with icons disabled for maximum performance |

## Notes

- **Keymap Syntax:** Use Neovim-style keymaps for `keymap.builtin` (e.g., `<C-c>`) and fzf-style for `keymap.fzf` (e.g., `ctrl-c`)
- **Inheritance:** To inherit defaults while adding custom keymaps, set `true` as the first element in the keymap table
- **Actions:** Actions define what happens when users select items; file actions inherit from `actions.files`, buffer actions from `actions.buffers`
- **Previewers:** The builtin (Neovim) and fzf-native previewers use different keymap systems

## Sources

- [GitHub - ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [fzf-lua Wiki - Home](https://github.com/ibhagwan/fzf-lua/wiki)
- [fzf-lua Wiki - Advanced](https://github.com/ibhagwan/fzf-lua/wiki/Advanced)
- [Actions and Keymaps - DeepWiki](https://deepwiki.com/ibhagwan/fzf-lua/5.2-keymaps-and-actions)
- [fzf-lua defaults.lua](https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/defaults.lua)
- [LazyVim fzf Extra](http://www.lazyvim.org/extras/editor/fzf)
