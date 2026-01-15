# Telescope Search Keymaps

Source: `lua/plugins/telescope/keymaps/search.lua`

## Keybindings

### Help and Documentation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>sh` | n | `builtin.help_tags()` | Search Help |
| `<leader>sk` | n | `builtin.keymaps()` | Search Keymaps |
| `<leader>st` | n | `builtin.builtin()` | Search Telescope |
| `<leader>sq` | n | `builtin.quickfix()` | Search Quickfix |

### Symbol Search (LSP)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ssa` | n | `builtin.lsp_document_symbols()` | Search Symbols All |
| `<leader>ssr` | n | `builtin.lsp_references()` | Search Symbols References |
| `<leader>sss` | n | `builtin.lsp_document_symbols({ symbols = { "method", "function", "string" } })` | Search Symbols Select functions and methods |
| `<leader>ssv` | n | `builtin.lsp_document_symbols({ symbols = { "constant", "variable" } })` | Search Symbols Variable |
| `<leader>ssc` | n | `builtin.lsp_document_symbols({ symbols = { "class" } })` | Search Symbols Class |
| `<leader>ssp` | n | `builtin.lsp_document_symbols({ symbols = { "property" } })` | Search Symbols Property |

### Word and Selection Search

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>sw` | n | `builtin.grep_string()` | Search current Word |
| `<leader>sv` | v | `builtin.current_buffer_fuzzy_find({ default_text = text })` | Search current Selection in Buffer |

### Diagnostics and Resume

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>sd` | n | `builtin.diagnostics()` | Search Diagnostics |
| `<leader>sr` | n | `builtin.resume()` | Search Resume |
