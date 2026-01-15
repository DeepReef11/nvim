# nvim-dap-ui Default Keybindings

nvim-dap-ui is a UI plugin for nvim-dap debugger that provides visual debugging elements including variable scopes, watch expressions, call stacks, breakpoints, and a REPL console.

## Global Element Mappings

These mappings work across all dap-ui elements (scopes, watches, stacks, breakpoints, etc.) in normal mode:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<CR>` | n | expand | Toggle display of variable/expression children |
| `<2-LeftMouse>` | n | expand | Toggle display of variable/expression children (double-click) |
| `o` | n | open | Jump to stack frame location or breakpoint position |
| `d` | n | remove | Delete watched expression or breakpoint |
| `e` | n | edit | Modify variable value or expression |
| `r` | n | repl | Send variable/expression to the REPL |
| `t` | n | toggle | Toggle breakpoint state or show/hide subtle stack frames |

## Floating Window Mappings

These mappings work in floating windows created by `dapui.float_element()` or `dapui.eval()`:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `q` | n | close | Dismiss the floating window |
| `<Esc>` | n | close | Dismiss the floating window |

## Element-Specific Behaviors

### Scopes Element
- `edit` (`e`): Modify variable values directly
- `expand` (`<CR>`): Show/hide nested variable children
- `repl` (`r`): Send variable to REPL for evaluation

### Stacks Element
- `open` (`o`): Jump to stack frame location in source code
- `toggle` (`t`): Show/hide subtle (non-user) stack frames

### Watches Element
- `expand` (`<CR>`): Toggle expression children visibility
- `remove` (`d`): Delete watched expression
- `edit` (`e`): Modify expression or child variable value
- `repl` (`r`): Send expression to REPL
- Insert mode in prompt buffer allows entering new watch expressions; press `<CR>` to submit

### Breakpoints Element
- `open` (`o`): Navigate to breakpoint location in source code
- `toggle` (`t`): Enable/disable breakpoint
- `remove` (`d`): Delete breakpoint (enabled breakpoints only)

## Visual Mode Eval (Suggested Mapping)

The plugin suggests this user-defined mapping for evaluating selected text:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<M-k>` | v | eval | Open hover window showing value of highlighted text |

Note: This is not a built-in default but a commonly recommended configuration:
```lua
vim.keymap.set("v", "<M-k>", function() require("dapui").eval() end)
```

## Winbar Controls

When enabled, the winbar displays debugging control buttons (requires Neovim winbar feature):
- Play/Continue
- Pause
- Step Over
- Step Into
- Step Out
- Step Back
- Run to Cursor
- Terminate/Disconnect

These are mouse-clickable controls, not keyboard mappings.

## Customization

All mappings can be customized via `require("dapui").setup()`:

```lua
require("dapui").setup({
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  element_mappings = {
    -- Per-element overrides
  },
  floating = {
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})
```

## References

- [GitHub Repository](https://github.com/rcarriga/nvim-dap-ui)
- Help: `:h dapui.setup()`
- Help: `:h nvim-dap-ui`
