# mini.surround Default Keybindings

## Overview

mini.surround is a Neovim Lua plugin that provides fast and feature-rich surround actions. It is part of the 'mini.nvim' library by echasnovski. The plugin allows you to add, delete, replace, find, and highlight surrounding pairs (brackets, quotes, tags, etc.) with minimal keystrokes. All text editing actions are dot-repeatable and respect `[count]` prefixes.

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `sa` | n, v | Add | Add surrounding around text object or visual selection |
| `sd` | n | Delete | Delete surrounding pair |
| `sr` | n | Replace | Replace surrounding pair with another |
| `sf` | n | Find Right | Find surrounding pair (move cursor to right part) |
| `sF` | n | Find Left | Find surrounding pair (move cursor to left part) |
| `sh` | n | Highlight | Highlight surrounding pair briefly |

## Extended Search Mappings

The following suffixes modify the search behavior for `sd`, `sr`, `sf`, `sF`, and `sh`:

| Suffix | Search Method | Example | Description |
|--------|---------------|---------|-------------|
| `n` | Next | `sdn)` | Apply action to next surrounding (search forward) |
| `l` | Previous/Last | `sdl)` | Apply action to previous surrounding (search backward) |

## Usage Examples

| Keys | Description |
|------|-------------|
| `saiw)` | Add parentheses around inner word |
| `sa2aw"` | Add double quotes around 2 words |
| `sd)` | Delete surrounding parentheses |
| `sr)"` | Replace surrounding parentheses with double quotes |
| `2sd)` | Delete second surrounding parentheses |
| `sdn)` | Delete next surrounding parentheses |
| `sdl)` | Delete previous surrounding parentheses |
| `sf)` | Find and move cursor to right parenthesis |
| `sF)` | Find and move cursor to left parenthesis |
| `sh}` | Highlight surrounding curly braces |

## Surrounding Identifiers

Common built-in surrounding identifiers:

| Key | Surrounding Type |
|-----|------------------|
| `)` or `(` | Parentheses `()` |
| `]` or `[` | Square brackets `[]` |
| `}` or `{` | Curly braces `{}` |
| `>` or `<` | Angle brackets `<>` |
| `'` | Single quotes |
| `"` | Double quotes |
| `` ` `` | Backticks |
| `t` | HTML/XML tags |
| `f` | Function call |
| `?` | Interactive (user prompted for left/right parts) |

## Important Notes

- When mappings start with `s` (as is default), the `s` key is mapped to `<Nop>` to prevent accidental triggering of Vim's built-in `s` (substitute) command. Use `cl` instead of `s` for substitution.
- All mappings are customizable via `config.mappings` during setup.
- Mappings can be disabled by setting them to empty strings (`''`).
- The plugin provides `MiniSurround.update_n_lines()` function for dynamically changing the search range, but no default keybinding is assigned to it.

## Sources

- [GitHub - echasnovski/mini.surround](https://github.com/nvim-mini/mini.surround)
- [mini.surround documentation](https://nvim-mini.org/mini.nvim/doc/mini-surround.html)
- [mini.nvim/doc/mini-surround.txt](https://github.com/echasnovski/mini.nvim/blob/main/doc/mini-surround.txt)
