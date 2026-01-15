# nvim-autopairs Default Keybindings

## Overview

nvim-autopairs is a minimalist autopairs plugin for Neovim written in Lua. It automatically inserts closing brackets, quotes, and other paired characters when you type the opening character. The plugin operates primarily in insert mode and is designed to be non-intrusive, integrating seamlessly with existing editing workflows rather than imposing new keybindings.

**Repository:** [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

**Requirements:** Neovim 0.7+

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `(`, `[`, `{`, `"`, `'`, `` ` `` | i | Auto-insert closing pair | When typing an opening character, the closing character is automatically inserted |
| `)`, `]`, `}`, `"`, `'`, `` ` `` | i | Skip over closing pair | When cursor is before a closing character, typing it moves past instead of inserting |
| `<CR>` (Enter) | i | Smart newline | Adds newline with proper indentation between pairs (e.g., `{|}` becomes `{\n|\n}`) |
| `<BS>` (Backspace) | i | Delete pair | Deletes both opening and closing characters when cursor is between empty pairs |

## Optional Keybindings (Disabled by Default)

| Key | Mode | Action | Description | Config Option |
|-----|------|--------|-------------|---------------|
| `<C-h>` | i | Delete pair | Alternative to Backspace for deleting pairs | `map_c_h = true` |
| `<C-w>` | i | Delete pair with word | Deletes pair along with surrounding whitespace | `map_c_w = true` |

## Fast Wrap Feature (Requires Configuration)

Fast Wrap allows you to quickly wrap text or expressions with pair characters. This feature must be explicitly enabled in configuration.

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<M-e>` (Alt+e) | i | Trigger fast wrap | Opens fast wrap mode to select wrapping character and position |
| `h` | - | Before position | Move wrap position before target (in fast wrap mode) |
| `l` | - | After position | Move wrap position after target (in fast wrap mode) |
| `$` | - | End position | Move to end of line (in fast wrap mode) |
| `q-l` keys | - | Position selection | Jump to specific positions marked in the buffer |

### Fast Wrap Configuration Example

```lua
require('nvim-autopairs').setup({
  fast_wrap = {
    map = '<M-e>',                        -- Trigger key
    chars = { '{', '[', '(', '"', "'" },  -- Wrapping characters
    pattern = [=[[%'%"%>%]%)%}%,]]=],     -- Pattern for end of string
    end_key = '$',                        -- Move to end key
    before_key = 'h',                     -- Position before key
    after_key = 'l',                      -- Position after key
    cursor_pos_before = true,             -- Cursor position after wrap
    keys = 'qwertyuiopzxcvbnmasdfghjkl',  -- Position selection keys
    manual_position = true,               -- Manual position selection
    highlight = 'Search',                 -- Highlight group
    highlight_grey = 'Comment',           -- Grey highlight group
  },
})
```

## Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| `map_cr` | `true` | Enable `<CR>` mapping for smart newline between pairs |
| `map_bs` | `true` | Enable `<BS>` mapping to delete pairs |
| `map_c_h` | `false` | Enable `<C-h>` mapping (alternative to Backspace) |
| `map_c_w` | `false` | Enable `<C-w>` mapping to delete pairs with surrounding text |
| `disable_in_macro` | `true` | Disable autopairs during macro recording |
| `disable_in_visualblock` | `false` | Disable autopairs in visual block mode |
| `disable_in_replace_mode` | `true` | Disable autopairs in replace mode |

## Basic Setup

```lua
-- Minimal setup with defaults
require('nvim-autopairs').setup({})

-- Or with lazy.nvim
{ 'windwp/nvim-autopairs', event = "InsertEnter", config = true }
```

## Mode Legend

- `i` - Insert mode
- `n` - Normal mode
- `v` - Visual mode
- `x` - Visual mode (characterwise)
- `o` - Operator-pending mode
- `t` - Terminal mode

## Notes

- nvim-autopairs does not create any normal mode keybindings by default
- All automatic pair handling occurs in insert mode
- The plugin intelligently handles pairs based on context (treesitter-aware if configured)
- Pairs are not inserted in comments or strings unless explicitly configured
