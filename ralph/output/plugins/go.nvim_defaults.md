# go.nvim Default Keybindings

## Overview

go.nvim (ray-x/go.nvim) is a modern Go development plugin for Neovim that provides IDE-like features including LSP integration, debugging (DAP), code generation, testing, and treesitter-based text objects. The plugin emphasizes user customization but provides sensible defaults when enabled through configuration flags.

**Note:** Most keybindings are controlled by configuration options:
- `lsp_keymaps = true` (default) - Enables LSP keybindings
- `dap_debug_keymap = true` (default) - Enables debug keybindings
- `textobjects = true` (default) - Enables treesitter text object keybindings

## Default Keybindings

### LSP Keybindings (lsp_keymaps = true)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `K` | n | Hover | Display hover information for symbol under cursor |
| `gd` | n | Definition | Jump to definition |
| `gD` | n | Type Definition | Jump to type definition |
| `gi` | n | Implementation | Jump to implementation |
| `gr` | n | References | Find all references |
| `<C-k>` | n | Signature Help | Show function signature help |
| `<space>rn` | n | Rename | Rename symbol under cursor |
| `<space>ca` | n | Code Action | Execute code action |
| `<space>ca` | v | Code Action | Execute code action on selection |
| `<space>e` | n | Diagnostic Float | Show diagnostic in floating window |
| `<space>q` | n | Diagnostic List | Open diagnostics in location list |
| `[d` | n | Prev Diagnostic | Navigate to previous diagnostic |
| `]d` | n | Next Diagnostic | Navigate to next diagnostic |
| `]O` | n | Diagnostic Loclist | Open diagnostic location list |
| `<space>wa` | n | Add Workspace | Add workspace folder |
| `<space>wr` | n | Remove Workspace | Remove workspace folder |
| `<space>wl` | n | List Workspaces | Print list of workspace folders |
| `<space>ff` | n | Format | Format document (if server supports) |

### DAP Debug Keybindings (dap_debug_keymap = true)

These keybindings are active during debug sessions:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `r` | n | Run | Execute DAP run |
| `c` | n | Continue | Continue execution |
| `n` | n | Step Over | Step over (next line) |
| `s` | n | Step Into | Step into function |
| `o` | n | Step Out | Step out of function |
| `S` | n | Stop | Stop debug session |
| `u` | n | Up | Move up in stack frame |
| `D` | n | Down | Move down in stack frame |
| `C` | n | Run to Cursor | Run to cursor position |
| `b` | n | Breakpoint | Toggle breakpoint |
| `P` | n | Pause | Pause execution |
| `p` | n, v | Hover/Eval | Print/hover value (also works in visual mode) |

### DAP UI Keybindings (when dap_debug_gui = true)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `K` | n | Float Element | Display float element |
| `B` | n | Breakpoints | Float breakpoints window |
| `R` | n | REPL | Float REPL window |
| `O` | n | Scopes | Float scopes window |
| `a` | n | Stacks | Float stacks window |
| `w` | n | Watches | Float watches window |

### DAP Telescope Keybindings (optional, when telescope loaded)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `lb` | n | List Breakpoints | List breakpoints via Telescope |
| `tv` | n | Variables | Display variables via Telescope |
| `bt` | n | Stack Frames | Show stack frames via Telescope |

### Treesitter Text Objects (textobjects = true)

#### Selection (Operator-pending and Visual modes)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `af` | o, x | Outer Function | Select around function |
| `if` | o, x | Inner Function | Select inside function |
| `ac` | o, x | Outer Class | Select around class/struct |
| `ic` | o, x | Inner Class | Select inside class/struct |

#### Movement (Normal mode)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]]` | n | Next Function Start | Jump to next function start |
| `][` | n | Next Function End | Jump to next function end |
| `[[` | n | Prev Function Start | Jump to previous function start |
| `[]` | n | Prev Function End | Jump to previous function end |

## Configuration

To customize or disable default keybindings, modify your setup:

```lua
require('go').setup({
  lsp_keymaps = true,        -- set to false to disable LSP keymaps
  dap_debug_keymap = true,   -- set to false to disable DAP keymaps
  textobjects = true,        -- set to false to disable text objects
  dap_debug_gui = true,      -- enables additional DAP UI keymaps
})
```

## Notes

- DAP keybindings are dynamically bound/unbound when debug sessions start/stop
- LSP keybindings require gopls to be properly configured
- Text object keybindings require treesitter to be enabled
- The plugin does not define many default keybindings for its commands (like `:GoTest`, `:GoRun`, etc.) - users are expected to create their own mappings

## Sources

- [go.nvim GitHub Repository](https://github.com/ray-x/go.nvim)
- [go.nvim lsp.lua](https://github.com/ray-x/go.nvim/blob/master/lua/go/lsp.lua)
- [go.nvim dap.lua](https://github.com/ray-x/go.nvim/blob/master/lua/go/dap.lua)
