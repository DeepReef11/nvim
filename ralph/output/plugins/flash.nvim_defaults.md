# flash.nvim Default Keybindings

## Overview

flash.nvim is a Neovim plugin by folke that lets you navigate your code with search labels, enhanced character motions, and Treesitter integration. It provides a powerful way to jump anywhere in visible text using a minimal number of keystrokes.

**Note:** flash.nvim does not set up keybindings automatically. The keybindings below are the recommended defaults that users typically configure when setting up the plugin.

## Default Keybindings

### Core Jump Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `s` | n, x, o | `require("flash").jump()` | Flash jump - search and jump to any location with labels |
| `S` | n, x, o | `require("flash").treesitter()` | Flash Treesitter - select Treesitter nodes with labels |
| `r` | o | `require("flash").remote()` | Remote Flash - operate on remote location without moving cursor |
| `R` | o, x | `require("flash").treesitter_search()` | Treesitter Search - search and select Treesitter nodes |
| `<C-s>` | c | `require("flash").toggle()` | Toggle Flash Search during `/` or `?` search |

### Enhanced Character Motions

When `char` mode is enabled, flash.nvim enhances Vim's native character motions with labels:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `f` | n, x, o | Forward find | Jump to character forward with labels |
| `F` | n, x, o | Backward find | Jump to character backward with labels |
| `t` | n, x, o | Forward till | Jump till character forward with labels |
| `T` | n, x, o | Backward till | Jump till character backward with labels |
| `;` | n, x, o | Next match | Repeat last character motion forward |
| `,` | n, x, o | Previous match | Repeat last character motion backward |

## Mode Legend

| Mode | Description |
|------|-------------|
| n | Normal mode |
| v | Visual mode |
| x | Visual mode (select) |
| o | Operator-pending mode (after d, y, c, etc.) |
| c | Command-line mode |

## Configuration Notes

- By default, flash integration with regular search (`/` or `?`) is disabled. Toggle it with `<C-s>` or enable permanently with `modes = { search = { enabled = true } }`
- Labels default to `"asdfghjklqwertyuiopzxcvbnm"` for home row accessibility
- Search defaults: `multi_window = true`, `forward = true`, `wrap = true`
- To disable a default keybinding (e.g., `s` for surround): `keys = { { "s", mode = { "n", "x", "o" }, false } }`

## Sources

- [GitHub - folke/flash.nvim](https://github.com/folke/flash.nvim)
- [LazyVim Editor Plugins](http://www.lazyvim.org/plugins/editor)
