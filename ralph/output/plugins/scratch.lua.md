# Plugin: scratch.nvim

**File:** `lua/plugins/ui/scratch.lua`

## Keybindings

### Global Keys (lazy.nvim format)

| Mode | Key | Command | Description |
|------|-----|---------|-------------|
| n | `<leader>wo` | `<CMD>ScratchOpen<CR>` | Open scratch |
| n | `<leader>wn` | `<CMD>Scratch<CR>` | New scratch |
| n | `<leader>wN` | `<CMD>ScratchWithName<CR>` | New scratch with name |

### Local Keys (buffer-specific)

| Condition | Mode | Key | Command |
|-----------|------|-----|---------|
| Filename contains "sh" | n, i, v | `<C-r>` | `<CMD>RunShellCurrentLine<CR>` |

## Notes

- Plugin: `LintaoAmons/scratch.nvim`
- Uses telescope or fzf-lua for file picking
- Scratch files stored in `vim.fn.stdpath("cache") .. "/scratch.nvim"`
- Supports multiple filetypes: md, ts, js, lua, sh, json, yaml, go
