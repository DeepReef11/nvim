# nvim-treesitter Default Keybindings

nvim-treesitter provides Treesitter configurations and an abstraction layer for Neovim.

## Important Note

nvim-treesitter itself provides **minimal default keybindings**. The core plugin primarily provides:
- Syntax highlighting (no keybindings)
- Indentation (no keybindings)
- Folding (uses Neovim's standard fold commands)
- Incremental selection (keybindings below)

Additional keybindings come from companion plugins like `nvim-treesitter-textobjects`.

---

## Incremental Selection (Core nvim-treesitter)

The only module in core nvim-treesitter with default keybindings. Must be enabled in config.

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gnn` | n | init_selection | Start incremental selection at cursor |
| `grn` | v | node_incremental | Expand selection to next named parent node |
| `grc` | v | scope_incremental | Expand selection to next scope (defined in locals.scm) |
| `grm` | v | node_decremental | Shrink selection to previous named node |

**Configuration example:**
```lua
require('nvim-treesitter.configs').setup({
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
```

---

## nvim-treesitter-textobjects Defaults

The `nvim-treesitter-textobjects` companion plugin provides textobject-based keybindings. These are **example defaults** shown in documentation - they require explicit configuration.

### Text Object Selection

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `af` | o, x | @function.outer | Select around function |
| `if` | o, x | @function.inner | Select inside function |
| `ac` | o, x | @class.outer | Select around class |
| `ic` | o, x | @class.inner | Select inside class |

### Text Object Movement

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]m` | n, x, o | goto_next_start @function.outer | Jump to next function start |
| `]M` | n, x, o | goto_next_end @function.outer | Jump to next function end |
| `]]` | n, x, o | goto_next_start @class.outer | Jump to next class start |
| `][` | n, x, o | goto_next_end @class.outer | Jump to next class end |
| `[m` | n, x, o | goto_previous_start @function.outer | Jump to previous function start |
| `[M` | n, x, o | goto_previous_end @function.outer | Jump to previous function end |
| `[[` | n, x, o | goto_previous_start @class.outer | Jump to previous class start |
| `[]` | n, x, o | goto_previous_end @class.outer | Jump to previous class end |

### Text Object Swap

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>a` | n | swap_next @parameter.inner | Swap parameter with next |
| `<leader>A` | n | swap_previous @parameter.inner | Swap parameter with previous |

### LSP Interop (Peek Definition)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>df` | n | peek_definition_code @function.outer | Peek function definition |
| `<leader>dF` | n | peek_definition_code @class.outer | Peek class definition |

---

## Mode Legend

| Mode | Description |
|------|-------------|
| n | Normal mode |
| v | Visual mode |
| x | Visual mode (excluding select mode) |
| o | Operator-pending mode |

---

## Notes

1. **Incremental selection** is the only feature with true defaults in core nvim-treesitter
2. **Textobjects keybindings** from nvim-treesitter-textobjects are examples that require explicit setup
3. Highlighting, indentation, and folding features operate without dedicated keybindings
4. nvim-treesitter does not support lazy-loading
5. Custom keymaps follow standard Neovim format (e.g., `<C-a>`, `<leader>x`, `<CR>`)

---

## References

- [nvim-treesitter GitHub](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter-textobjects GitHub](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter documentation](https://github.com/nvim-treesitter/nvim-treesitter/blob/master/doc/nvim-treesitter.txt)
