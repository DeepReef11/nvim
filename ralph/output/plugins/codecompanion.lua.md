# CodeCompanion Plugin Keybindings

**Source:** `lua/plugins/ai/codecompanion.lua`
**Plugin:** olimorris/codecompanion.nvim
**Status:** DISABLED

## Global Keybindings (lazy.nvim keys)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>ccl` | `<cmd>CodeCompanion<CR>` | Inline |
| n | `<leader>ccc` | `<cmd>CodeCompanionChat<CR>` | Chat |

## Chat Mode Keybindings

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| i | `<C-x>` | keymaps.completion | Completion Menu |

## Slash Commands (Chat Buffer)

Available slash commands within the chat buffer:
- `/buffer` - Insert open buffers (uses telescope)
- `/fetch` - Insert URL contents (uses jina adapter)
- `/file` - Insert a file (uses telescope)
- `/files` - Insert multiple files (uses telescope)
- `/help` - Insert content from help tags (uses telescope)
- `/now` - Insert the current date and time
- `/symbols` - Insert symbols for a selected file (uses telescope)
- `/terminal` - Insert terminal output

## Notes

- Plugin is currently **disabled** (`enabled = false`)
- Uses LM Studio as the backend adapter (localhost:1234)
- Integrates with telescope for file selection
