# Plugin: nvim-notify

**Plugin:** `rcarriga/nvim-notify`
**Source File:** `lua/plugins/notify.lua`

## Custom Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>nd` | n | `notify.dismiss` | Notify Dismiss |

## Notes

- This plugin provides a notification framework for Neovim
- The configuration filters out some common noisy messages (e.g., "No information available", tsserver inlay hints errors)
- Notifications have a 10 second timeout by default
