# neogen Default Keybindings

## Overview

[Neogen](https://github.com/danymat/neogen) is a better annotation generator for Neovim that supports multiple languages and annotation conventions. It allows you to create documentation annotations (docstrings) with a single keybind and provides placeholder navigation to fill in annotation fields efficiently.

**Important Note:** Neogen does **not** ship with any default keybindings out of the box. Users must configure their own keymaps. The plugin is designed to be invoked via the `:Neogen` command or through custom Lua function calls.

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| *(none)* | - | - | Neogen has no built-in default keybindings |

## Commands (No Keybinding Required)

| Command | Description |
|---------|-------------|
| `:Neogen` | Generate annotation for current function/class/type |
| `:Neogen func` | Generate function annotation |
| `:Neogen class` | Generate class annotation |
| `:Neogen type` | Generate type annotation |
| `:Neogen file` | Generate file annotation |

## Recommended Keybindings (User Configuration)

The plugin documentation suggests the following keybindings that users can add to their config:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>nf` | n | `require('neogen').generate()` | Generate annotation for current context |
| `<Leader>nc` | n | `require('neogen').generate({ type = 'class' })` | Generate class annotation |
| `<C-l>` | i | `require('neogen').jump_next()` | Jump to next placeholder (without snippet engine) |
| `<C-h>` | i | `require('neogen').jump_prev()` | Jump to previous placeholder (without snippet engine) |

### Example Configuration

```lua
local opts = { noremap = true, silent = true }

-- Generate annotations
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)

-- Jump between placeholders (only needed if not using a snippet engine)
vim.api.nvim_set_keymap("i", "<C-l>", ":lua require('neogen').jump_next()<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-h>", ":lua require('neogen').jump_prev()<CR>", opts)
```

## LazyVim Default Configuration

If using [LazyVim](https://www.lazyvim.org/extras/coding/neogen), the following keybinding is preconfigured:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>cn` | n | `require('neogen').generate()` | Generate Annotations (Neogen) |

## Snippet Engine Integration

When using a snippet engine (luasnip, snippy, vsnip, nvim, or mini), placeholder navigation is handled by the snippet engine's keybindings instead of neogen's `jump_next`/`jump_prev` functions.

Configure snippet engine in setup:
```lua
require('neogen').setup({
  snippet_engine = "luasnip"  -- or "snippy", "vsnip", "nvim", "mini"
})
```

## API Functions

| Function | Description |
|----------|-------------|
| `require('neogen').generate()` | Generate annotation for current context |
| `require('neogen').generate({ type = 'func' })` | Generate function annotation |
| `require('neogen').generate({ type = 'class' })` | Generate class annotation |
| `require('neogen').generate({ type = 'type' })` | Generate type annotation |
| `require('neogen').generate({ type = 'file' })` | Generate file annotation |
| `require('neogen').jump_next()` | Jump to next placeholder |
| `require('neogen').jump_prev()` | Jump to previous placeholder |
| `require('neogen').jumpable()` | Check if jump is possible (useful for conditional mappings) |

## Sources

- [GitHub - danymat/neogen](https://github.com/danymat/neogen)
- [LazyVim Neogen Extra](https://www.lazyvim.org/extras/coding/neogen)
- [nixvim Neogen Documentation](https://nix-community.github.io/nixvim/plugins/neogen/index.html)
