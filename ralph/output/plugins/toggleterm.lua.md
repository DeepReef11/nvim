# toggleterm.lua Keybindings

**Plugin:** akinsho/toggleterm.nvim
**Status:** Disabled (`enabled = false`)

## Lazy.nvim Keys Table

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<F12>` | n | open_mapping | Toggle terminal (use 2<F12> for terminal 2, etc.) |
| `<Leader>wf` | n | `<cmd>ToggleTerm direction=float<CR>` | Terminal float |

## Terminal Mode Keymaps (set via autocmd)

These keymaps are set when a toggleterm terminal is opened:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Esc>` | t | `<C-\><C-n>` | Exit terminal mode to normal mode |
| `<C-h>` | t | `<C-\><C-n><C-W>h` | Switch to left window from terminal |
| `<C-j>` | t | `<C-\><C-n><C-W>j` | Switch to window below from terminal |
| `<C-k>` | t | `<C-\><C-n><C-W>k` | Switch to window above from terminal |
| `<C-l>` | t | `<C-\><C-n><C-W>l` | Switch to right window from terminal |

## Notes

- Plugin is currently **disabled**
- `open_mapping` set to `<F12>` - can use number prefix (e.g., `2<F12>`) to toggle specific terminal instances
- Terminal navigation uses standard Ctrl+hjkl pattern but exits terminal mode first
