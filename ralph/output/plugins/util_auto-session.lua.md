# Plugin: auto-session.lua

**Source:** `lua/plugins/util/auto-session.lua`
**Plugin:** rmagatti/auto-session

## Keybindings

### Lazy Keys (Top-level)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>wl` | `<cmd>AutoSession search<CR>` | [S]ession lens |
| n | `<leader>ws` | `<cmd>AutoSession save<CR>` | Save session |
| n | `<leader>wa` | `<cmd>SessionToggleAutoSave<CR>` | Toggle autosave |

### Session Lens Mappings (Inside Telescope Picker)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| i | `<C-D>` | delete_session | Delete the selected session |
| i | `<C-S>` | alternate_session | Switch to alternate session |
| i | `<C-Y>` | copy_session | Copy session |

## Notes

- Session lens mappings are only active inside the auto-session Telescope picker
- Sessions are stored in `~/.local/share/nvim/sessions/`
- Auto-create is conditional on being inside a git work tree
