# yanky.nvim Default Keybindings

> **Plugin:** [gbprod/yanky.nvim](https://github.com/gbprod/yanky.nvim)
> **Purpose:** Improved yank and put functionality with history support

## Important Note

**yanky.nvim does not provide any default keybindings out of the box.** The plugin explicitly states:

> "This plugin contains no default mappings and will have no effect until you add your own maps to it."

All keybindings below are **recommended mappings** that users must configure manually.

---

## Recommended Keybindings

### Core Yank/Put Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `y` | n, x | `<Plug>(YankyYank)` | Yank text (enhanced with history tracking) |
| `p` | n, x | `<Plug>(YankyPutAfter)` | Put yanked text after cursor |
| `P` | n, x | `<Plug>(YankyPutBefore)` | Put yanked text before cursor |
| `gp` | n, x | `<Plug>(YankyGPutAfter)` | Put after cursor, cursor moves to end of text |
| `gP` | n, x | `<Plug>(YankyGPutBefore)` | Put before cursor, cursor moves to end of text |

### Yank Ring Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-p>` | n | `<Plug>(YankyPreviousEntry)` | Cycle backward through yank history |
| `<C-n>` | n | `<Plug>(YankyNextEntry)` | Cycle forward through yank history |

### History Picker

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>p` | n, x | `:YankyRingHistory` | Open yank history picker (Telescope/fzf-lua/Snacks) |

### Special Put - Linewise with Indentation (vim-unimpaired style)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]p` | n | `<Plug>(YankyPutIndentAfterLinewise)` | Put linewise after, adjust indentation |
| `[p` | n | `<Plug>(YankyPutIndentBeforeLinewise)` | Put linewise before, adjust indentation |
| `]P` | n | `<Plug>(YankyPutIndentAfterLinewise)` | Put linewise after, adjust indentation (alias) |
| `[P` | n | `<Plug>(YankyPutIndentBeforeLinewise)` | Put linewise before, adjust indentation (alias) |

### Special Put - Shift Right/Left

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `>p` | n | `<Plug>(YankyPutIndentAfterShiftRight)` | Put after with one shiftwidth right indent |
| `<p` | n | `<Plug>(YankyPutIndentAfterShiftLeft)` | Put after with one shiftwidth left indent |
| `>P` | n | `<Plug>(YankyPutIndentBeforeShiftRight)` | Put before with one shiftwidth right indent |
| `<P` | n | `<Plug>(YankyPutIndentBeforeShiftLeft)` | Put before with one shiftwidth left indent |

### Special Put - Filter

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `=p` | n | `<Plug>(YankyPutAfterFilter)` | Put after and re-indent with `=` operator |
| `=P` | n | `<Plug>(YankyPutBeforeFilter)` | Put before and re-indent with `=` operator |

### Text Object

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `iy` | o, x | `require("yanky.textobj").last_put()` | Select the last put/yanked text |

---

## Mode Legend

| Mode | Description |
|------|-------------|
| `n` | Normal mode |
| `x` | Visual mode |
| `o` | Operator-pending mode |

---

## Example Configuration

```lua
-- Lazy.nvim example
{
  "gbprod/yanky.nvim",
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put after, cursor follows" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before, cursor follows" },
    { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Cycle to previous yank" },
    { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Cycle to next yank" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put linewise after" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put linewise before" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put after, shift right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put after, shift left" },
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after with filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before with filter" },
  },
  opts = {},
}
```
