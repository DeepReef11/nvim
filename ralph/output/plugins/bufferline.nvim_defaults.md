# bufferline.nvim Default Keybindings

## Plugin Info
- **Repository**: [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- **Purpose**: A snazzy buffer line with tabpage integration

## Default Keybindings (Out of the Box)

bufferline.nvim does **not** set any keybindings by default. All keybindings must be configured by the user.

### Available Commands for Keymapping

| Command | Description |
|---------|-------------|
| `:BufferLineCycleNext` | Go to next buffer |
| `:BufferLineCyclePrev` | Go to previous buffer |
| `:BufferLineMoveNext` | Move current buffer to next position |
| `:BufferLineMovePrev` | Move current buffer to previous position |
| `:BufferLineGoToBuffer <num>` | Go to buffer at position `<num>` |
| `:BufferLinePick` | Pick a buffer using letters |
| `:BufferLinePickClose` | Pick a buffer to close using letters |
| `:BufferLineCloseRight` | Close all buffers to the right |
| `:BufferLineCloseLeft` | Close all buffers to the left |
| `:BufferLineCloseOthers` | Close all other buffers |
| `:BufferLineTogglePin` | Toggle pin on current buffer |
| `:BufferLineSortByExtension` | Sort buffers by file extension |
| `:BufferLineSortByDirectory` | Sort buffers by directory |
| `:BufferLineSortByTabs` | Sort buffers by tabs |
| `:BufferLineSortByRelativeDirectory` | Sort by relative directory |

## User's Custom Configuration

The user has configured these keybindings in `lua/plugins/ui/bufferline.lua`:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-M-l>` | n | `:BufferLineCycleNext` | Cycle to next buffer |
| `<C-M-h>` | n | `:BufferLineCyclePrev` | Cycle to previous buffer |
| `<C-M-Right>` | n | `:BufferLineCycleNext` | Cycle to next buffer |
| `<C-M-Left>` | n | `:BufferLineCyclePrev` | Cycle to previous buffer |
| `L` | n | `:BufferLineCycleNext` | Cycle to next buffer |
| `H` | n | `:BufferLineCyclePrev` | Cycle to previous buffer |
| `<S-Right>` | n | `:BufferLineCycleNext` | Cycle to next buffer |
| `<S-Left>` | n | `:BufferLineCyclePrev` | Cycle to previous buffer |
| `<leader>bp` | n | `:BufferLineTogglePin` | Toggle pin on buffer |

### Commented Out (Disabled)
- `<Tab>` - BufferLineCycleNext (disabled)
- `<S-Tab>` - BufferLineCyclePrev (disabled)

## Potential Conflicts

| Custom Key | Default Vim Behavior | Status |
|------------|---------------------|--------|
| `H` | Move to top of screen | **OVERRIDDEN** |
| `L` | Move to bottom of screen | **OVERRIDDEN** |

## Commonly Recommended Keybindings

```lua
-- Go to buffer by number
vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
-- etc...

-- Pick buffer
vim.keymap.set('n', '<leader>bb', '<Cmd>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferLinePickClose<CR>')

-- Move buffers
vim.keymap.set('n', '<leader>bn', '<Cmd>BufferLineMoveNext<CR>')
vim.keymap.set('n', '<leader>bm', '<Cmd>BufferLineMovePrev<CR>')

-- Close commands
vim.keymap.set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>')
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>')
```
