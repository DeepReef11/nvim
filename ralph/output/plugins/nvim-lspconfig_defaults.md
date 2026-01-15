# nvim-lspconfig Default Keybindings

> **Note:** nvim-lspconfig itself does not define keybindings. It is a collection of LSP server configurations. The keybindings below are Neovim's built-in LSP defaults (introduced in Neovim 0.11+) that are automatically enabled when an LSP client attaches to a buffer.

## Global LSP Keymaps

These keymaps are created unconditionally when Neovim starts (Neovim 0.11+):

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `grn` | n | `vim.lsp.buf.rename()` | Rename all references to the symbol under cursor |
| `grr` | n | `vim.lsp.buf.references()` | List all references in quickfix window |
| `gri` | n | `vim.lsp.buf.implementation()` | Jump to implementation of symbol |
| `grt` | n | `vim.lsp.buf.type_definition()` | Jump to type definition |
| `gra` | n, x | `vim.lsp.buf.code_action()` | Select a code action at cursor position |
| `gO` | n | `vim.lsp.buf.document_symbol()` | List all symbols in current buffer |
| `<C-s>` | i, s | `vim.lsp.buf.signature_help()` | Display signature help in floating window |
| `K` | n | `vim.lsp.buf.hover()` | Display hover information (unless keywordprg is customized) |

## Diagnostic Navigation Keymaps

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `[d` | n | `vim.diagnostic.goto_prev()` | Go to previous diagnostic in buffer |
| `]d` | n | `vim.diagnostic.goto_next()` | Go to next diagnostic in buffer |
| `[D` | n | `vim.diagnostic.goto_first()` | Jump to first diagnostic in buffer |
| `]D` | n | `vim.diagnostic.goto_last()` | Jump to last diagnostic in buffer |

## Buffer-Local Defaults

When an LSP client attaches to a buffer, these options are automatically configured:

| Key/Option | Mode | Action | Description |
|------------|------|--------|-------------|
| `<C-x><C-o>` | i | `vim.lsp.omnifunc()` | LSP omnifunc completion |
| `<C-]>` | n | `vim.lsp.tagfunc()` | Go to definition via tagfunc |
| `<C-w>]` | n | `vim.lsp.tagfunc()` | Go to definition in split window |
| `<C-w>}` | n | `vim.lsp.tagfunc()` | Go to definition in preview window |
| `gq{motion}` | n | `vim.lsp.formatexpr()` | Format lines using LSP |

## Mode Legend

- `n` = Normal mode
- `i` = Insert mode
- `x` = Visual mode
- `s` = Select mode
- `o` = Operator-pending mode

## Customization

To remove or override these default mappings, you can use:

```lua
-- Remove a global keymap
vim.keymap.del('n', 'grn')

-- Override with custom behavior in LspAttach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
  end,
})
```

## Commands

nvim-lspconfig provides these commands:

| Command | Description |
|---------|-------------|
| `:LspInfo` | View attached/active/configured LSP servers |
| `:LspLog` | Open LSP log file |
| `:LspRestart` | Restart the attached LSP client(s) |
| `:LspStart` | Start the LSP client for the current buffer |
| `:LspStop` | Stop the attached LSP client(s) |

## References

- [Neovim LSP Documentation](https://neovim.io/doc/user/lsp.html)
- [nvim-lspconfig GitHub](https://github.com/neovim/nvim-lspconfig)
- [What's New in Neovim 0.11](https://gpanders.com/blog/whats-new-in-neovim-0-11/)
