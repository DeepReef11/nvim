# Plugin: emmet-vim.lua

**Plugin:** mattn/emmet-vim
**Status:** DISABLED
**Source:** `lua/plugins/code/emmet-vim.lua`

## Description
Expand HTML abbreviations and wrap HTML tags easily.

## Custom Keybindings

**No custom keybindings defined.**

The plugin configuration has a commented-out leader key setting:
```lua
-- vim.g.user_emmet_leader_key = '<C-h>' --Doesnt work
```

## Notes
- Plugin is currently disabled (`enabled = false`)
- Default emmet leader key is `<C-y>` (not overridden)
- When enabled, emmet expansion would be triggered via `<C-y>,`
