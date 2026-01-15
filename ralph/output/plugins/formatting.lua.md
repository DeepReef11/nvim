# Plugin: conform.nvim (formatting.lua)

## Source
`lua/plugins/formatting.lua`

## Plugin
- **Name:** stevearc/conform.nvim
- **Event:** BufReadPre, BufNewFile

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>bf` | n | conform.format() | Buffer Format |
| `<leader>f` | v | conform.format() | Format selection |

## User Commands

| Command | Description |
|---------|-------------|
| `:Format` | Format buffer or range (supports visual selection) |

## Notes
- Uses `prettierd` with `prettier` fallback for web files (CSS, HTML, JS, TS, JSON, etc.)
- Uses `stylua` for Lua files
- Uses `black` for Python files
- Format timeout: 2000ms for buffer, 500ms for selection
- LSP fallback enabled if formatter not available
