# nvim-dap Default Keybindings

> **Important:** nvim-dap does NOT provide any default keybindings out of the box. The plugin explicitly avoids setting mappings to prevent conflicts with user-defined keymaps. All keybindings must be configured manually by the user.

## Recommended Keybindings

The official documentation suggests the following keybindings as examples for users to configure:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<F5>` | n | `dap.continue()` | Resume execution or start new debug session |
| `<F10>` | n | `dap.step_over()` | Step over current line |
| `<F11>` | n | `dap.step_into()` | Step into function/method |
| `<F12>` | n | `dap.step_out()` | Step out of current scope |
| `<Leader>b` | n | `dap.toggle_breakpoint()` | Toggle breakpoint at cursor |
| `<Leader>B` | n | `dap.set_breakpoint()` | Set/overwrite breakpoint at cursor |
| `<Leader>lp` | n | `dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))` | Set log point with message |
| `<Leader>dr` | n | `dap.repl.open()` | Open debug REPL console |
| `<Leader>dl` | n | `dap.run_last()` | Re-run last debug configuration |

## Widget Keybindings (Visual Mode Support)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>dh` | n, v | `require('dap.ui.widgets').hover()` | Hover evaluation (visual mode uses selection) |
| `<Leader>dp` | n, v | `require('dap.ui.widgets').preview()` | Preview window |
| `<Leader>df` | n | `widgets.centered_float(widgets.frames)` | Display stack frames in floating window |
| `<Leader>ds` | n | `widgets.centered_float(widgets.scopes)` | Display variable scopes in floating window |

## Alternative Arrow Key Mapping (Suggested)

The documentation suggests arrow keys as intuitive alternatives for stepping:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Down>` | n | `dap.step_over()` | Step over (down in code flow) |
| `<Right>` | n | `dap.step_into()` | Step into (deeper into call stack) |
| `<Left>` | n | `dap.step_out()` | Step out (back up call stack) |
| `<Up>` | n | `dap.restart_frame()` | Restart current frame |

## All Available Functions for Custom Mappings

### Session Management

| Function | Description |
|----------|-------------|
| `dap.continue()` | Resume execution or start new debug session |
| `dap.run(config, opts)` | Launch debug adapter with configuration |
| `dap.run_last()` | Re-run last debug adapter/configuration |
| `dap.restart(config)` | Restart current session |
| `dap.terminate(opts)` | End debug session |
| `dap.disconnect(opts, cb)` | Disconnect from debugger |
| `dap.close()` | Close current session |

### Stepping and Execution Control

| Function | Description |
|----------|-------------|
| `dap.step_over(opts)` | Execute next line |
| `dap.step_into(opts)` | Step into function/method |
| `dap.step_out(opts)` | Step out of current scope |
| `dap.step_back(opts)` | Step backward (requires reverse debugging support) |
| `dap.reverse_continue()` | Execute in reverse until breakpoint |
| `dap.pause(thread_id)` | Pause thread execution |
| `dap.run_to_cursor()` | Continue execution to cursor location |

### Stack Navigation

| Function | Description |
|----------|-------------|
| `dap.up()` | Move up in stack trace |
| `dap.down()` | Move down in stack trace |
| `dap.goto_(line)` | Jump to specific line |
| `dap.focus_frame()` | Jump to current frame location |
| `dap.restart_frame()` | Restart current frame execution |

### Breakpoints

| Function | Description |
|----------|-------------|
| `dap.toggle_breakpoint(condition, hit_condition, log_message)` | Create/remove breakpoint |
| `dap.set_breakpoint(condition, hit_condition, log_message)` | Create/overwrite breakpoint |
| `dap.list_breakpoints()` | Display all breakpoints in quickfix |
| `dap.clear_breakpoints()` | Remove all breakpoints |
| `dap.set_exception_breakpoints(filters, exceptionOptions)` | Configure exception stops |

### REPL and Evaluation

| Function | Description |
|----------|-------------|
| `dap.repl.open(winopts, wincmd)` | Open debug console |
| `dap.repl.toggle(winopts, wincmd)` | Toggle REPL visibility |
| `dap.repl.close()` | Close REPL |
| `dap.repl.execute(text)` | Execute expression in REPL |

## Available Commands

| Command | Description |
|---------|-------------|
| `:DapToggleBreakpoint` | Toggle breakpoint at cursor |
| `:DapNew` | Launch new debug session |
| `:DapContinue` | Resume execution |
| `:DapStepOver` | Step over current line |
| `:DapStepInto` | Step into function |

## REPL Commands (Inside Debug Console)

| Command | Description |
|---------|-------------|
| `.help` | Show help documentation |
| `.frames` | View stack frames |
| `.threads` | View threads |
| `.scopes` | View variable scopes |

## Example Configuration

```lua
-- Basic debugging keymaps
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

-- Widget keymaps (with visual mode support)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
```

## Notes

- All modes listed are Normal mode (`n`) unless otherwise specified
- Visual mode (`v`) support is available for hover and preview widgets
- The plugin follows common debugging conventions (F5/F10/F11/F12) similar to VS Code and other IDEs
- Temporary keymaps can be created during debug sessions using event listeners via `:help dap-listeners`
