# TreeSJ (Wansmer/treesj) Default Keybindings

Neovim plugin for splitting/joining blocks of code using treesitter.

## Default Keybindings

TreeSJ provides three default keymaps when `use_default_keymaps = true` (enabled by default):

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<space>m` | n | Toggle | Smart toggle - splits single-line blocks, joins multiline blocks |
| `<space>j` | n | Join | Join node under cursor into a single line |
| `<space>s` | n | Split | Split node under cursor into multiple lines |

## User Commands

The plugin also provides ex commands that can be used directly or for custom keymaps:

| Command | Description |
|---------|-------------|
| `:TSJToggle` | Toggle node under cursor (split/join) |
| `:TSJSplit` | Split node under cursor |
| `:TSJJoin` | Join node under cursor |

## Lua API

Functions can be called directly via Lua with optional preset overrides:

```lua
require('treesj').toggle()
require('treesj').split()
require('treesj').join()
```

Each function accepts an optional table to extend presets:

```lua
-- Example: Toggle with recursive split
require('treesj').toggle({ split = { recursive = true } })
```

## Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| `use_default_keymaps` | `true` | Enable default keymaps (`<space>m/j/s`) |
| `check_syntax_error` | `true` | Nodes with syntax errors will not be formatted |
| `max_join_length` | `120` | Maximum line length after join |
| `cursor_behavior` | `'hold'` | Cursor behavior: 'hold', 'start', or 'end' |
| `dot_repeat` | `true` | Enable repeat with `.` command |

## Notes

- All default keybindings work in **Normal mode** only
- The cursor follows the text on which it was called (sticky cursor)
- Can be called from anywhere in the block (no need to position cursor at specific location)
- Supports dot-repeat (`.`) when `dot_repeat` is enabled
- To disable default keymaps and use custom bindings: `use_default_keymaps = false`

## Sources

- [Wansmer/treesj GitHub Repository](https://github.com/Wansmer/treesj)
