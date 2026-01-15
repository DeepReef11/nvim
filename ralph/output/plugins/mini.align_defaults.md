# mini.align Default Keybindings

## Overview

mini.align is a Neovim Lua plugin to align text interactively (with or without instant preview). Part of the 'mini.nvim' library by echasnovski. It provides rich and flexible customization of both alignment rules and user interaction, supporting charwise, linewise, and blockwise selections with dot-repeat support.

## Default Keybindings

### Main Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `ga` | n, v | Start alignment | Initiates alignment mode. In Normal mode, follow with textobject/motion. In Visual mode, uses selected region. |
| `gA` | n, v | Start alignment with preview | Same as `ga` but shows live preview of alignment changes as you type modifiers. |

### Interactive Modifiers (used during alignment)

#### Main Option Modifiers

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `s` | - | Enter split pattern | Prompts for Lua pattern to split text. Confirm with `<CR>`. |
| `j` | - | Choose justification | Prompts to choose: `l`eft, `c`enter, `r`ight, or `n`one. |
| `m` | - | Enter merge delimiter | Prompts for delimiter to merge aligned parts. Confirm with `<CR>`. |

#### Pre-Step Modifiers

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `f` | - | Enter filter expression | Configure which parts are affected (e.g., align only first column). |
| `i` | - | Ignore split matches | Adds commonly unwanted patterns to exclusions. |
| `p` | - | Pair parts | Pairs neighboring parts so they align together. |
| `t` | - | Trim whitespace | Trims parts from whitespace on both sides while keeping indentation. |

#### Navigation/Control

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<BS>` | - | Delete pre-step | Removes the last pre-step; prompts to choose type if multiple exist. |
| `<CR>` | - | Accept alignment | Confirms and applies the alignment (preview mode only). |
| `<Esc>` | - | Cancel | Discards changes and returns to initial region. |
| `<C-c>` | - | Cancel | Same as `<Esc>`. |

#### Special Split Configurations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `=` | - | Align by equals | Enhanced setup for `=` with special pattern handling and smart trimming. |
| `,` | - | Align by comma | Splits by comma, trims whitespace, pairs parts, merges with single space. |
| `\|` | - | Align by pipe | Splits by pipe, trims whitespace, merges with single space. |
| `<Space>` | - | Align by space | Squashes consecutive whitespace and splits while preserving indentation. |

## Notes

- **Mode Legend:** `n` = Normal, `v` = Visual (works in charwise, linewise, and blockwise visual modes)
- **Modifier keys** are pressed interactively after initiating alignment with `ga` or `gA`
- **Preview mode** (`gA`) works best with `'showmode'` disabled
- **Blockwise selection** works best with `'virtualedit'` set to `"block"` or `"all"`
- All mappings can be disabled by setting them to empty string `''` in configuration
- Call `require('mini.align').setup()` to enable the plugin with default settings

## References

- [GitHub Repository](https://github.com/echasnovski/mini.align)
- [Official Documentation](https://nvim-mini.org/mini.nvim/doc/mini-align.html)
