# mini.bufremove Default Keybindings

## Overview

mini.bufremove is a Neovim Lua plugin for buffer removing (unshow, delete, wipeout) while preserving window layout. It is part of the 'mini.nvim' library by echasnovski.

When removing a buffer, the plugin intelligently determines which buffer to show next using this algorithm:
1. If an alternate buffer is listed, use it
2. If the previous listed buffer is different, use it
3. Otherwise, create a new scratch buffer and use it

**Important:** This plugin does NOT provide any default keybindings out of the box. Users must configure their own key mappings to use the provided functions.

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| *None* | - | - | No default keybindings are provided |

## Available Functions

Users should map these functions to their preferred keys:

| Function | Description |
|----------|-------------|
| `MiniBufremove.delete(buf_id, force)` | Delete buffer with `:bdelete` after unshowing it |
| `MiniBufremove.wipeout(buf_id, force)` | Wipeout buffer with `:bwipeout` after unshowing it |
| `MiniBufremove.unshow(buf_id)` | Stop showing buffer in all windows without deleting it |
| `MiniBufremove.unshow_in_window(win_id)` | Stop showing current buffer in specified window |

## Recommended Keybinding Examples

```lua
-- Delete buffer (keeps file, removes from buffer list)
vim.keymap.set('n', '<leader>bd', function() require('mini.bufremove').delete() end, { desc = 'Delete buffer' })

-- Wipeout buffer (completely removes buffer and marks)
vim.keymap.set('n', '<leader>bw', function() require('mini.bufremove').wipeout() end, { desc = 'Wipeout buffer' })

-- Force delete (ignore unsaved changes)
vim.keymap.set('n', '<leader>bD', function() require('mini.bufremove').delete(0, true) end, { desc = 'Force delete buffer' })

-- Unshow buffer (hide from windows but keep in buffer list)
vim.keymap.set('n', '<leader>bu', function() require('mini.bufremove').unshow() end, { desc = 'Unshow buffer' })
```

## Default Configuration

```lua
{
  silent = false,  -- Whether to disable showing non-error feedback
}
```

## Notes

- Calling `require('mini.bufremove').setup()` is optional but improves usability
- When `delete()` or `wipeout()` is applied without `force` on a modified buffer, it asks for confirmation instead of declining
- All functions accept optional buffer/window ID parameters (defaults to current buffer/window when set to 0 or nil)

## Sources

- [GitHub Repository](https://github.com/echasnovski/mini.bufremove)
- [Documentation](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-bufremove.md)
