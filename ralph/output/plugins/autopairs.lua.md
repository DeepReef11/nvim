# Plugin: autopairs.lua

## Overview
This file configures two autopair plugins:
1. `altermo/ultimate-autopair.nvim` - Alternative autopair plugin
2. `windwp/nvim-autopairs` - Standard autopairs (enabled)

## Keybindings

**No explicit keybindings defined.**

The autopairs plugins work automatically on `InsertEnter` event. The config explicitly removes key_map from rules (`i.key_map = nil`), relying on default behavior.

## Notes
- `ultimate-autopair.nvim` is pinned to v0.6 branch
- `nvim-autopairs` has default rule key mappings disabled
- Both plugins trigger on InsertEnter event
