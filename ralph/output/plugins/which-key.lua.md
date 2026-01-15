# Plugin: which-key.lua

**File**: `lua/plugins/which-key.lua`

## Overview
This file is a simple loader for the which-key.nvim plugin. The actual configuration is delegated to `plugins.which-key.setup`.

## Plugin Specification
- **Plugin**: `folke/which-key.nvim`
- **Event**: `VeryLazy`
- **Lazy**: `true`

## Keybindings
No keybindings defined directly in this file. Configuration is loaded from `lua/plugins/which-key/setup.lua`.

## Notes
which-key.nvim is a Neovim plugin that displays a popup with possible key bindings of the command you started typing. It helps discover available keybindings and provides visual documentation for existing mappings.
