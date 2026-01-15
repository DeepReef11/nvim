# gitlinker.nvim Default Keybindings

## Overview

gitlinker.nvim is a Neovim plugin that generates shareable file permalinks (with line ranges) for git web frontend hosts like GitHub, GitLab, Bitbucket, and others. It's inspired by tpope/vim-fugitive's `:GBrowse` command and allows quick sharing of code references.

**Note:** There are two main versions:
- **ruifm/gitlinker.nvim** - Original plugin with built-in default keybindings
- **linrongbin16/gitlinker.nvim** - Maintained fork that provides commands instead of default keybindings

## Default Keybindings (ruifm/gitlinker.nvim)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gy` | n | `get_buf_range_url()` | Generate permalink for current line and copy to clipboard |
| `<leader>gy` | v | `get_buf_range_url()` | Generate permalink for visual selection range and copy to clipboard |

### Mode-Specific Behavior

- **Normal mode (`n`)**: Adds the current line number to the generated URL
- **Visual mode (`v`)**: Adds the line range of the visual selection to the URL

### Default Action

By default, the action callback is set to `require"gitlinker.actions".copy_to_clipboard`, which:
1. Copies the generated URL to your system clipboard
2. Prints the URL in `:messages`

## Recommended Additional Mappings

These are not default but commonly configured:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gb` | n, v | `get_buf_range_url()` with `open_in_browser` | Open permalink in browser |
| `<leader>gY` | n | `get_repo_url()` | Copy repository homepage URL to clipboard |
| `<leader>gB` | n | `get_repo_url()` with `open_in_browser` | Open repository homepage in browser |

## Disabling Default Mappings

To disable the default `<leader>gy` mapping:

```lua
require("gitlinker").setup({
  mappings = nil,
})
```

## linrongbin16/gitlinker.nvim (Maintained Fork)

The maintained fork does **not** include default keybindings. Instead, it provides the `GitLink` command:

| Command | Action | Description |
|---------|--------|-------------|
| `:GitLink` | Copy | Copy permalink to clipboard |
| `:GitLink!` | Open | Open permalink in browser |
| `:GitLink blame` | Copy | Copy blame link to clipboard |
| `:GitLink! blame` | Open | Open blame link in browser |
| `:GitLink default_branch` | Copy | Copy link to default branch (main/master) |
| `:GitLink current_branch` | Copy | Copy link to current branch |

### Recommended Mappings for Fork

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gy` | n, v | `:GitLink` | Copy permalink |
| `<leader>gY` | n, v | `:GitLink!` | Open permalink in browser |
| `<leader>gb` | n, v | `:GitLink blame` | Copy blame link |
| `<leader>gB` | n, v | `:GitLink! blame` | Open blame link |
| `<leader>gd` | n, v | `:GitLink default_branch` | Copy default branch link |
| `<leader>gD` | n, v | `:GitLink! default_branch` | Open default branch link |

## Sources

- [ruifm/gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim)
- [linrongbin16/gitlinker.nvim](https://github.com/linrongbin16/gitlinker.nvim)
