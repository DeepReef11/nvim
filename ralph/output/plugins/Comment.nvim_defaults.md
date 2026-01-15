# Comment.nvim Default Keybindings

**Plugin:** [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
**Description:** Smart and powerful comment plugin for Neovim with treesitter support

## Default Keybindings

### Toggle Mappings (Normal Mode)

| Key | Action | Description |
|-----|--------|-------------|
| `gcc` | Toggle line comment | Toggles the current line using linewise comment |
| `gbc` | Toggle block comment | Toggles the current line using blockwise comment |
| `[count]gcc` | Toggle multiple lines | Toggle count lines with linewise comments |
| `[count]gbc` | Toggle multiple lines | Toggle count lines with blockwise comments |

### Operator-Pending Mappings (Normal Mode)

| Key | Action | Description |
|-----|--------|-------------|
| `gc{motion}` | Line comment motion | Toggle region using linewise comment |
| `gb{motion}` | Block comment motion | Toggle region using blockwise comment |
| `gc[count]{motion}` | Line comment with count | Toggle region with count using linewise comment |
| `gb[count]{motion}` | Block comment with count | Toggle region with count using blockwise comment |

### Visual Mode Mappings

| Key | Action | Description |
|-----|--------|-------------|
| `gc` | Toggle line comment | Toggles the selection using linewise comment |
| `gb` | Toggle block comment | Toggles the selection using blockwise comment |

### Extra Mappings (Normal Mode)

| Key | Action | Description |
|-----|--------|-------------|
| `gco` | Comment below | Insert comment on the line below and enter INSERT mode |
| `gcO` | Comment above | Insert comment on the line above and enter INSERT mode |
| `gcA` | Comment end of line | Insert comment at end of current line and enter INSERT mode |

### Extended Mappings (Disabled by Default)

| Key | Action | Description |
|-----|--------|-------------|
| `g>` | Comment (force) | Add linewise comment |
| `g<` | Uncomment (force) | Remove linewise comment |
| `g>[count]{motion}` | Comment motion | Add linewise comment with motion |
| `g<[count]{motion}` | Uncomment motion | Remove linewise comment with motion |

## Common Motion Examples

| Key Combination | Description |
|-----------------|-------------|
| `gcw` | Comment from cursor to next word |
| `gc$` | Comment to end of line |
| `gc}` | Comment until next blank line |
| `gc5j` | Comment current line and 5 lines below |
| `gc8k` | Comment current line and 8 lines above |
| `gcip` | Comment inside paragraph |
| `gcap` | Comment around paragraph |
| `gca}` | Comment around curly brackets |

## User's Configuration

The user's config (`lua/plugins/code/comment.lua`) uses **default keybindings**:
- `basic = true` - Enables `gcc`, `gbc`, `gc{motion}`, `gb{motion}`
- `extra = true` - Enables `gco`, `gcO`, `gcA`
- `extended = false` - Extended mappings are disabled
- Toggler: `gcc` (line), `gbc` (block)
- Opleader: `gc` (line), `gb` (block)

**No custom keybinding overrides detected** - all defaults are preserved.

## Integration Notes

- Uses `nvim-ts-context-commentstring` for treesitter-aware commenting
- Automatically detects correct comment syntax based on cursor position in mixed-language files (e.g., JSX in JavaScript)
