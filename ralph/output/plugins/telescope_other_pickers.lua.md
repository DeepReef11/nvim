# Plugin File: lua/plugins/telescope/other/pickers.lua

## Overview
This file defines custom Telescope picker functions for enhanced functionality. It does not define any keybindings directly.

## Custom Functions Defined

| Function | Description |
|----------|-------------|
| `M.my_git_commits` | Git commits with delta previewer |
| `M.my_git_bcommits` | Buffer git commits with delta previewer |
| `M.edit_neovim` | Open Neovim config files in dropdown |
| `M.project_files` | Try git_files first, fallback to find_files |
| `M.command_history` | Command history in dropdown theme |
| `M.buffer_search` | Buffer list in dropdown theme |

## Keybindings

**No keybindings defined in this file.**

This file exports utility functions that can be used by other keybinding configurations. The functions provide enhanced telescope pickers with delta integration for git diffs and dropdown themes for common operations.

## Notes
- Delta previewer provides enhanced diff viewing
- Functions are exported as a module (M) for use in other files
- These pickers are likely called from other keybinding files
