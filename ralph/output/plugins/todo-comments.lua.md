# Plugin: todo-comments.lua

**Plugin:** folke/todo-comments.nvim

## Keybindings

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `]t` | `require("todo-comments").jump_next()` | Next todo comment |
| n | `[t` | `require("todo-comments").jump_prev()` | Previous todo comment |

## Notes

- Plugin is loaded lazily on `BufEnter` event
- Highlights keywords: FIX, FIXME, BUG, FIXIT, ISSUE, WARN, WARNING, PERF, OPTIM, PERFORMANCE, OPTIMIZE
- Sign priority: 8
- Shows icons in signs column
