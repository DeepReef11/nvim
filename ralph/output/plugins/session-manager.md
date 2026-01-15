# Session Manager Plugin Keybindings

**Plugin:** Shatur/neovim-session-manager
**Source File:** lua/plugins/session-manager.lua
**Status:** DISABLED (enabled=false)

## Custom Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>psl` | n | `<cmd>SessionManager load_session<CR>` | Load session |
| `<leader>psL` | n | `<cmd>SessionManager load_last_session<CR>` | Load last session |
| `<leader>pss` | n | `<cmd>SessionManager save_current_session<CR>` | Save session |
| `<leader>psm` | n | `<cmd>SessionManager available_commands<CR>` | Available commands |

## Notes

- Plugin is currently **disabled** in the configuration
- Session files are saved to `stdpath('data')/sessions`
- Autoload mode is disabled (won't auto-load sessions on start)
- Autosaves last session on exit when a session is active
- Ignores `gitcommit` and `gitrebase` filetypes when saving
