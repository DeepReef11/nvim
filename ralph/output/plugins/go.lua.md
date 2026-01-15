# Plugin: go.nvim (lua/plugins/languages/go.lua)

**Status:** Disabled (`enabled = false`)

## Overview

This plugin provides Go language support via `ray-x/go.nvim`.

## Custom Keybindings

**No custom keybindings defined in this configuration file.**

The plugin uses default go.nvim keybindings when enabled.

## Dependencies

- ray-x/guihua.lua
- neovim/nvim-lspconfig
- nvim-treesitter/nvim-treesitter

## Notes

- Plugin is currently disabled
- Loads on `CmdlineEnter` event or when editing `go`/`gomod` files
- Uses default go.nvim configuration via `require("go").setup()`
