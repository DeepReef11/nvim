# nvim-tree.lua Default Keybindings

All default keybindings for nvim-tree.lua file explorer. These mappings are active in the nvim-tree buffer and can be viewed by pressing `g?` within the tree.

## Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<CR>` | n | `api.node.open.edit` | Open file or directory |
| `o` | n | `api.node.open.edit` | Open file or directory |
| `<2-LeftMouse>` | n | `api.node.open.edit` | Double-click to open |
| `<Tab>` | n | `api.node.open.preview` | Open file in preview mode |
| `<C-e>` | n | `api.node.open.replace_tree_buffer` | Open file in place (replace tree buffer) |
| `<C-t>` | n | `api.node.open.tab` | Open file in new tab |
| `<C-v>` | n | `api.node.open.vertical` | Open file in vertical split |
| `<C-x>` | n | `api.node.open.horizontal` | Open file in horizontal split |
| `O` | n | `api.node.open.no_window_picker` | Open file without window picker |
| `P` | n | `api.node.navigate.parent` | Navigate to parent directory |
| `<BS>` | n | `api.node.navigate.parent_close` | Close parent directory |
| `>` | n | `api.node.navigate.sibling.next` | Navigate to next sibling |
| `<` | n | `api.node.navigate.sibling.prev` | Navigate to previous sibling |
| `J` | n | `api.node.navigate.sibling.last` | Jump to last sibling |
| `K` | n | `api.node.navigate.sibling.first` | Jump to first sibling |

## Directory Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-]>` | n | `api.tree.change_root_to_node` | Change root directory to selected node |
| `<2-RightMouse>` | n | `api.tree.change_root_to_node` | Double-right-click to change root |
| `-` | n | `api.tree.change_root_to_parent` | Navigate up to parent directory |
| `E` | n | `api.tree.expand_all` | Expand entire tree |
| `W` | n | `api.tree.collapse_all` | Collapse entire tree |
| `L` | n | `api.node.open.toggle_group_empty` | Toggle grouping of empty folders |

## File Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `a` | n | `api.fs.create` | Create new file or directory (add `/` suffix for directory) |
| `d` | n | `api.fs.remove` | Delete file or directory |
| `<Del>` | n | `api.fs.remove` | Delete file or directory |
| `D` | n | `api.fs.trash` | Move file or directory to trash |
| `r` | n | `api.fs.rename` | Rename file or directory |
| `e` | n | `api.fs.rename_basename` | Rename basename only (without extension) |
| `<C-r>` | n | `api.fs.rename_sub` | Rename omitting filename |
| `u` | n | `api.fs.rename_full` | Rename with full path |
| `x` | n | `api.fs.cut` | Cut file to clipboard |
| `c` | n | `api.fs.copy.node` | Copy file to clipboard |
| `p` | n | `api.fs.paste` | Paste from clipboard |
| `s` | n | `api.node.run.system` | Open with system default application |
| `.` | n | `api.node.run.cmd` | Run command on file |

## Copy Path Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `y` | n | `api.fs.copy.filename` | Copy filename to clipboard |
| `Y` | n | `api.fs.copy.relative_path` | Copy relative path to clipboard |
| `gy` | n | `api.fs.copy.absolute_path` | Copy absolute path to clipboard |
| `ge` | n | `api.fs.copy.basename` | Copy basename (name without extension) |

## Git Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `[c` | n | `api.node.navigate.git.prev` | Jump to previous git change |
| `]c` | n | `api.node.navigate.git.next` | Jump to next git change |

## Diagnostics Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `[e` | n | `api.node.navigate.diagnostics.prev` | Jump to previous diagnostic |
| `]e` | n | `api.node.navigate.diagnostics.next` | Jump to next diagnostic |

## Bookmarks / Marks

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `m` | n | `api.marks.toggle` | Toggle bookmark on file |
| `bd` | n | `api.marks.bulk.delete` | Delete all bookmarked files |
| `bt` | n | `api.marks.bulk.trash` | Trash all bookmarked files |
| `bmv` | n | `api.marks.bulk.move` | Move all bookmarked files |

## Filters

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `H` | n | `api.tree.toggle_hidden_filter` | Toggle dotfiles visibility |
| `I` | n | `api.tree.toggle_gitignore_filter` | Toggle git-ignored files visibility |
| `B` | n | `api.tree.toggle_no_buffer_filter` | Toggle files not in buffer |
| `C` | n | `api.tree.toggle_git_clean_filter` | Toggle git-clean files |
| `M` | n | `api.tree.toggle_no_bookmark_filter` | Toggle non-bookmarked files |
| `U` | n | `api.tree.toggle_custom_filter` | Toggle custom filter |
| `f` | n | `api.live_filter.start` | Start live filter (search) |
| `F` | n | `api.live_filter.clear` | Clear live filter |

## Search & Info

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `S` | n | `api.tree.search_node` | Search for node in tree |
| `<C-k>` | n | `api.node.show_info_popup` | Show file info popup |
| `g?` | n | `api.tree.toggle_help` | Toggle help / keybindings view |

## Tree Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `q` | n | `api.tree.close` | Close nvim-tree window |
| `R` | n | `api.tree.reload` | Refresh / reload the tree |

---

## Notes

- All keybindings operate in **Normal mode** (`n`) within the nvim-tree buffer
- Press `g?` in nvim-tree to see the help view with all mappings
- Default mappings can be customized via the `on_attach` configuration option
- Use `api.config.mappings.default_on_attach(bufnr)` in your custom `on_attach` function to load defaults before adding custom mappings

## Sources

- [nvim-tree.lua GitHub Repository](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-tree-lua.txt Documentation](https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt)
