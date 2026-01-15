# diffview.nvim Default Keybindings

**Plugin:** [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim)
**Description:** Single tabpage interface for easily cycling through diffs for all modified files for any git rev.

## Custom Keybindings (User Config)

These keybindings are defined in `lua/plugins/git.lua`:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>gd` | n | `toggle_file_history()` | diff file |
| `<Leader>gS` | n | `toggle_status()` | status |

## Default Plugin Keybindings

### View Maps (Active in Diff Buffers)

| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | `select_next_entry` | Open diff for next file |
| `<S-Tab>` | `select_prev_entry` | Open diff for previous file |
| `gf` | `goto_file` | Open local file in different tabpage |
| `<C-w><C-f>` | `goto_file_split` | Open local file in new split |
| `<C-w>gf` | `goto_file_tab` | Open local file in new tabpage |
| `<leader>e` | `focus_files` | Bring focus to file panel |
| `<leader>b` | `toggle_files` | Toggle file panel |
| `y` | `copy_hash` | Copy commit hash |

### File Panel Maps

| Key | Action | Description |
|-----|--------|-------------|
| `j` / `<Down>` | `next_entry` | Move cursor to next file entry |
| `k` / `<Up>` | `prev_entry` | Move cursor to previous file entry |
| `o` / `<CR>` / `<2-LeftMouse>` | `select_entry` | Open diff for selected file |
| `-` | `toggle_stage_entry` | Stage/unstage file entry |
| `S` | `stage_all` | Stage all entries |
| `U` | `unstage_all` | Unstage all entries |
| `X` | `restore_entry` | Revert file to left side state |
| `R` | `refresh_files` | Refresh file list |
| `L` | `open_commit_log` | Open commit log panel |
| `<c-b>` | `scroll_view(-0.25)` | Scroll view up |
| `<c-f>` | `scroll_view(0.25)` | Scroll view down |
| `<leader>e` | `focus_files` | Focus the file panel |
| `<leader>b` | `toggle_files` | Toggle the file panel |
| `g<C-x>` | `cycle_layout` | Cycle through diff layouts |
| `[x` | `prev_conflict` | Jump to previous conflict |
| `]x` | `next_conflict` | Jump to next conflict |
| `g?` | `help` | Show help |

### File History Panel Maps

| Key | Action | Description |
|-----|--------|-------------|
| `g!` | `options` | Open option panel |
| `<C-A-d>` | `open_in_diffview` | Open commit in new Diffview |
| `zR` | `open_all_folds` | Expand all folds |
| `zM` | `close_all_folds` | Close all folds |
| `j` / `<Down>` | `next_entry` | Move cursor to next entry |
| `k` / `<Up>` | `prev_entry` | Move cursor to previous entry |
| `o` / `<CR>` / `<2-LeftMouse>` | `select_entry` | Select entry |
| `y` | `copy_hash` | Copy commit hash |
| `L` | `open_commit_log` | Open commit log panel |

### Merge Tool Maps (3-way/4-way Merge)

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>co` | `conflict_choose("ours")` | Choose OURS version |
| `<leader>ct` | `conflict_choose("theirs")` | Choose THEIRS version |
| `<leader>cb` | `conflict_choose("base")` | Choose BASE version |
| `<leader>ca` | `conflict_choose("all")` | Choose all versions |
| `dx` | `conflict_choose("none")` | Delete conflict region |
| `<leader>cO` | `conflict_choose_all("ours")` | Choose OURS for all |
| `<leader>cT` | `conflict_choose_all("theirs")` | Choose THEIRS for all |
| `<leader>cB` | `conflict_choose_all("base")` | Choose BASE for all |
| `<leader>cA` | `conflict_choose_all("all")` | Choose all for all |
| `dX` | `conflict_choose_all("none")` | Delete all conflicts |
| `]x` | `next_conflict` | Jump to next conflict |
| `[x` | `prev_conflict` | Jump to previous conflict |

### Option Panel Maps

| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | `select_entry` | Change value of option |
| `q` | `close` | Close option panel |
| `g?` | `help` | Show help |

## Notes

- All mappings use `silent`, `nowait`, and `noremap` flags by default
- Set `disable_defaults = true` in config to disable all defaults
- Default `<Leader>e` and `<Leader>b` may conflict with common user keymaps
- The user config adds custom toggle functions via `<Leader>gd` and `<Leader>gS`
- No custom keymaps override the internal diffview mappings in this config

## Potential Conflicts

- `<leader>b` conflicts with potential buffer-related keymaps
- `<leader>e` conflicts with potential explorer/file keymaps
- These only apply when inside a Diffview tabpage

## Source

- [diffview.nvim GitHub](https://github.com/sindrets/diffview.nvim)
- [Documentation](https://github.com/sindrets/diffview.nvim/blob/main/doc/diffview.txt)
