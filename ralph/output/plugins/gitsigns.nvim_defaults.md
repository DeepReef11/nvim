# gitsigns.nvim Default Keybindings

## Overview

gitsigns.nvim is a Git integration plugin for Neovim that provides git signs (add, change, delete indicators) in the sign column, along with hunk staging/unstaging, blame display, and diff functionality. The plugin is written in pure Lua and integrates directly with buffers.

**Important Note:** gitsigns.nvim does NOT ship with default keybindings enabled out of the box. Instead, it provides an `on_attach` callback where users configure their own keybindings. The keybindings listed below are the **recommended mappings** from the official documentation and are commonly used in configurations like kickstart.nvim.

## Default Keybindings

These are the recommended keybindings from the official gitsigns.nvim repository:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]c` | n | `nav_hunk('next')` | Navigate to next hunk (respects diff mode) |
| `[c` | n | `nav_hunk('prev')` | Navigate to previous hunk (respects diff mode) |
| `<leader>hs` | n | `stage_hunk()` | Stage the hunk under cursor |
| `<leader>hs` | v | `stage_hunk({range})` | Stage selected lines in visual mode |
| `<leader>hr` | n | `reset_hunk()` | Reset the hunk under cursor |
| `<leader>hr` | v | `reset_hunk({range})` | Reset selected lines in visual mode |
| `<leader>hS` | n | `stage_buffer()` | Stage all hunks in the buffer |
| `<leader>hR` | n | `reset_buffer()` | Reset all hunks in the buffer |
| `<leader>hu` | n | `undo_stage_hunk()` | Undo the last staged hunk |
| `<leader>hp` | n | `preview_hunk()` | Preview hunk in floating window |
| `<leader>hi` | n | `preview_hunk_inline()` | Preview hunk inline in buffer |
| `<leader>hb` | n | `blame_line({full=true})` | Show full blame info for current line |
| `<leader>hd` | n | `diffthis()` | Diff buffer against index |
| `<leader>hD` | n | `diffthis('~')` | Diff buffer against last commit |
| `<leader>hQ` | n | `setqflist('all')` | Populate quickfix with all hunks |
| `<leader>hq` | n | `setqflist()` | Populate quickfix with buffer hunks |
| `<leader>tb` | n | `toggle_current_line_blame()` | Toggle current line blame virtual text |
| `<leader>td` | n | `toggle_deleted()` | Toggle display of deleted lines |
| `<leader>tw` | n | `toggle_word_diff()` | Toggle word diff highlighting |
| `ih` | o, x | `select_hunk()` | Select hunk as text object |

## Available Functions

All functions below can be mapped to custom keybindings:

### Navigation & Preview
| Function | Description |
|----------|-------------|
| `nav_hunk(direction)` | Jump to hunks (accepts 'first', 'last', 'next', 'prev') |
| `preview_hunk()` | Preview hunk in floating window |
| `preview_hunk_inline()` | Preview hunk inline in buffer |
| `select_hunk()` | Select hunk under cursor (for text objects) |

### Staging & Resetting
| Function | Description |
|----------|-------------|
| `stage_hunk({range})` | Stage hunk or line range |
| `stage_buffer()` | Stage all hunks in buffer |
| `reset_hunk({range})` | Reset hunk or line range |
| `reset_buffer()` | Reset all hunks in buffer |
| `reset_buffer_index()` | Unstage all hunks in buffer |
| `undo_stage_hunk()` | Undo last staged hunk (deprecated) |

### Blame & Diff
| Function | Description |
|----------|-------------|
| `blame()` | Run git-blame on buffer in split |
| `blame_line({opts})` | Show blame in floating window |
| `diffthis({base})` | Perform vimdiff against base |
| `show({revision})` | Display file revision |
| `show_commit()` | Display commit in split/tab |
| `change_base({base})` | Change diff base revision |
| `reset_base()` | Reset to index as base |

### Toggles
| Function | Description |
|----------|-------------|
| `toggle_signs()` | Toggle sign column display |
| `toggle_numhl()` | Toggle line number highlighting |
| `toggle_linehl()` | Toggle line highlighting |
| `toggle_word_diff()` | Toggle word diff highlighting |
| `toggle_current_line_blame()` | Toggle current line blame |
| `toggle_deleted()` | Toggle deleted line display |

### Utilities
| Function | Description |
|----------|-------------|
| `setqflist({target})` | Populate quickfix list with hunks |
| `setloclist({opts})` | Populate location list with hunks |
| `get_actions()` | Get available actions at cursor |
| `refresh()` | Refresh all gitsigns buffers |

## Configuration Example

```lua
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})
    end)
    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})
    end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function()
      gitsigns.blame_line({full = true})
    end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
```

## Sources

- [GitHub - lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [gitsigns.nvim Documentation](https://github.com/lewis6991/gitsigns.nvim/blob/main/doc/gitsigns.txt)
- [kickstart.nvim gitsigns configuration](https://github.com/nvim-lua/kickstart.nvim/blob/master/lua/kickstart/plugins/gitsigns.lua)
