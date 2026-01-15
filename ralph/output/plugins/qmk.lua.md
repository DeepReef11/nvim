# Plugin: qmk.nvim

**File:** `lua/plugins/qmk.lua`
**Plugin:** `codethread/qmk.nvim`
**Filetype:** `c`

## Description

QMK.nvim is a plugin for editing QMK keyboard firmware layouts within Neovim. It provides visual formatting for keyboard layout definitions in C files.

## Custom Keybindings

**No custom keybindings defined in this configuration.**

This plugin is configured with layout definitions but does not define any custom key mappings. It loads for C files and provides visual formatting/alignment for QMK keyboard layouts (LAYOUT_ansi_82 and LAYOUT_split_3x6_3).

## Notes

- Plugin loads only for C files (`ft = { "c" }`)
- Configures two keyboard layouts:
  - LAYOUT_ansi_82 (standard ANSI 82-key)
  - LAYOUT_split_3x6_3 (Corne split keyboard)
