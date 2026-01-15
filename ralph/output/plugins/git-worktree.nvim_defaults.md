# git-worktree.nvim Default Keybindings

## Overview

git-worktree.nvim by ThePrimeagen is a simple wrapper around git worktree operations, providing create, switch, and delete functionality directly from Neovim. The plugin integrates with Telescope for an interactive workflow.

**Note:** This plugin does not define global keybindings by default. Users must set up their own keymaps. However, when using the Telescope extension, certain keybindings are available within the Telescope picker window.

## Default Keybindings

### Telescope Picker Keybindings (git_worktrees)

These keybindings are active within the Telescope picker when viewing worktrees:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Enter>` | n | Switch worktree | Switches to the selected worktree |
| `<C-d>` | n | Delete worktree | Deletes the selected worktree |
| `<C-f>` | n | Toggle force delete | Toggles forcing of the next deletion operation |

### Telescope Picker Keybindings (create_git_worktree)

When creating a new worktree via Telescope:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Enter>` | n | Select branch | Selects the branch for the new worktree (or uses prompt as branch name if none selected) |

## No Global Keybindings

The plugin does not set any global keybindings. Users must manually configure keymaps for the following commands:

| Command | Description |
|---------|-------------|
| `:lua require('telescope').extensions.git_worktree.git_worktrees()` | Open Telescope picker to switch/delete worktrees |
| `:lua require('telescope').extensions.git_worktree.create_git_worktree()` | Open Telescope picker to create a new worktree |
| `require("git-worktree").create_worktree(path, branch, upstream)` | Create worktree programmatically |
| `require("git-worktree").switch_worktree(path)` | Switch worktree programmatically |
| `require("git-worktree").delete_worktree(path)` | Delete worktree programmatically |

## Common User-Defined Keybindings

A popular configuration pattern (not defaults, but commonly used):

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>gww` | n | List worktrees | Open Telescope picker to view/switch/delete worktrees |
| `<Leader>gwc` | n | Create worktree | Open Telescope picker to create a new worktree |

## Requirements

- NeoVim 0.5+
- plenary.nvim
- telescope.nvim (optional, for Telescope extension)

## Sources

- [ThePrimeagen/git-worktree.nvim GitHub](https://github.com/ThePrimeagen/git-worktree.nvim)
- [git-worktree.nvim README](https://github.com/ThePrimeagen/git-worktree.nvim/blob/master/README.md)
