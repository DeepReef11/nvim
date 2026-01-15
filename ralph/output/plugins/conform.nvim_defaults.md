# conform.nvim Default Keybindings

**Plugin:** [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
**Purpose:** Lightweight yet powerful formatter plugin for Neovim

## Default Keybindings

**conform.nvim does not provide any default keybindings out of the box.**

The plugin is designed as a library-style tool where users configure their own keymappings. It provides:
- A `:ConformInfo` command to display configured formatters
- Format-on-save via autocmd (optional)
- The `conform.format()` function to call from custom keymaps

## Common Community Keybindings

These are commonly used keybindings recommended in documentation and community configs:

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>f` | `conform.format()` | Format buffer |
| n | `<leader>cf` | `conform.format()` | Format current buffer |
| n | `<leader>cF` | Format injected langs | Format embedded code blocks |
| n | `<leader>uf` | Toggle auto format | Toggle global autoformat |
| n | `<leader>uF` | Toggle auto format | Toggle buffer autoformat |

## User's Custom Keybindings

The user has configured the following custom keybindings in `lua/plugins/formatting.lua`:

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>bf` | `conform.format()` | Buffer Format (sync, 2000ms timeout) |
| v | `<leader>f` | `conform.format()` | Format selection (sync, 500ms timeout) |

### Commands

| Command | Description |
|---------|-------------|
| `:Format` | Format buffer or range (async, with LSP fallback) |
| `:ConformInfo` | Display configured and available formatters |

## Overrides Summary

- **`<leader>bf`** (Normal): Custom - Buffer Format
- **`<leader>f`** (Visual): Custom - Format selection
- **`:Format`**: Custom command for formatting with range support

## Notes

- Format-on-save is NOT enabled in the user's config (no `format_on_save` option set)
- Uses `prettierd` with `prettier` fallback for web languages
- Uses `stylua` for Lua, `black` for Python
- LSP fallback is enabled for all format operations
