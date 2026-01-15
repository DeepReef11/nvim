# Plugin File: lua/plugins/telescope.lua

## Overview
Main telescope.nvim plugin configuration entry point.

## Plugin Definition
- **Plugin**: `nvim-telescope/telescope.nvim`
- **Dependencies**:
  - `nvim-lua/popup.nvim`
  - `nvim-lua/plenary.nvim`
  - `nvim-telescope/telescope-fzf-native.nvim` (with native build)
  - `cljoly/telescope-repo.nvim`
- **Lazy loading**: Loaded on `:Telescope` command

## Keybindings
This file delegates keybinding definitions to `plugins.telescope.keymaps`:
```lua
keys = function()
  return require("plugins.telescope.keymaps").get_all_keymaps()
end
```

**Note**: Actual keybindings are defined in:
- `lua/plugins/telescope/keymaps.lua` - main keymaps aggregator
- `lua/plugins/telescope/keymaps/find.lua` - file finding keymaps
- `lua/plugins/telescope/keymaps/search.lua` - search keymaps
- `lua/plugins/telescope/keymaps/misc.lua` - miscellaneous keymaps

See those files for detailed keybinding documentation.
