# nvim-spider Default Keybindings

> **Important**: nvim-spider does NOT create any keybindings by default. Users must manually configure mappings.

## Recommended Keybindings

The plugin author recommends the following mappings to replace Vim's default word motions:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `w` | n, o, x | `require('spider').motion('w')` | Move forward to start of next subword |
| `e` | n, o, x | `require('spider').motion('e')` | Move forward to end of current/next subword |
| `b` | n, o, x | `require('spider').motion('b')` | Move backward to start of previous subword |
| `ge` | n, o, x | `require('spider').motion('ge')` | Move backward to end of previous subword |

### Mode Legend

| Mode | Name | Description |
|------|------|-------------|
| `n` | Normal | Standard normal mode navigation |
| `o` | Operator-pending | Works with operators like `d`, `c`, `y` |
| `x` | Visual | Works in visual/select mode |

## Insert Mode Mappings (Optional)

These are optional mappings for insert mode navigation:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-f>` | i | Forward word motion | Move forward by subword in insert mode |
| `<C-b>` | i | Backward word motion | Move backward by subword in insert mode |

## Special Custom Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `cw` | n | `c<cmd>lua require('spider').motion('e')<CR>` | Change word with consistent behavior |

## Configuration Example

```lua
-- Basic keybindings (recommended)
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>")

-- Optional: Insert mode mappings
vim.keymap.set("i", "<C-f>", "<Esc>l<cmd>lua require('spider').motion('w')<CR>i")
vim.keymap.set("i", "<C-b>", "<Esc><cmd>lua require('spider').motion('b')<CR>i")
```

## Key Differences from Default Vim Motions

1. **Subword-aware**: Stops at segments within `camelCase`, `SNAKE_CASE`, and `kebab-case` identifiers
2. **Skips insignificant punctuation**: Punctuation sequences surrounded by whitespace are skipped
3. **Ignores iskeyword**: Does not depend on Vim's `iskeyword` option
4. **Consistent operator-pending**: Optional setting to make `cw` behave consistently with `dw`

## Source

- [nvim-spider GitHub Repository](https://github.com/chrisgrieser/nvim-spider)
