# TODO

## Remove plugin
remove:
- toggleterm.lua
- codecompanion
- anything related to nvim-tree plugin
- vim-doge
- copilotchat
- lazygit

## Inconsistencies

### Quit keybinding
There are different quit keybinding used across plugins:

| Plugin | Quit Key | Notes |
|--------|----------|-------|
| **Telescope** | `<Esc>` (n), `<C-c>` (i) | Cannot use `q` - needs text input |
| **Oil** | `<C-c>` | Could use `q` in normal mode, but blocks quick macros |
| **Neogit** | `q` | Uses Esc for other purposes, so `q` is appropriate |
| **Trouble** | `q`, `<Esc>` | Both work: `q` closes, `<Esc>` cancels |
| **DAP UI** | `q`, `<Esc>` | Both close floating windows |
| **nvim-ufo** | `q` | Closes preview window |
| **Diffview** | `q` | Closes option panel |
| **Alpha** | `q` | Closes dashboard |
| **nvim-bqf** | `<C-c>` | Closes quickfix window and aborts fzf |
| **nvim-scissors** | `q` | Cancels editing and closes popup |
| **Dressing** | `<Esc>`, `<C-c>` | Both close input/select windows |
| **Snacks picker** | `<Esc>` (n), `c` (explorer) | Various context-dependent |
| **Snacks terminal** | N/A | `gf` closes terminal before opening file |
| **Octo** | `<C-c>` | Closes review tab |

**Pattern Summary:**
- `q` - Most read-only/view buffers (neogit, trouble, dap, diffview, alpha, copilotchat, lazygit, nvim-tree, scissors)
- `<Esc>` - Insert mode or where `q` needs text input (telescope, dressing, trouble cancel)
- `<C-c>` - Alternative quit (oil, codecompanion, octo, bqf, dressing)
- Both `q` + `<Esc>` - Some plugins support both (trouble, dap ui)


## Fix List

### DAP Breakpoint Plugin
- Issue: Not configured properly, doesn't restore breakpoints

### Spell
- I don't know how to show spell suggestion on mispell

## Plugin to review 

### Dressing
Dressing is installed but plugin is archived. See if it can be completely replaced by snacks to remove it.

### Snacks
Is snacks useful?

## Plugins I don't use

- nvim-bqf
- nvim scissors

## Features to add

- I want to be able to use % on quote, double quote, and `` like for closed pair such as <>,(),{},[].
   - Example, cursor is on last " (after 123): "123", press %, now cursor is on first " (before 123)

