# nvim-lint Default Keybindings

## Overview

**nvim-lint** is an asynchronous linter plugin for Neovim (>= 0.9.5) that complements the built-in Language Server Protocol support. It has a narrow scope: it spawns linters, parses their output, and reports the results via the `vim.diagnostic` module.

## Default Keybindings

**nvim-lint does not provide any default keybindings out of the box.**

The plugin is intentionally designed to be triggered programmatically rather than through preset keyboard shortcuts. This design philosophy aligns with nvim-lint's goal of having a narrow scope - it focuses specifically on spawning linters and reporting results, leaving workflow automation and keybinding configuration entirely to the user.

## How Linting is Triggered

Instead of keybindings, users must:

1. **Configure linters per filetype** using the `linters_by_ft` table
2. **Set up autocommands** to trigger linting on events such as:
   - `BufWritePost` (after saving a file)
   - `InsertLeave` (after leaving insert mode)
   - `TextChanged` (for more aggressive linting)

## Recommended User Configuration

To manually trigger linting, users typically add their own keybinding:

```lua
vim.keymap.set("n", "<leader>l", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })
```

## Sources

- [nvim-lint GitHub Repository](https://github.com/mfussenegger/nvim-lint)
