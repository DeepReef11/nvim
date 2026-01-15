# telescope.nvim Default Keybindings

> **Plugin:** [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
> **Description:** Highly extendable fuzzy finder over lists
> **Last Updated:** 2026-01-15

## Overview

Telescope provides default keybindings for both **Insert mode** (i) and **Normal mode** (n) when inside a picker window. These mappings can be viewed interactively by pressing `<C-/>` (insert mode) or `?` (normal mode) while in a Telescope picker.

---

## Global Default Mappings

### Insert Mode (i)

| Key | Action | Description |
|-----|--------|-------------|
| `<C-n>` | `move_selection_next` | Move to next item in results |
| `<C-p>` | `move_selection_previous` | Move to previous item in results |
| `<Down>` | `move_selection_next` | Move to next item in results |
| `<Up>` | `move_selection_previous` | Move to previous item in results |
| `<CR>` | `select_default` | Open selected item (default action) |
| `<C-x>` | `select_horizontal` | Open in horizontal split |
| `<C-v>` | `select_vertical` | Open in vertical split |
| `<C-t>` | `select_tab` | Open in new tab |
| `<C-c>` | `close` | Close the picker |
| `<C-u>` | `preview_scrolling_up` | Scroll preview window up |
| `<C-d>` | `preview_scrolling_down` | Scroll preview window down |
| `<C-f>` | `preview_scrolling_left` | Scroll preview window left |
| `<C-k>` | `preview_scrolling_right` | Scroll preview window right |
| `<PageUp>` | `results_scrolling_up` | Scroll results window up |
| `<PageDown>` | `results_scrolling_down` | Scroll results window down |
| `<M-f>` | `results_scrolling_left` | Scroll results window left |
| `<M-k>` | `results_scrolling_right` | Scroll results window right |
| `<Tab>` | `toggle_selection` + `move_selection_worse` | Toggle selection and move down |
| `<S-Tab>` | `toggle_selection` + `move_selection_better` | Toggle selection and move up |
| `<C-q>` | `send_to_qflist` + `open_qflist` | Send all items to quickfix list |
| `<M-q>` | `send_selected_to_qflist` + `open_qflist` | Send selected items to quickfix |
| `<C-l>` | `complete_tag` | Autocomplete tag |
| `<C-/>` | `which_key` | Show available mappings |
| `<C-_>` | `which_key` | Show available mappings (alternate) |
| `<C-w>` | `<C-S-w>` command | Delete word before cursor |
| `<C-r><C-w>` | `insert_original_cword` | Insert word under cursor |
| `<C-r><C-a>` | `insert_original_cWORD` | Insert WORD under cursor |
| `<C-r><C-f>` | `insert_original_cfile` | Insert filename under cursor |
| `<C-r><C-l>` | `insert_original_cline` | Insert current line |
| `<C-j>` | `nop` | Disabled (no operation) |
| `<LeftMouse>` | `mouse_click` | Select item with mouse |
| `<2-LeftMouse>` | `double_mouse_click` | Double-click to open |

### Normal Mode (n)

| Key | Action | Description |
|-----|--------|-------------|
| `<esc>` | `close` | Close the picker |
| `<CR>` | `select_default` | Open selected item (default action) |
| `<C-x>` | `select_horizontal` | Open in horizontal split |
| `<C-v>` | `select_vertical` | Open in vertical split |
| `<C-t>` | `select_tab` | Open in new tab |
| `j` | `move_selection_next` | Move to next item |
| `k` | `move_selection_previous` | Move to previous item |
| `<Down>` | `move_selection_next` | Move to next item |
| `<Up>` | `move_selection_previous` | Move to previous item |
| `H` | `move_to_top` | Jump to top of results |
| `M` | `move_to_middle` | Jump to middle of results |
| `L` | `move_to_bottom` | Jump to bottom of results |
| `gg` | `move_to_top` | Jump to first item |
| `G` | `move_to_bottom` | Jump to last item |
| `<C-u>` | `preview_scrolling_up` | Scroll preview window up |
| `<C-d>` | `preview_scrolling_down` | Scroll preview window down |
| `<C-f>` | `preview_scrolling_left` | Scroll preview window left |
| `<C-k>` | `preview_scrolling_right` | Scroll preview window right |
| `<PageUp>` | `results_scrolling_up` | Scroll results window up |
| `<PageDown>` | `results_scrolling_down` | Scroll results window down |
| `<M-f>` | `results_scrolling_left` | Scroll results window left |
| `<M-k>` | `results_scrolling_right` | Scroll results window right |
| `<Tab>` | `toggle_selection` + `move_selection_worse` | Toggle selection and move down |
| `<S-Tab>` | `toggle_selection` + `move_selection_better` | Toggle selection and move up |
| `<C-q>` | `send_to_qflist` + `open_qflist` | Send all items to quickfix list |
| `<M-q>` | `send_selected_to_qflist` + `open_qflist` | Send selected items to quickfix |
| `?` | `which_key` | Show available mappings |
| `<LeftMouse>` | `mouse_click` | Select item with mouse |
| `<2-LeftMouse>` | `double_mouse_click` | Double-click to open |

---

## Picker-Specific Mappings

### Git Status Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<Tab>` | `git_staging_toggle` | i, n | Stage/unstage selected file |

### Git Branches Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<CR>` | `git_checkout` | i, n | Check out selected branch |
| `<C-t>` | `git_track_branch` | i, n | Track selected branch |
| `<C-r>` | `git_rebase_branch` | i, n | Rebase onto selected branch |
| `<C-a>` | `git_create_branch` | i, n | Create new branch |
| `<C-s>` | `git_switch_branch` | i, n | Switch to selected branch |
| `<C-d>` | `git_delete_branch` | i, n | Delete selected branch |
| `<C-y>` | `git_merge_branch` | i, n | Merge selected branch |

### Git Commits Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<CR>` | `git_checkout` | i, n | Check out selected commit |
| `<C-r>m` | `git_reset_mixed` | i, n | Reset mixed to selected commit |
| `<C-r>s` | `git_reset_soft` | i, n | Reset soft to selected commit |
| `<C-r>h` | `git_reset_hard` | i, n | Reset hard to selected commit |

### Git Stash Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<CR>` | `git_apply_stash` | i, n | Apply selected stash |

### Buffers Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<M-d>` | `delete_buffer` | i, n | Delete selected buffer |

### Command History Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<C-e>` | `edit_command_line` | i, n | Edit command in command-line |

### Search History Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<C-e>` | `edit_search_line` | i, n | Edit search in search line |

### Registers Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<C-e>` | `edit_register` | i, n | Edit selected register |

### Live Grep Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<C-Space>` | `to_fuzzy_refine` | i | Switch to fuzzy refinement |

### Pickers (Resume) Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<C-x>` | `remove_picker` | i, n | Remove selected picker from history |

### Quickfix History Picker

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<C-q>` | `open_qfhistory` | i, n | Open quickfix history |

---

## Mapping Priority System

Telescope uses a three-level priority system for keybindings (higher overrides lower):

1. **Built-in defaults** - Defined in `mappings.default_mappings`
2. **Setup configuration** - Defined in `telescope.setup()` under `defaults.mappings`
3. **Picker-specific** - Passed at runtime via picker options

---

## Viewing Available Mappings

While inside any Telescope picker:

- **Insert Mode:** Press `<C-/>` to show all available mappings
- **Normal Mode:** Press `?` to show all available mappings

This displays a floating window with all active keybindings for the current picker.

---

## Notes

- `<M-*>` denotes the Alt/Meta key (e.g., `<M-q>` is Alt+q)
- `<C-*>` denotes the Ctrl key (e.g., `<C-x>` is Ctrl+x)
- `<S-*>` denotes the Shift key (e.g., `<S-Tab>` is Shift+Tab)
- Some terminal emulators may not support all key combinations
- Multi-key sequences like `<C-r><C-w>` require pressing both combinations in sequence
