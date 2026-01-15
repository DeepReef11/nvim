# bufferline.lua - Keybindings

**Plugin:** akinsho/bufferline.nvim
**Source:** `lua/plugins/ui/bufferline.lua`

## Custom Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-M-l>` | n | `<cmd>BufferLineCycleNext<CR>` | Bufferline cycle next buffer |
| `<C-M-h>` | n | `<cmd>BufferLineCyclePrev<CR>` | Bufferline cycle prev buffer |
| `<C-M-Right>` | n | `<cmd>BufferLineCycleNext<CR>` | Bufferline cycle next buffer |
| `<C-M-Left>` | n | `<cmd>BufferLineCyclePrev<CR>` | Bufferline cycle prev buffer |
| `L` | n | `<cmd>BufferLineCycleNext<CR>` | Bufferline cycle next buffer |
| `H` | n | `<cmd>BufferLineCyclePrev<CR>` | Bufferline cycle prev buffer |
| `<S-Right>` | n | `<cmd>BufferLineCycleNext<CR>` | Bufferline cycle next buffer |
| `<S-Left>` | n | `<cmd>BufferLineCyclePrev<CR>` | Bufferline cycle prev buffer |
| `<leader>bp` | n | `<cmd>BufferLineTogglePin<CR>` | [B]ufferline [P]in Toggle |

## Notes

- Uses `mini.bufremove` for buffer close operations
- Tab/S-Tab keybindings are commented out (disabled)
- Multiple alternative key combinations for cycling buffers (L/H, Shift+Arrow, Ctrl+Alt+hjkl/Arrow)
