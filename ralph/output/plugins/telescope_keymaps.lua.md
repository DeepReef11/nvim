# Telescope Keymaps Module

**File:** `lua/plugins/telescope/keymaps.lua`

## Overview

This file is a module aggregator that combines telescope keymaps from three sub-modules:
- `plugins.telescope.keymaps.find` - File finding keymaps
- `plugins.telescope.keymaps.search` - Search-related keymaps
- `plugins.telescope.keymaps.misc` - Miscellaneous telescope keymaps

## Keybindings

No direct keybindings defined in this file. All keymaps are delegated to the sub-modules:
- See `telescope_keymaps_find.lua.md` for file finding keymaps
- See `telescope_keymaps_search.lua.md` for search keymaps
- See `telescope_keymaps_misc.lua.md` for miscellaneous keymaps

## Function

```lua
M.get_all_keymaps()
```
Returns a combined table of all telescope keymaps by merging results from `misc`, `files`, and `search` sub-modules.
