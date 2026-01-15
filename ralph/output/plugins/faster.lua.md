# Plugin: faster.nvim

**Source:** `lua/plugins/util/faster.lua`
**Plugin:** [pteroctopus/faster.nvim](https://github.com/pteroctopus/faster.nvim)

## Purpose

Performance optimization plugin that automatically disables heavy features:
- When opening **big files** (>2MB)
- When executing **macros**

## Keybindings

**None defined** - This plugin is configuration-only and does not define any keybindings.

## Configuration Summary

### Bigfile Behavior
When files larger than 2MB are opened, these features are disabled:
- illuminate
- matchparen
- lsp
- treesitter
- indent_blankline
- vimopts
- syntax
- filetype

### Fast Macro Behavior
When macros are executed, these features are disabled:
- lualine (prevents E5108 error on recursive macros)

## Notes

This plugin works automatically without user intervention - no keybindings needed.
