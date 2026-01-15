# Plugin: codesnap.nvim

**Source file:** `lua/plugins/codesnap.lua`

## Description
CodeSnap is a plugin for taking beautiful screenshots of code snippets directly from Neovim.

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>cYy` | x (visual) | `<Esc><cmd>CodeSnap<cr>` | Save selected code snapshot into clipboard |
| `<leader>cYY` | x (visual) | `<Esc><cmd>CodeSnapSave<cr>` | Save selected code snapshot in ~/Pictures |

## Commands
- `:CodeSnap` - Copy code snapshot to clipboard
- `:CodeSnapSave` - Save code snapshot to Pictures directory
- `:CodeSnapPreviewOn` - Preview snapshot

## Configuration Notes
- Background color: `#535c68`
- Font: CaskaydiaCove Nerd Font
- Line numbers enabled
- Breadcrumbs enabled
- No watermark
- Save path: `$XDG_PICTURES_DIR` or `~/Pictures`
