# dressing.lua Plugin Keybindings

**Source:** `lua/plugins/ui/dressing.lua`
**Plugin:** stevearc/dressing.nvim

## Overview
dressing.nvim provides improved UI for `vim.ui.input` and `vim.ui.select` functions. The keybindings are contextual within these UI elements.

## Input Window Keybindings

### Normal Mode (dressing-input-n)
| Key | Action | Description |
|-----|--------|-------------|
| `<Esc>` | Close | Close the input window |
| `<CR>` | Confirm | Confirm the input |

### Insert Mode (dressing-input-i)
| Key | Action | Description |
|-----|--------|-------------|
| `<C-c>` | Close | Close the input window |
| `<CR>` | Confirm | Confirm the input |
| `<Up>` | HistoryPrev | Navigate to previous history entry |
| `<Down>` | HistoryNext | Navigate to next history entry |

## Select Window Keybindings (Builtin)

### Normal/Insert Mode (dressing-select)
| Key | Action | Description |
|-----|--------|-------------|
| `<Esc>` | Close | Close the select window |
| `<C-c>` | Close | Close the select window |
| `<CR>` | Confirm | Confirm the selection |

## Notes
- The select function uses telescope by default if available (backend priority: telescope, nui, fzf, builtin)
- When using telescope as backend, telescope keybindings apply instead
- Input window starts in insert mode by default (`start_in_insert = true`)
- `<Esc>` in insert mode closes the modal (`insert_only = true`)
