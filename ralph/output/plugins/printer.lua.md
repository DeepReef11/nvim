# Plugin: printer.nvim

**File:** `lua/plugins/code/printer.lua`
**Plugin:** `rareitems/printer.nvim`

## Description
A Neovim plugin for quickly adding print/console.log debugging statements.

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>cp` | n | operator | Print operator (configured via opts.keymap) |
| `gP` | n | `<Plug>(printer_print)iw` | Print inner word - adds print statement for word under cursor |

## Configuration Notes

- **behavior**: Set to `"yank"` - prints to default `"` register instead of inserting below cursor
- Supported filetypes: `lua`, `javascript`, `typescript`, `javascriptreact`, `typescriptreact`, `astro`
- Custom formatters defined for Lua and TypeScript/React
- Print statements include file path and line number via `add_to_inside` function
