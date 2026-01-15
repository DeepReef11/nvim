# Core Keymappings

Source: `lua/config/keymappings.lua`

## Custom Functions & Commands

| Command/Key | Mode | Action | Description |
|-------------|------|--------|-------------|
| `:Claude [args]` | cmd | `launch_claude_docker(args)` | Launch Claude in Docker container |
| `:Y` | cmd | `%y+\|wq` | Yank buffer, save and exit |
| `:CodeSnapText` | cmd | Format and yank visual selection | Format selection for sharing as text |

## Leader Key Bindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>cc` | n | `launch_claude_docker('')` | Launch Claude in Docker |
| `<leader>cC` | n | `launch_claude_docker('-r')` | Launch Claude in Docker (resume) |
| `<leader>ps` | n | `pythonscad <current file>` | Launch PythonSCAD with current buffer |
| `<leader>T` | n | `launch_terminal()` | Execute terminal program in background |
| `<leader>cy` | x | `<Esc><cmd>CodeSnapText<CR>` | Yank and format text for sharing |
| `<leader>cy` | n | `ggVG<Esc><cmd>CodeSnapText<CR><C-o>` | Yank and format text for sharing |
| `<leader>bk` | n | `<cmd>bd<CR>` | Buffer Delete |
| `<leader>bd` | n | `<cmd>bd!<CR>` | Buffer Delete force! |
| `<leader>q` | n | `require('utils').toggle_quicklist()` | Toggle quicklist |
| `<leader>ca` | n | `vim.lsp.buf.code_action()` | LSP Code Action |
| `<leader>ca` | v | `'<,'>vim.lsp.buf.code_action()` | LSP Code Action (visual) |
| `<leader>cr` | n | `vim.lsp.buf.rename()` | LSP Rename |
| `<leader>cf` | n | `require('config.lsp.functions').format()` | LSP Format |
| `<leader>cf` | v | Format range with LSP | LSP Format (visual range) |
| `<leader>cl` | n | `vim.diagnostic.open_float()` | Open diagnostic float |

## Insert Mode Bindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-BS>` | i | `<C-w>` | Delete word backward |
| `<C-h>` | i | `<C-w>` | Delete word backward (terminal fallback) |
| `<C-Del>` | i | `<C-o>dw` | Delete word forward |
| `jj` | i | `<Esc>` | Exit insert mode |
| `<C-Space>` | i | `vim.lsp.buf.completion` | LSP show suggestion, trigger completion |

## Normal Mode Bindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `i` | n | Smart indent on empty line | Properly indent on empty line when insert |
| `gV` | n | `v`]o`[` | Select last pasted (Visual mode) |
| `<C-I>` | n | `<C-I>` | Fix moving forward in jumplist |
| `H` | n | `^` | Move to first non-blank character |
| `<CR>` | n | `:noh<CR><CR>` | Remove highlights |
| `<Esc>` | n | `<cmd>nohlsearch<CR>` | Remove highlights on escape |
| `x` | n | `"_x` | Delete char without yank |
| `X` | n | `"_X` | Delete char backward without yank |
| `<Del>` | n | `"_x` | Delete char without yank |
| `<C-a>` | n | Switch/SpeedDating increment | Manually invoke speeddating/switch |
| `<C-x>` | n | Switch/SpeedDating decrement | Manually invoke speeddating/switch (reverse) |
| `gx` | n | Open link in browser | Open links under cursor in browser |

## Visual Mode Bindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<S-Up>` | v | `<Up>` | Visual mode prevent page up |
| `<S-Down>` | v | `<Down>` | Visual mode prevent page down |
| `<S-Left>` | v | `<Left>` | Visual mode move left |
| `<S-Right>` | v | `<Right>` | Visual mode move right |
| `<` | v | `<gv` | Keep visual mode after indent left |
| `>` | v | `>gv` | Keep visual mode after indent right |
| `` ` `` | v | `u` | Lowercase in visual mode |
| `<A-`>` | v | `U` | Uppercase in visual mode |
| `x` | v | `"_x` | Delete without yank |
| `X` | v | `"_X` | Delete backward without yank |
| `p` | v | `"_dP` | Paste without yank |

## LSP Bindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gr` | n | `vim.lsp.buf.references()` | Go to references (excluding declaration) |
| `gy` | n | `vim.lsp.buf.type_definition()` | Go to type definition |
| `<C-Space>` | n | `vim.lsp.buf.code_action()` | LSP Code Action |
| `gl` | n | `vim.diagnostic.open_float()` | Open diagnostic float |
| `]g` | n | `vim.diagnostic.goto_next()` | Go to next diagnostic |
| `[g` | n | `vim.diagnostic.goto_prev()` | Go to previous diagnostic |
| `<C-s>` | n | `vim.lsp.buf.signature_help()` | LSP show signature (Press twice to focus) |
| `<C-k>` | n | UFO peek / LSP hover | Peek folded lines or LSP hover |

## Deleted Default Mappings

The following default Neovim mappings are explicitly deleted:

- `[a`, `[A`, `]a`, `]A` - Argument list navigation
- `[b`, `[B`, `]b`, `]B` - Buffer navigation
- `[q`, `[Q`, `]q`, `]Q` - Quickfix navigation
- `[l`, `[L`, `]l`, `]L` - Location list navigation
- `[t`, `[T`, `]t`, `]T` - Tag navigation
- `[<C-L>`, `]<C-L>` - Location list file navigation
- `[<C-Q>`, `]<C-Q>` - Quickfix file navigation
- `[<C-T>`, `]<C-T>` - Tag stack navigation

---

## init.lua Analysis

The `init.lua` file contains only module requires and no direct keymappings:

```lua
require('config.EcoVim')
require('utils.globals')
require('config.options')
require('config.lazy')
require('config.keymappings')
require('config.autocmds')
require('config.lsp.config')
require('config.lsp.setup')
require('config.lsp.functions')
require('internal.cursorword')
require('user.create-page')
```

## init.vim Analysis

The `init.vim` is a broken symlink (points to `../../dotfiles/.config/nvim/init.vim` which doesn't exist).

**No legacy `map`, `nmap`, `vmap`, `imap` commands found in init files.**
