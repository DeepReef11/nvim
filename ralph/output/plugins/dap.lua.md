# DAP (Debug Adapter Protocol) Plugin Keybindings

Source: `lua/plugins/dap.lua`

## nvim-dap Core Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>da` | n | `require('dap').continue()` | Start/continue debugging |
| `<Leader>db` | n | `require('dap').toggle_breakpoint()` | Toggle breakpoint |
| `<Leader>dd` | n | `require('dap').continue()` | Start/continue debugging (duplicate) |
| `<Leader>dh` | n | `require('dapui').eval()` | Evaluate expression under cursor |
| `<Leader>di` | n | `require('dap').step_into()` | Step into |
| `<Leader>do` | n | `require('dap').step_over()` | Step over |
| `<Leader>dO` | n | `require('dap').step_out()` | Step out |
| `<Leader>dT` | n | `require('dap').terminate()` | Terminate debug session |
| `<Leader>du` | n | `require('dapui').open()` | Open DAP UI |
| `<Leader>dc` | n | `require('dapui').close()` | Close DAP UI |
| `<Leader>dx` | n | `require('dap-go').debug_test()` | Debug Go test |

## DAP UI Float Elements

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>dw` | n | `dapui.float_element('watches')` | Open watches float |
| `<Leader>ds` | n | `dapui.float_element('scopes')` | Open scopes float |
| `<Leader>dr` | n | `dapui.float_element('repl')` | Open REPL float |

## DAP UI Internal Mappings

These work inside DAP UI windows:

| Key | Action | Description |
|-----|--------|-------------|
| `<CR>` | expand | Expand/collapse item |
| `<2-LeftMouse>` | expand | Expand/collapse item (double click) |
| `o` | open | Open item |
| `d` | remove | Remove item |
| `e` | edit | Edit item |
| `r` | repl | Send to REPL |
| `t` | toggle | Toggle item |
| `q` | close | Close floating window |
| `<Esc>` | close | Close floating window |

## dap-breakpoints.nvim Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>dts` | n | `set_breakpoint` | Set breakpoint |
| `<leader>dtc` | n | `set_conditional_breakpoint` | Set conditional breakpoint |
| `<leader>dth` | n | `set_hit_condition_breakpoint` | Set hit condition breakpoint |
| `<leader>dtl` | n | `set_log_point` | Set log point |
| `<leader>dtL` | n | `load_breakpoints` | Load breakpoints from file |
| `<leader>dtS` | n | `save_breakpoints` | Save breakpoints to file |
| `<leader>dte` | n | `edit_property` | Edit breakpoint property |
| `<leader>dtE` | n | `edit_property({ all = true })` | Edit all breakpoints properties |
| `<leader>dtv` | n | `toggle_virtual_text` | Toggle breakpoint virtual text |
| `<leader>dtC` | n | `clear_all_breakpoints` | Clear all breakpoints |
| `[b` | n | `go_to_previous` | Go to previous breakpoint |
| `]b` | n | `go_to_next` | Go to next breakpoint |
| `<M-b>` | n | `popup_reveal` | Show breakpoint popup |
| `<leader>def` | n | `edit_exception_filters` | Edit exception filters |

## Lazy Loading Keys

Plugin loads on: `<Leader>da`, `<Leader>db`, `<Leader>dc`, `<Leader>dd`, `<Leader>dh`, `<Leader>di`, `<Leader>do`, `<Leader>dO`
