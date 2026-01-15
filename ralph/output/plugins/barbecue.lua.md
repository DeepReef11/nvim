# Plugin: barbecue.nvim

**Source File:** `lua/plugins/ui/barbecue.lua`

## Description

barbecue.nvim is a VS Code-like winbar plugin that shows the current code context (breadcrumbs) using LSP.

## Custom Keybindings

**No custom keybindings defined in this configuration file.**

This plugin is primarily a UI enhancement that displays the current file path and LSP symbol context in the winbar. It does not define any interactive keybindings - it provides visual information only.

## Notes

- Depends on `nvim-navic` for LSP context
- Depends on `nvim-web-devicons` for file icons
- Uses custom theme colors matching the user's colorscheme
