# refactoring.nvim Default Keybindings

**Plugin:** [ThePrimeagen/refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)

## Important Note

**refactoring.nvim does NOT ship with any default keybindings out of the box.** All keybindings must be configured manually by the user. The plugin provides the functionality through Ex commands and Lua API, but leaves keybinding choices entirely to the user.

---

## Recommended Keybindings

The plugin documentation suggests the following keybinding configuration:

### Refactoring Operations

| Key | Mode | Command | Description |
|-----|------|---------|-------------|
| `<leader>re` | x (visual) | `:Refactor extract ` | Extract selection into a new function |
| `<leader>rf` | x (visual) | `:Refactor extract_to_file ` | Extract selection into a new function in a separate file |
| `<leader>rv` | x (visual) | `:Refactor extract_var ` | Extract selection into a variable |
| `<leader>ri` | n, x (normal, visual) | `:Refactor inline_var` | Inline a variable (replace variable with its value) |
| `<leader>rI` | n (normal) | `:Refactor inline_func` | Inline a function (replace call with function body) |
| `<leader>rb` | n (normal) | `:Refactor extract_block` | Extract code block into a new function |
| `<leader>rbf` | n (normal) | `:Refactor extract_block_to_file` | Extract code block into a function in a separate file |

### Debug Operations

| Key | Mode | Command | Description |
|-----|------|---------|-------------|
| `<leader>rp` | n (normal) | `require('refactoring').debug.printf({below = false})` | Insert debug print statement to mark function calls |
| `<leader>rv` | n, x (normal, visual) | `require('refactoring').debug.print_var()` | Insert print statement to output variable value |
| `<leader>rc` | n (normal) | `require('refactoring').debug.cleanup({})` | Remove all plugin-generated debug print statements |

---

## Mode Legend

| Mode | Description |
|------|-------------|
| `n` | Normal mode |
| `v` | Visual mode (characterwise) |
| `x` | Visual mode (characterwise and linewise) |
| `i` | Insert mode |
| `o` | Operator-pending mode |
| `t` | Terminal mode |

---

## Available Refactoring Operations

### Visual Mode Operations (x)

These operations require selecting code in visual mode first:

1. **Extract Function** (`extract`) - Extract selected code into a new function
2. **Extract to File** (`extract_to_file`) - Extract selected code into a function in a new file
3. **Extract Variable** (`extract_var`) - Extract selected expression into a variable

### Normal Mode Operations (n)

These operations work on the code block at cursor position:

1. **Extract Block** (`extract_block`) - Extract the current code block into a new function
2. **Extract Block to File** (`extract_block_to_file`) - Extract block into a function in a new file
3. **Inline Function** (`inline_func`) - Replace function call with the function's body

### Dual Mode Operations (n, x)

These work in both normal and visual modes:

1. **Inline Variable** (`inline_var`) - Replace variable references with the variable's value

---

## Alternative Selection Methods

### Using Neovim's Built-in Selection UI

```lua
vim.keymap.set({"n", "x"}, "<leader>rr", function()
  require('refactoring').select_refactor()
end)
```

This opens a selection menu showing all available refactoring options for the current context.

### Using Telescope

```lua
vim.keymap.set({"n", "x"}, "<leader>rr", function()
  require('telescope').extensions.refactoring.refactors()
end)
```

This opens Telescope with available refactoring options.

---

## Supported Languages

refactoring.nvim supports the following languages:
- TypeScript/JavaScript
- Lua
- Go
- Python
- Java
- PHP
- Ruby
- C/C++

---

## Dependencies

- `nvim-lua/plenary.nvim`
- `nvim-treesitter/nvim-treesitter`
