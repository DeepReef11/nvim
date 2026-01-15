# Plugin: yanky.nvim

**Source File:** `lua/plugins/yanky.lua`

## Overview

Yanky.nvim improves yank and put functionality with a yank history ring, Telescope integration, and advanced put operations.

## Keybindings

### Yank History

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>pp` | n | `telescope.extensions.yank_history.yank_history` | Open Yank History |
| `<c-p>` | n | `<Plug>(YankyPreviousEntry)` | Select previous entry through yank history |
| `<c-n>` | n | `<Plug>(YankyNextEntry)` | Select next entry through yank history |

### Core Yank/Put Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `y` | n, x | `<Plug>(YankyYank)` | Yank text |
| `p` | n, x | `<Plug>(YankyPutAfter)` | Put yanked text after cursor |
| `P` | n, x | `<Plug>(YankyPutBefore)` | Put yanked text before cursor |
| `gp` | n, x | `<Plug>(YankyGPutAfter)` | Put yanked text after selection |
| `gP` | n, x | `<Plug>(YankyGPutBefore)` | Put yanked text before selection |

### Charwise Put Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<M-p>` | n, x | `<Plug>(YankyPutAfterCharwise)` | Put yanked text right after cursor charwise |
| `<M-P>` | n, x | `<Plug>(YankyPutBeforeCharwise)` | Put yanked text right before cursor charwise |
| `ø` | n, x | `<Plug>(YankyPutAfterCharwise)` | Charwise Put yanked text right after cursor |
| `Ø` | n, x | `<Plug>(YankyPutBeforeCharwise)` | Charwise Put yanked text right before cursor |

### Linewise Put with Indentation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]p` | n | `<Plug>(YankyPutIndentAfterLinewise)` | Put indented after cursor (linewise) |
| `[p` | n | `<Plug>(YankyPutIndentBeforeLinewise)` | Put indented before cursor (linewise) |
| `]P` | n | `<Plug>(YankyPutIndentAfterLinewise)` | Put indented after cursor (linewise) |
| `[P` | n | `<Plug>(YankyPutIndentBeforeLinewise)` | Put indented before cursor (linewise) |

### Put with Shift

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `>p` | n | `<Plug>(YankyPutIndentAfterShiftRight)` | Put and indent right |
| `<p` | n | `<Plug>(YankyPutIndentAfterShiftLeft)` | Put and indent left |
| `>P` | n | `<Plug>(YankyPutIndentBeforeShiftRight)` | Put before and indent right |
| `<P` | n | `<Plug>(YankyPutIndentBeforeShiftLeft)` | Put before and indent left |

### Filtered Put

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `=p` | n | `<Plug>(YankyPutAfterFilter)` | Put after applying a filter |
| `=P` | n | `<Plug>(YankyPutBeforeFilter)` | Put before applying a filter |

## Configuration Notes

- Uses shada storage for yank history (100 entries)
- Syncs with numbered registers
- Highlights on put and yank (1500ms timer)
- Ignores black hole register (`_`)
