# noice.nvim Default Keybindings

## Overview

noice.nvim is a highly experimental Neovim plugin by folke that completely replaces the UI for messages, cmdline, and the popupmenu. It provides a modern, customizable interface for Neovim's built-in UI elements using the new `vim.ui_attach` API.

**Important Note:** noice.nvim does **not** set any keybindings by default. The plugin provides commands and API functions that users are expected to map themselves according to their preferences. The keybindings documented below are the **suggested/recommended** keymaps from the official documentation.

## Default Keybindings

noice.nvim has no built-in default keybindings. However, the following are the officially documented suggested keymaps:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>nl` | n | `require("noice").cmd("last")` | Show last message in a popup |
| `<leader>nh` | n | `require("noice").cmd("history")` | Show message history |
| `<S-Enter>` | c | `require("noice").redirect(vim.fn.getcmdline())` | Redirect cmdline output (keeps cmdline open) |
| `<C-f>` | n, i, s | `require("noice.lsp").scroll(4)` | Scroll forward in LSP hover/signature docs |
| `<C-b>` | n, i, s | `require("noice.lsp").scroll(-4)` | Scroll backward in LSP hover/signature docs |

## Markdown Hover Keybindings

When `lsp.override["vim.lsp.util.stylize_markdown"]` is set to `true`, the following buffer-local keymaps are added in markdown hover windows:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gx` | n | Open link handler | Opens URLs/links under cursor |
| `K` | n | Hover handler | Shows hover information for matched patterns |

## Available Commands

noice.nvim provides the following commands that can be mapped to any keybinding:

| Command | Description |
|---------|-------------|
| `:Noice` or `:Noice history` | Show message history in a split |
| `:Noice last` | Show last message in a popup |
| `:Noice dismiss` | Dismiss all visible messages |
| `:Noice errors` | Show error messages in a split |
| `:Noice disable` | Disable noice.nvim |
| `:Noice enable` | Enable noice.nvim |
| `:Noice stats` | Show debugging stats |
| `:Noice telescope` | Open message history in Telescope |
| `:Noice pick` | Open picker interface (Telescope/fzf-lua) |

## LazyVim Default Keybindings

If using LazyVim, the following keybindings are set by default:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<S-Enter>` | c | Redirect cmdline | Redirect Cmdline |
| `<leader>snl` | n | Noice last | Noice Last Message |
| `<leader>snh` | n | Noice history | Noice History |
| `<leader>sna` | n | Noice all | Noice All |
| `<leader>snd` | n | Noice dismiss | Dismiss All |
| `<leader>snt` | n | Noice telescope | Noice Picker (Telescope/FzfLua) |
| `<C-f>` | n, i, s | Scroll forward | Scroll Forward in LSP docs |
| `<C-b>` | n, i, s | Scroll backward | Scroll Backward in LSP docs |

## Example Configuration

```lua
-- Suggested keymaps from noice.nvim documentation
vim.keymap.set("n", "<leader>nl", function()
  require("noice").cmd("last")
end, { desc = "Noice Last Message" })

vim.keymap.set("n", "<leader>nh", function()
  require("noice").cmd("history")
end, { desc = "Noice History" })

vim.keymap.set("c", "<S-Enter>", function()
  require("noice").redirect(vim.fn.getcmdline())
end, { desc = "Redirect Cmdline" })

-- LSP hover doc scrolling
vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true, desc = "Scroll Forward" })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true, desc = "Scroll Backward" })
```

## Mode Legend

| Mode | Description |
|------|-------------|
| n | Normal mode |
| i | Insert mode |
| s | Select mode |
| c | Command-line mode |

## Sources

- [GitHub - folke/noice.nvim](https://github.com/folke/noice.nvim)
- [noice.nvim Documentation](https://github.com/folke/noice.nvim/blob/main/doc/noice.nvim.txt)
- [LazyVim UI Plugins](https://www.lazyvim.org/plugins/ui)
