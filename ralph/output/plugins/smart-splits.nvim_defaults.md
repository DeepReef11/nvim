# smart-splits.nvim Default Keybindings

> **Note:** smart-splits.nvim does NOT ship with any default keybindings out of the box. The plugin explicitly states: "smart-splits.nvim does not map any keys on it's own." Users must configure keymaps manually.

This document covers the **recommended keybindings** from the plugin documentation and the available API functions.

## Recommended Keybindings

### Window Navigation

Move cursor between splits (including terminal multiplexer panes when configured).

| Keybinding | Function | Mode | Description |
|------------|----------|------|-------------|
| `<C-h>` | `move_cursor_left()` | n | Move cursor to left split |
| `<C-j>` | `move_cursor_down()` | n | Move cursor to split below |
| `<C-k>` | `move_cursor_up()` | n | Move cursor to split above |
| `<C-l>` | `move_cursor_right()` | n | Move cursor to right split |
| `<C-\>` | `move_cursor_previous()` | n | Move cursor to previous split |

**Mode Support:** Navigation functions work in `n` (normal), `v` (visual), and `i` (insert) modes when configured with `{ "i", "n", "v" }`.

### Window Resizing

Resize splits directionally. These keymaps accept a count prefix (e.g., `10<A-h>` resizes by 10 * default_amount).

| Keybinding | Function | Mode | Description |
|------------|----------|------|-------------|
| `<A-h>` | `resize_left(amount)` | n | Resize split left |
| `<A-j>` | `resize_down(amount)` | n | Resize split down |
| `<A-k>` | `resize_up(amount)` | n | Resize split up |
| `<A-l>` | `resize_right(amount)` | n | Resize split right |

**Default resize amount:** `3` (configurable via `default_amount` setting)

### Buffer Swapping

Swap the current buffer with an adjacent window's buffer.

| Keybinding | Function | Mode | Description |
|------------|----------|------|-------------|
| `<leader><leader>h` | `swap_buf_left()` | n | Swap buffer with left window |
| `<leader><leader>j` | `swap_buf_down()` | n | Swap buffer with window below |
| `<leader><leader>k` | `swap_buf_up()` | n | Swap buffer with window above |
| `<leader><leader>l` | `swap_buf_right()` | n | Swap buffer with right window |

## API Functions Reference

### Navigation Functions

```lua
require('smart-splits').move_cursor_left(opts)
require('smart-splits').move_cursor_down(opts)
require('smart-splits').move_cursor_up(opts)
require('smart-splits').move_cursor_right(opts)
require('smart-splits').move_cursor_previous()
```

**Options table:**
- `same_row` (boolean): Keep cursor on same row when moving
- `at_edge` ('wrap' | 'split' | 'stop'): Behavior when at edge of splits

### Resize Functions

```lua
require('smart-splits').resize_left(amount)
require('smart-splits').resize_down(amount)
require('smart-splits').resize_up(amount)
require('smart-splits').resize_right(amount)
```

**Parameters:**
- `amount` (number, optional): Resize amount. Defaults to `default_amount` (3)

### Buffer Swap Functions

```lua
require('smart-splits').swap_buf_left(opts)
require('smart-splits').swap_buf_down(opts)
require('smart-splits').swap_buf_up(opts)
require('smart-splits').swap_buf_right(opts)
```

**Options table:**
- `move_cursor` (boolean): Whether cursor follows the swapped buffer

## Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| `default_amount` | `3` | Default resize amount |
| `at_edge` | `'wrap'` | Behavior at window edge: 'wrap', 'split', or 'stop' |
| `move_cursor_same_row` | `false` | Keep cursor on same row when navigating |
| `cursor_follows_swapped_bufs` | `false` | Cursor follows buffer after swap |
| `disable_multiplexer_nav_when_zoomed` | `true` | Disable multiplexer navigation when pane is zoomed |
| `ignored_events` | `[]` | Events to ignore (e.g., 'BufEnter', 'WinEnter') |

## Terminal Multiplexer Integration

smart-splits.nvim integrates with:
- **Tmux** - Navigation: `C-hjkl`, Resize: `M-hjkl`
- **Wezterm** - Configurable via `smart_splits.apply_to_config()`
- **Kitty** - Uses `IS_NVIM` user variable for conditional mappings
- **Zellij** - Full integration support

## Example Configuration

```lua
-- Recommended keymaps setup
local smartsplits = require('smart-splits')

-- Resizing
vim.keymap.set('n', '<A-h>', smartsplits.resize_left)
vim.keymap.set('n', '<A-j>', smartsplits.resize_down)
vim.keymap.set('n', '<A-k>', smartsplits.resize_up)
vim.keymap.set('n', '<A-l>', smartsplits.resize_right)

-- Navigation
vim.keymap.set('n', '<C-h>', smartsplits.move_cursor_left)
vim.keymap.set('n', '<C-j>', smartsplits.move_cursor_down)
vim.keymap.set('n', '<C-k>', smartsplits.move_cursor_up)
vim.keymap.set('n', '<C-l>', smartsplits.move_cursor_right)
vim.keymap.set('n', '<C-\\>', smartsplits.move_cursor_previous)

-- Buffer swapping
vim.keymap.set('n', '<leader><leader>h', smartsplits.swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', smartsplits.swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', smartsplits.swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', smartsplits.swap_buf_right)
```

## Sources

- [GitHub Repository](https://github.com/mrjones2014/smart-splits.nvim)
- [NixVim Documentation](https://nix-community.github.io/nixvim/plugins/smart-splits/index.html)
