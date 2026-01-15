# snacks.nvim Default Keybindings

> Documentation extracted from [folke/snacks.nvim](https://github.com/folke/snacks.nvim)
> Last updated: 2026-01-15

**Important Note:** snacks.nvim does not ship with global keybindings enabled out of the box. Users must explicitly configure keybindings in their setup. However, individual modules have their own default keys that work within their contexts (e.g., picker windows, terminal buffers).

---

## Table of Contents

- [Recommended Keybindings (Example Configuration)](#recommended-keybindings-example-configuration)
- [Picker Module Default Keys](#picker-module-default-keys)
- [Explorer Module Default Keys](#explorer-module-default-keys)
- [Terminal Module Default Keys](#terminal-module-default-keys)
- [Input Module Default Keys](#input-module-default-keys)
- [Scratch Module Default Keys](#scratch-module-default-keys)
- [GitHub (gh) Module Default Keys](#github-gh-module-default-keys)
- [Window Module Default Keys](#window-module-default-keys)

---

## Recommended Keybindings (Example Configuration)

These are the keybindings shown in the official example configuration. They are **not enabled by default** but represent the recommended setup.

### File Navigation

| Keymap | Mode | Function | Description |
|--------|------|----------|-------------|
| `<leader><space>` | n | `Snacks.picker.smart()` | Smart Find Files |
| `<leader>,` | n | `Snacks.picker.buffers()` | Buffers |
| `<leader>e` | n | `Snacks.explorer()` | File Explorer |
| `<leader>fb` | n | `Snacks.picker.buffers()` | Buffers |
| `<leader>fc` | n | `Snacks.picker.files({cwd=config})` | Find Config File |
| `<leader>ff` | n | `Snacks.picker.files()` | Find Files |
| `<leader>fg` | n | `Snacks.picker.git_files()` | Find Git Files |
| `<leader>fp` | n | `Snacks.picker.projects()` | Projects |
| `<leader>fr` | n | `Snacks.picker.recent()` | Recent |

### Search Operations

| Keymap | Mode | Function | Description |
|--------|------|----------|-------------|
| `<leader>/` | n | `Snacks.picker.grep()` | Grep |
| `<leader>:` | n | `Snacks.picker.command_history()` | Command History |
| `<leader>sb` | n | `Snacks.picker.lines()` | Buffer Lines |
| `<leader>sB` | n | `Snacks.picker.grep_buffers()` | Grep Open Buffers |
| `<leader>sg` | n | `Snacks.picker.grep()` | Grep |
| `<leader>sw` | n, x | `Snacks.picker.grep_word()` | Visual selection or word |
| `<leader>s"` | n | `Snacks.picker.registers()` | Registers |
| `<leader>s/` | n | `Snacks.picker.search_history()` | Search History |
| `<leader>sa` | n | `Snacks.picker.autocmds()` | Autocmds |
| `<leader>sc` | n | `Snacks.picker.command_history()` | Command History |
| `<leader>sC` | n | `Snacks.picker.commands()` | Commands |
| `<leader>sd` | n | `Snacks.picker.diagnostics()` | Diagnostics |
| `<leader>sD` | n | `Snacks.picker.diagnostics_buffer()` | Buffer Diagnostics |
| `<leader>sh` | n | `Snacks.picker.help()` | Help Pages |
| `<leader>sH` | n | `Snacks.picker.highlights()` | Highlights |
| `<leader>si` | n | `Snacks.picker.icons()` | Icons |
| `<leader>sj` | n | `Snacks.picker.jumps()` | Jumps |
| `<leader>sk` | n | `Snacks.picker.keymaps()` | Keymaps |
| `<leader>sl` | n | `Snacks.picker.loclist()` | Location List |
| `<leader>sm` | n | `Snacks.picker.marks()` | Marks |
| `<leader>sM` | n | `Snacks.picker.man()` | Man Pages |
| `<leader>sp` | n | `Snacks.picker.lazy()` | Search Plugin Spec |
| `<leader>sq` | n | `Snacks.picker.qflist()` | Quickfix List |
| `<leader>sR` | n | `Snacks.picker.resume()` | Resume |
| `<leader>su` | n | `Snacks.picker.undo()` | Undo History |

### Git Integration

| Keymap | Mode | Function | Description |
|--------|------|----------|-------------|
| `<leader>gb` | n | `Snacks.picker.git_branches()` | Git Branches |
| `<leader>gl` | n | `Snacks.picker.git_log()` | Git Log |
| `<leader>gL` | n | `Snacks.picker.git_log_line()` | Git Log Line |
| `<leader>gs` | n | `Snacks.picker.git_status()` | Git Status |
| `<leader>gS` | n | `Snacks.picker.git_stash()` | Git Stash |
| `<leader>gd` | n | `Snacks.picker.git_diff()` | Git Diff (Hunks) |
| `<leader>gf` | n | `Snacks.picker.git_log_file()` | Git Log File |
| `<leader>gi` | n | `Snacks.picker.gh_issue()` | GitHub Issues (open) |
| `<leader>gI` | n | `Snacks.picker.gh_issue({state="all"})` | GitHub Issues (all) |
| `<leader>gp` | n | `Snacks.picker.gh_pr()` | GitHub PRs (open) |
| `<leader>gP` | n | `Snacks.picker.gh_pr({state="all"})` | GitHub PRs (all) |
| `<leader>gB` | n, v | `Snacks.gitbrowse()` | Git Browse |
| `<leader>gg` | n | `Snacks.lazygit()` | Lazygit |

### LSP Features

| Keymap | Mode | Function | Description |
|--------|------|----------|-------------|
| `gd` | n | `Snacks.picker.lsp_definitions()` | Goto Definition |
| `gD` | n | `Snacks.picker.lsp_declarations()` | Goto Declaration |
| `gr` | n | `Snacks.picker.lsp_references()` | References |
| `gI` | n | `Snacks.picker.lsp_implementations()` | Goto Implementation |
| `gy` | n | `Snacks.picker.lsp_type_definitions()` | Goto Type Definition |
| `gai` | n | `Snacks.picker.lsp_incoming_calls()` | Calls Incoming |
| `gao` | n | `Snacks.picker.lsp_outgoing_calls()` | Calls Outgoing |
| `<leader>ss` | n | `Snacks.picker.lsp_symbols()` | LSP Symbols |
| `<leader>sS` | n | `Snacks.picker.lsp_workspace_symbols()` | LSP Workspace Symbols |

### UI Toggles & Utilities

| Keymap | Mode | Function | Description |
|--------|------|----------|-------------|
| `<leader>z` | n | `Snacks.zen()` | Toggle Zen Mode |
| `<leader>Z` | n | `Snacks.zen.zoom()` | Toggle Zoom |
| `<leader>.` | n | `Snacks.scratch()` | Toggle Scratch Buffer |
| `<leader>S` | n | `Snacks.scratch.select()` | Select Scratch Buffer |
| `<leader>bd` | n | `Snacks.bufdelete()` | Delete Buffer |
| `<leader>cR` | n | `Snacks.rename.rename_file()` | Rename File |
| `<leader>un` | n | `Snacks.notifier.hide()` | Dismiss All Notifications |
| `<leader>uC` | n | `Snacks.picker.colorschemes()` | Colorschemes |
| `<leader>n` | n | `Snacks.picker.notifications()` | Notification History |
| `<leader>N` | n | `Snacks.win({file=news})` | Neovim News |

### Terminal & Navigation

| Keymap | Mode | Function | Description |
|--------|------|----------|-------------|
| `<c-/>` | n | `Snacks.terminal()` | Toggle Terminal |
| `<c-_>` | n | `Snacks.terminal()` | Toggle Terminal (alternate) |
| `]]` | n, t | `Snacks.words.jump(count)` | Next Reference |
| `[[` | n, t | `Snacks.words.jump(-count)` | Previous Reference |

---

## Picker Module Default Keys

These keybindings are active **within the picker window** when it is open.

### Input Window Keys (`win.input.keys`)

| Keybinding | Action | Mode |
|------------|--------|------|
| `/` | toggle_focus | n, i |
| `<C-Down>` | history_forward | i, n |
| `<C-Up>` | history_back | i, n |
| `<C-c>` | cancel | i |
| `<C-w>` | delete word | i |
| `<CR>` | confirm | n, i |
| `<Down>` | list_down | i, n |
| `<Esc>` | cancel | n, i |
| `<S-CR>` | pick_win, jump | n, i |
| `<S-Tab>` | select_and_prev | i, n |
| `<Tab>` | select_and_next | i, n |
| `<Up>` | list_up | i, n |
| `<a-d>` | inspect | n, i |
| `<a-f>` | toggle_follow | i, n |
| `<a-h>` | toggle_hidden | i, n |
| `<a-i>` | toggle_ignored | i, n |
| `<a-m>` | toggle_maximize | i, n |
| `<a-p>` | toggle_preview | i, n |
| `<a-r>` | toggle_regex | i, n |
| `<a-w>` | cycle_win | i, n |
| `<c-a>` | select_all | n, i |
| `<c-b>` | preview_scroll_up | i, n |
| `<c-d>` | list_scroll_down | i, n |
| `<c-f>` | preview_scroll_down | i, n |
| `<c-g>` | toggle_live | i, n |
| `<c-j>` | list_down | i, n |
| `<c-k>` | list_up | i, n |
| `<c-n>` | list_down | i, n |
| `<c-p>` | list_up | i, n |
| `<c-q>` | qflist | i, n |
| `<c-r>#` | insert_alt | i |
| `<c-r>%` | insert_filename | i |
| `<c-r><c-a>` | insert_cWORD | i |
| `<c-r><c-f>` | insert_file | i |
| `<c-r><c-l>` | insert_line | i |
| `<c-r><c-p>` | insert_file_full | i |
| `<c-r><c-w>` | insert_cword | i |
| `<c-s>` | edit_split | i, n |
| `<c-t>` | tab | n, i |
| `<c-u>` | list_scroll_up | i, n |
| `<c-v>` | edit_vsplit | i, n |
| `<c-w>H` | layout_left | n, i |
| `<c-w>J` | layout_bottom | n, i |
| `<c-w>K` | layout_top | n, i |
| `<c-w>L` | layout_right | n, i |
| `?` | toggle_help_input | n, i |
| `G` | list_bottom | n, i |
| `gg` | list_top | n, i |
| `j` | list_down | n, i |
| `k` | list_up | n, i |
| `q` | cancel | n, i |

### List Window Keys (`win.list.keys`)

| Keybinding | Action | Mode |
|------------|--------|------|
| `/` | toggle_focus | n, i |
| `<2-LeftMouse>` | confirm | n |
| `<CR>` | confirm | n |
| `<Down>` | list_down | n |
| `<Esc>` | cancel | n |
| `<S-CR>` | pick_win, jump | n |
| `<S-Tab>` | select_and_prev | n, x |
| `<Tab>` | select_and_next | n, x |
| `<Up>` | list_up | n |
| `<a-d>` | inspect | n |
| `<a-f>` | toggle_follow | n |
| `<a-h>` | toggle_hidden | n |
| `<a-i>` | toggle_ignored | n |
| `<a-m>` | toggle_maximize | n |
| `<a-p>` | toggle_preview | n |
| `<a-w>` | cycle_win | n |
| `<c-a>` | select_all | n |
| `<c-b>` | preview_scroll_up | n |
| `<c-d>` | list_scroll_down | n |
| `<c-f>` | preview_scroll_down | n |
| `<c-g>` | print_path | n |
| `<c-j>` | list_down | n |
| `<c-k>` | list_up | n |
| `<c-n>` | list_down | n |
| `<c-p>` | list_up | n |
| `<c-q>` | qflist | n |
| `<c-s>` | edit_split | n |
| `<c-t>` | tab | n |
| `<c-u>` | list_scroll_up | n |
| `<c-v>` | edit_vsplit | n |
| `<c-w>H` | layout_left | n |
| `<c-w>J` | layout_bottom | n |
| `<c-w>K` | layout_top | n |
| `<c-w>L` | layout_right | n |
| `?` | toggle_help_list | n |
| `G` | list_bottom | n |
| `gg` | list_top | n |
| `i` | focus_input | n |
| `j` | list_down | n |
| `k` | list_up | n |
| `q` | cancel | n |
| `zb` | list_scroll_bottom | n |
| `zt` | list_scroll_top | n |
| `zz` | list_scroll_center | n |

### Preview Window Keys (`win.preview.keys`)

| Keybinding | Action | Mode |
|------------|--------|------|
| `<Esc>` | cancel | n |
| `q` | cancel | n |
| `i` | focus_input | n |
| `<a-w>` | cycle_win | n |

---

## Explorer Module Default Keys

These keybindings are active **within the explorer/file tree**.

### File Operations

| Keybinding | Action | Mode |
|------------|--------|------|
| `m` | Move selected files (or rename single file) | n |
| `c` | Copy selected files (or prompt for new name) | n |
| `r` | Rename current file | n |
| `d` | Delete current/selected files | n |
| `a` | Add new file or directory (append `/` for dirs) | n |
| `o` | Open file with system application | n |
| `u` | Update/refresh the file tree | n |
| `y` | Yank file paths to register | n |
| `p` | Paste (copy files from register) | n |

### Navigation

| Keybinding | Action | Mode |
|------------|--------|------|
| `<CR>` / `l` | Open file or toggle directory | n |
| `h` | Close directory | n |
| `<Backspace>` | Go up one directory | n |
| `.` | Focus on current directory (set as cwd) | n |
| `H` | Toggle hidden files | n |
| `I` | Toggle ignored files (gitignore) | n |
| `Z` | Close all directories | n |

### Quick Actions

| Keybinding | Action | Mode |
|------------|--------|------|
| `<leader>/` | Grep in current directory | n |
| `<C-t>` | Open terminal in current directory | n |
| `<C-c>` | Change tab directory to current directory | n |
| `P` | Toggle preview | n |

### Selection

| Keybinding | Action | Mode |
|------------|--------|------|
| `<Tab>` | Select/deselect files (multi-select) | n |
| `v` / `V` | Visual mode selection | n, x |

### Git & Diagnostics Navigation

| Keybinding | Action | Mode |
|------------|--------|------|
| `]g` / `[g` | Jump to next/previous git change | n |
| `]d` / `[d` | Jump to next/previous diagnostic | n |
| `]e` / `[e` | Jump to next/previous error | n |
| `]w` / `[w` | Jump to next/previous warning | n |

---

## Terminal Module Default Keys

These keybindings are active **within terminal buffers**.

| Keybinding | Action | Mode |
|------------|--------|------|
| `q` | Hide the terminal window | n |
| `gf` | Open file under cursor (closes terminal first) | n |
| `<esc><esc>` | Enter normal mode (double-press within 200ms) | t |

---

## Input Module Default Keys

These keybindings are active **within input prompts** (e.g., rename dialogs).

| Keybinding | Action | Mode |
|------------|--------|------|
| `<esc>` | Close completion menu or cancel | n |
| `<esc>` | Close completion menu or stop insert | i |
| `<cr>` | Accept completion or confirm | i, n |
| `<tab>` | Select next completion or trigger | i |
| `<c-w>` | Delete word (mapped to `<c-s-w>`) | i |
| `<up>` | Navigate history up | i, n |
| `<down>` | Navigate history down | i, n |
| `q` | Cancel input | n |

---

## Scratch Module Default Keys

### Lua Scratch Buffers

| Keybinding | Action | Mode |
|------------|--------|------|
| `<cr>` | Execute buffer/selection with `Snacks.debug.run()` | n, x |

### Scratch Picker Keys

| Keybinding | Action | Mode |
|------------|--------|------|
| `<c-x>` | Delete scratch buffer | n, i |
| `<c-n>` | Create new scratch buffer | n, i |

---

## GitHub (gh) Module Default Keys

These keybindings are active **within GitHub pickers** (issues, PRs).

| Keybinding | Action | Mode |
|------------|--------|------|
| `<cr>` | Select Action | n |
| `i` | Edit | n |
| `a` | Add Comment | n |
| `c` | Close | n |
| `o` | Reopen | n |

---

## Window Module Default Keys

Default keybinding for all snacks windows.

| Keybinding | Action | Mode |
|------------|--------|------|
| `q` | Close window | n |

---

## Sources

- [GitHub - folke/snacks.nvim](https://github.com/folke/snacks.nvim)
- [Picker Documentation](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md)
- [Explorer Documentation](https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md)
- [Input Documentation](https://github.com/folke/snacks.nvim/blob/main/docs/input.md)
- [Terminal Documentation](https://github.com/folke/snacks.nvim/blob/main/docs/terminal.md)
- [Scratch Documentation](https://github.com/folke/snacks.nvim/blob/main/docs/scratch.md)
- [GitHub Module Documentation](https://github.com/folke/snacks.nvim/blob/main/docs/gh.md)
