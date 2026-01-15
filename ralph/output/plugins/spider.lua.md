# Plugin: nvim-spider (spider.lua)

**Plugin:** `chrisgrieser/nvim-spider`
**Source:** `lua/plugins/spider.lua`

## Description
nvim-spider provides CamelCase-aware word motion commands. It treats subwords in CamelCase and snake_case as separate words.

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `W` | n, o, x | `w` | Normal w (move forward one word) |
| `<M-w>` | n, o, x | `spider.motion('w')` | Spider-w (CamelCase-aware word forward) |
| `<M-e>` | n, o, x | `spider.motion('e')` | Spider-e (CamelCase-aware end of word) |
| `<M-b>` | n, o, x | `spider.motion('b')` | Spider-b (CamelCase-aware word backward) |
| `ß` | n, o, x | `spider.motion('b')` | Spider-b (AltGr+b alternative) |
| `å` | n, o, x | `spider.motion('w')` | Spider-w (AltGr+w alternative) |
| `é` | n, o, x | `spider.motion('e')` | Spider-e (AltGr+e alternative) |
| `ge` | n, o, x | `spider.motion('ge')` | Spider-ge (CamelCase-aware end of previous word) |

## Lazy-load Trigger Keys
- `w`, `e`, `b`, `ge`

## Notes
- The plugin is lazy-loaded
- Provides alternative keybindings using special characters for AltGr keyboard layouts
- Standard `w` is remapped to `W` to preserve original functionality
