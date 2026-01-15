# todo-comments.nvim Default Keybindings

**Plugin:** [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

## Overview

todo-comments.nvim does **not provide any default keybindings out of the box**. The plugin focuses on highlighting and searching TODO/FIXME/HACK/etc comments in your code. Users must manually configure keybindings for navigation features.

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| *None* | - | - | No default keybindings are shipped with the plugin |

## Recommended Keybindings (From Documentation)

The plugin documentation suggests these keybindings that users can add to their config:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]t` | n | `require("todo-comments").jump_next()` | Jump to next todo comment |
| `[t` | n | `require("todo-comments").jump_prev()` | Jump to previous todo comment |

### Example Configuration

```lua
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
```

### Filtered Navigation Example

You can filter jumps to specific comment types:

```lua
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })
```

## Available Commands

The plugin provides these Vim commands (not keybindings):

| Command | Description |
|---------|-------------|
| `:TodoQuickFix` | Display todos in quickfix list |
| `:TodoLocList` | Display todos in location list |
| `:Trouble todo` | Show todos in Trouble plugin (requires trouble.nvim) |
| `:TodoTelescope` | Search todos with Telescope (requires telescope.nvim) |
| `:TodoFzfLua` | Search todos with FzfLua (requires fzf-lua) |

## Available API Functions

| Function | Description |
|----------|-------------|
| `require("todo-comments").jump_next(opts)` | Jump to next todo comment |
| `require("todo-comments").jump_prev(opts)` | Jump to previous todo comment |
| `require("todo-comments").enable()` | Enable todo-comments highlighting |
| `require("todo-comments").disable()` | Disable todo-comments highlighting |
| `require("todo-comments").setup(opts)` | Configure the plugin |

## Supported Comment Keywords (Default)

- `FIX` / `FIXME` / `BUG` / `FIXIT` / `ISSUE`
- `TODO`
- `HACK`
- `WARN` / `WARNING` / `XXX`
- `PERF` / `OPTIM` / `PERFORMANCE` / `OPTIMIZE`
- `NOTE` / `INFO`
- `TEST` / `TESTING` / `PASSED` / `FAILED`
