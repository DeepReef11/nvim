# Plugin: Comment.nvim

**File:** `lua/plugins/code/comment.lua`
**Plugin:** numToStr/Comment.nvim

## Keybindings

### Toggler (NORMAL mode)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gcc` | n | toggle line comment | Toggle line comment on current line |
| `gbc` | n | toggle block comment | Toggle block comment on current line |

### Operator-Pending (NORMAL + VISUAL mode)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gc{motion}` | n,v | line comment | Comment/uncomment using line comment with motion |
| `gb{motion}` | n,v | block comment | Comment/uncomment using block comment with motion |

### Extra Mappings (enabled)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gco` | n | comment below | Insert comment on next line and enter insert mode |
| `gcO` | n | comment above | Insert comment on previous line and enter insert mode |
| `gcA` | n | comment end of line | Insert comment at end of line and enter insert mode |

### Extended Mappings (disabled)
The following mappings are disabled in this config (`extended = false`):
- `g>` / `g<` - Force comment/uncomment
- `g>[count]{motion}` / `g<[count]{motion}` - Force comment/uncomment with motion

## Notes
- Uses `nvim-ts-context-commentstring` for context-aware commenting (JSX, TSX, etc.)
- Padding enabled (space between comment markers and text)
