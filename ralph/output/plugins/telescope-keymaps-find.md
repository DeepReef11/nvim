# Telescope Find Keymaps

Source: `lua/plugins/telescope/keymaps/find.lua`

This file contains telescope keybindings focused on file finding and grep operations.

## Buffer Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader><leader>` | n | `builtin.buffers()` | Find existing buffers (sorted by last used) |
| `<leader>/` | n | `builtin.current_buffer_fuzzy_find()` | Fuzzily search in current buffer |

## File Search

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ff` | n | `builtin.find_files()` | Search Files |
| `<leader>Ff` | n | `builtin.find_files({ cwd = "~" })` | Search Files in Home |
| `<leader>fF` | n | `builtin.find_files({ hidden = true })` | Find . files (including hidden) |
| `<leader>f+` | n | `builtin.find_files({ hidden = true, no_ignore = true })` | Find . files (including hidden and git ignore) |
| `<leader>FF` | n | `builtin.find_files({ cwd = "~", hidden = true })` | Find . files in Home (including hidden) |
| `<leader>f.f` | n | `builtin.find_files()` in current buffer dir | Find file in current buffer's directory |

## Grep Search

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>fg` | n | `builtin.live_grep()` | Find by Grep in project files |
| `<leader>f.g` | n | `builtin.live_grep()` in current buffer dir | Find by Grep in current buffer's directory |
| `<leader>Fg` | n | `builtin.live_grep({ cwd = "~" })` | Find by Grep in Home |
| `<leader>FG` | n | `builtin.live_grep({ cwd = "~", hidden = true })` | Find by Grep in Home including hidden files |
| `<leader>fG` | n | `builtin.live_grep({ hidden = true })` | Find by grep in project files including hidden |
| `<leader>fo` | n | `builtin.live_grep({ grep_open_files = true })` | Find by grep in open files |

## Recent/Special Files

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>Fr` | n | `builtin.oldfiles()` | Find Recent Files |
| `<leader>FN` | n | `builtin.find_files({ cwd = stdpath("config") })` | Find Neovim config files |

## Fast Variants (No Preview)

### Fast File Search

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>fnf` | n | `builtin.find_files()` (dropdown) | Search Files (fast, no preview) |
| `<leader>Fnf` | n | `builtin.find_files({ cwd = "~" })` (dropdown) | Search Files in Home (fast, no preview) |
| `<leader>fnF` | n | `builtin.find_files({ hidden = true })` (dropdown) | Find . files including hidden (fast, no preview) |
| `<leader>fn+` | n | `builtin.find_files({ hidden = true, no_ignore = true })` (dropdown) | Find . files including hidden and git ignore (fast, no preview) |
| `<leader>FnF` | n | `builtin.find_files({ cwd = "~", hidden = true })` (dropdown) | Find . files in Home including hidden (fast, no preview) |

### Fast Grep Search

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>fng` | n | `builtin.live_grep()` (dropdown) | Find by Grep in project files (fast, no preview) |
| `<leader>fn.` | n | `builtin.live_grep()` in current buffer dir (dropdown) | Find by Grep in current buffer's directory (fast, no preview) |
| `<leader>Fng` | n | `builtin.live_grep({ cwd = "~" })` (dropdown) | Find by Grep in Home (fast, no preview) |
| `<leader>FnG` | n | `builtin.live_grep({ cwd = "~", hidden = true })` (dropdown) | Find by Grep in Home including hidden files (fast, no preview) |
| `<leader>fnG` | n | `builtin.live_grep({ grep_open_files = true })` (dropdown) | Find by grep in open files (fast, no preview) |

### Fast Recent/Special Files

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>Fnr` | n | `builtin.oldfiles()` (dropdown) | Find Recent Files (fast, no preview) |
| `<leader>Fnn` | n | `builtin.find_files({ cwd = stdpath("config") })` (dropdown) | Find Neovim files (fast, no preview) |

## Key Pattern Summary

- `<leader>f*` - Find operations in current project
- `<leader>F*` - Find operations in Home directory
- `<leader>*n*` - Fast variants with dropdown theme (no preview)
- `<leader>f.` - Operations relative to current buffer directory
- Uppercase suffix (e.g., `fG` vs `fg`) - Include hidden files
- `+` suffix - Include hidden AND gitignored files
