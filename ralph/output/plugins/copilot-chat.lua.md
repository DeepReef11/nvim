# Plugin: copilot-chat.lua

**Source:** `lua/plugins/ai/copilot-chat.lua`
**Plugin:** CopilotC-Nvim/CopilotChat.nvim
**Status:** Disabled (`enabled = false`)
**Branch:** canary

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>cce` | n | `<cmd>CopilotChatExplain<cr>` | CopilotChat - Explain code |
| `<leader>cct` | n | `<cmd>CopilotChatTests<cr>` | CopilotChat - Generate tests |
| `<leader>ccc` | n, x | `:CopilotChatToggle<CR>` | CopilotChat |
| `<leader>ccf` | n | `<cmd>CopilotChatFixDiagnostic<cr>` | CopilotChat Fix Diagnostic |

## Custom Prompts Defined

The plugin defines several custom prompts:
- **Code related:** Explain, Review, Tests, Refactor, FixCode, FixError, BetterNamings, Documentation, SwaggerApiDocs, SwaggerJsDocs
- **Text related:** Summarize, Spelling, Wording, Concise

## Notes

- This plugin is **disabled** in the configuration
- Uses the `canary` branch
- Loads on `VeryLazy` event
