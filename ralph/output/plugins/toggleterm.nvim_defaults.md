# toggleterm.nvim Default Keybindings

Plugin: [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

Terminal management plugin for Neovim.

## Default Configuration

toggleterm.nvim does **not** provide hardcoded default keybindings out of the box. Instead, it relies on user configuration via the `open_mapping` option. However, the plugin documentation suggests `<C-\>` as the recommended default.

### Configuration Options for Mappings

| Option | Default | Description |
|--------|---------|-------------|
| `open_mapping` | `nil` (must be set by user) | Key or array of keys for toggling terminal |
| `insert_mappings` | `true` | Apply open_mapping in insert mode |
| `terminal_mappings` | `true` | Apply open_mapping in terminal mode |

## Keybindings (When Configured)

When `open_mapping` is set (e.g., `open_mapping = [[<c-\>]]`), the following mappings are created:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-\>` | n | `:ToggleTerm` | Toggle terminal window (can be prefixed with count, e.g., `2<C-\>` for terminal 2) |
| `<C-\>` | i | `<Esc>:ToggleTerm` | Exit insert mode and toggle terminal (if `insert_mappings = true`) |
| `<C-\>` | t | `:ToggleTerm` | Toggle terminal from within terminal buffer (if `terminal_mappings = true`) |

## Available Commands

| Command | Description |
|---------|-------------|
| `:ToggleTerm` | Toggle terminal window. Accepts args: `size`, `dir`, `direction`, `name` |
| `:ToggleTermToggleAll` | Open all previously toggled terminals or close all open ones |
| `:TermExec cmd="..."` | Execute command in terminal (e.g., `2TermExec cmd="git status"`) |
| `:TermNew` | Open new terminal at next available count |
| `:TermSelect` | Use `vim.ui.select` to choose which terminal to open/focus |
| `:ToggleTermSendCurrentLine <T_ID>` | Send entire current line to terminal |
| `:ToggleTermSendVisualLines <T_ID>` | Send whole lines from visual selection to terminal |
| `:ToggleTermSendVisualSelection <T_ID>` | Send only selected text to terminal |
| `:ToggleTermSetName` | Set display name for a terminal |

## Suggested Terminal Window Mappings

The plugin documentation suggests these mappings for terminal buffer navigation (not set by default):

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Esc>` | t | `<C-\><C-n>` | Exit terminal mode to normal mode |
| `jk` | t | `<C-\><C-n>` | Exit terminal mode to normal mode (alternative) |
| `<C-h>` | t | `<Cmd>wincmd h<CR>` | Navigate to left window |
| `<C-j>` | t | `<Cmd>wincmd j<CR>` | Navigate to window below |
| `<C-k>` | t | `<Cmd>wincmd k<CR>` | Navigate to window above |
| `<C-l>` | t | `<Cmd>wincmd l<CR>` | Navigate to right window |
| `<C-w>` | t | `<C-\><C-n><C-w>` | Access window commands from terminal |

## Example Setup

```lua
require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  insert_mappings = true,
  terminal_mappings = true,
  direction = "horizontal",
  size = 12,
})

-- Optional: Set terminal window navigation mappings
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
```

## Mode Legend

| Mode | Description |
|------|-------------|
| n | Normal mode |
| i | Insert mode |
| v | Visual mode |
| x | Visual block mode |
| t | Terminal mode |
