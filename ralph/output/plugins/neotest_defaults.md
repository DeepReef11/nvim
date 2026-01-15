# neotest Default Keybindings

## Overview

Neotest is an extensible framework for interacting with tests within Neovim. It provides a unified interface for running, debugging, and navigating test results across different testing frameworks through language-specific adapters. The plugin does NOT set any global keybindings by default - users must configure their own mappings. However, it does provide built-in keybindings within specific UI components like the Summary Window.

## Default Keybindings

### Global Keybindings

Neotest does **not** define any global keybindings out of the box. Users are expected to create their own mappings to the Lua API functions. Common examples include:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| (user-defined) | n | `require("neotest").run.run()` | Run the nearest test |
| (user-defined) | n | `require("neotest").run.run(vim.fn.expand("%"))` | Run all tests in current file |
| (user-defined) | n | `require("neotest").run.run({strategy = "dap"})` | Debug nearest test |
| (user-defined) | n | `require("neotest").run.stop()` | Stop running tests |
| (user-defined) | n | `require("neotest").run.attach()` | Attach to running test process |
| (user-defined) | n | `require("neotest").summary.toggle()` | Toggle summary window |
| (user-defined) | n | `require("neotest").output.open()` | Show test output |
| (user-defined) | n | `require("neotest").output_panel.toggle()` | Toggle output panel |

### Summary Window Keybindings

These keybindings are active **only within the neotest summary window**:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<CR>` | n | expand | Expand/collapse currently selected position |
| `<2-LeftMouse>` | n | expand | Expand/collapse currently selected position (mouse) |
| `e` | n | expand_all | Expand all positions under currently selected |
| `o` | n | output | Show output for selected position |
| `O` | n | short | Show short output for selected position |
| `a` | n | attach | Attach to process for selected position |
| `i` | n | jumpto | Jump to the selected position in code |
| `u` | n | stop | Stop selected position |
| `r` | n | run | Run selected position |
| `d` | n | debug | Debug selected position |
| `m` | n | mark | Mark the selected position |
| `R` | n | run_marked | Run the marked positions for selected suite |
| `D` | n | debug_marked | Debug the marked positions for selected suite |
| `M` | n | clear_marked | Clear the marked positions for selected suite |
| `t` | n | target | Target a position to be the only shown position |
| `T` | n | clear_target | Clear the target position for selected adapter |
| `J` | n | next_failed | Jump to the next failed position |
| `K` | n | prev_failed | Jump to the previous failed position |
| `>` | n | next_sibling | Jump to the next sibling of selected |
| `<` | n | prev_sibling | Jump to the previous sibling of selected |
| `P` | n | parent | Jump to the parent of selected |
| `w` | n | watch | Toggle watching for changes |
| `?` | n | help | Show help |

### Jump Consumer (Example Mappings)

The documentation provides these example mappings for the jump consumer:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `[n` | n | `require("neotest").jump.prev({ status = "failed" })` | Jump to previous failed test |
| `]n` | n | `require("neotest").jump.next({ status = "failed" })` | Jump to next failed test |

## Configuration

Summary window mappings can be customized in the setup function:

```lua
require("neotest").setup({
  summary = {
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" },
      expand_all = "e",
      output = "o",
      short = "O",
      attach = "a",
      jumpto = "i",
      stop = "u",
      run = "r",
      debug = "d",
      mark = "m",
      run_marked = "R",
      debug_marked = "D",
      clear_marked = "M",
      target = "t",
      clear_target = "T",
      next_failed = "J",
      prev_failed = "K",
      watch = "w",
      help = "?",
    },
  },
})
```

## Notes

- All summary window keybindings operate in normal mode (`n`)
- The summary window must be focused for its keybindings to work
- Global keybindings must be set up by the user in their Neovim configuration
- Neotest requires nvim-nio and plenary.nvim as dependencies
- Test adapters are required for specific languages/frameworks

## Sources

- [nvim-neotest/neotest GitHub Repository](https://github.com/nvim-neotest/neotest)
- [Neotest Documentation](https://github.com/nvim-neotest/neotest/blob/master/doc/neotest.txt)
