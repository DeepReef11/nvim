# smart-splits.lua Keybindings

Plugin: `mrjones2014/smart-splits.nvim`

## Resizing Splits

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<M-S-Left>` | n | `smartsplits.resize_left` | Resize pane left |
| `<M-S-Right>` | n | `smartsplits.resize_right` | Resize pane right |
| `<M-S-Up>` | n | `smartsplits.resize_up` | Resize pane up |
| `<M-S-Down>` | n | `smartsplits.resize_down` | Resize pane down |

Note: These keymaps accept a range, e.g. `10<M-S-Left>` will resize left by `10 * default_amount` (default_amount = 7)

## Moving Between Splits

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-w><left>` | n | `smartsplits.move_cursor_left` | Move cursor to left split |
| `<C-w><down>` | n | `smartsplits.move_cursor_down` | Move cursor to split below |
| `<C-w><up>` | n | `smartsplits.move_cursor_up` | Move cursor to split above |
| `<C-w><right>` | n | `smartsplits.move_cursor_right` | Move cursor to right split |
| `<C-\>` | n | `smartsplits.move_cursor_previous` | Move cursor to previous split |

Note: These can move from left to right even when outbound (integrates with tmux/wezterm)

## Swapping Buffers Between Windows

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader><C-h>` | n | `swap_buf_left` | Swap buffer with left window |
| `<leader><C-j>` | n | `swap_buf_down` | Swap buffer with window below |
| `<leader><C-k>` | n | `swap_buf_up` | Swap buffer with window above |
| `<leader><C-l>` | n | `swap_buf_right` | Swap buffer with right window |
