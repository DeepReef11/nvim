# codecompanion.nvim Default Keybindings

## Overview
CodeCompanion.nvim is an AI coding assistant plugin that provides chat and inline code assistance.

**Note:** This plugin is currently **disabled** in the user's configuration.

## Chat Buffer Keymaps (Normal Mode)

| Key | Action | Description |
|-----|--------|-------------|
| `<CR>` | Send | Send message to LLM |
| `<C-s>` | Send | Send message to LLM (alternative) |
| `<C-c>` | Close | Close chat buffer |
| `q` | Stop | Stop current request |
| `ga` | Change adapter | Change adapter for current chat |
| `gba` | Sync buffer (all) | Sync entire buffer on every turn |
| `gbd` | Sync buffer (diff) | Sync only buffer diff on every turn |
| `gc` | Insert codeblock | Insert codeblock in chat buffer |
| `gd` | Debug | View/debug chat buffer contents |
| `gD` | Super diff | Access super diff feature |
| `gf` | Fold | Fold codeblocks in chat buffer |
| `gM` | Clear rules | Clear all rules from chat buffer |
| `gr` | Regenerate | Regenerate last response |
| `gR` | Jump to file | Jump to file under cursor |
| `gs` | Toggle system prompt | Toggle system prompt on/off |
| `gS` | Stats | Show Copilot usage stats |
| `gta` | Auto tool mode | Toggle auto tool mode |
| `gtx` | Reset approvals | Reset approvals for chat buffer |
| `gty` | YOLO mode | Enable YOLO mode (auto-approve tools) |
| `gx` | Clear | Clear chat buffer contents |
| `gy` | Yank codeblock | Yank last codeblock in chat buffer |
| `[[` | Previous header | Move to previous header |
| `]]` | Next header | Move to next header |
| `{` | Previous chat | Move to previous chat |
| `}` | Next chat | Move to next chat |

## Inline Assistant Keymaps

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gda` | n | Accept | Accept suggested inline change |
| `gdr` | n | Reject | Reject suggested inline change |
| `gdy` | n | Accept all | Accept all changes (YOLO mode) |

## Commands

| Command | Description |
|---------|-------------|
| `:CodeCompanion` | Open inline assistant |
| `:CodeCompanionChat` | Open chat buffer |
| `:CodeCompanionCmd` | Generate command in command-line |
| `:CodeCompanionActions` | Open action palette |
| `:CodeCompanionChat Toggle` | Toggle chat buffer visibility |

## User Configuration Overrides

The user's configuration (`lua/plugins/ai/codecompanion.lua`) defines:

### Custom Keybindings (via lazy.nvim keys)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ccl` | n | `:CodeCompanion<CR>` | Inline |
| `<leader>ccc` | n | `:CodeCompanionChat<CR>` | Chat |

### Custom Chat Keymaps

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-x>` | i | Completion | Completion Menu (custom override) |

## Potential Conflicts

- `gc` in chat buffer conflicts with Comment.nvim's `gc` for commenting
- `gs` conflicts with mini.surround (if enabled)
- `{` and `}` are standard Vim paragraph motions - overridden in chat buffer only
- `[[` and `]]` are standard Vim section motions - overridden in chat buffer only
- `q` normally records macros - overridden to stop request in chat buffer

## Sources

- [GitHub Repository](https://github.com/olimorris/codecompanion.nvim)
- [Documentation](https://raw.githubusercontent.com/olimorris/codecompanion.nvim/refs/heads/main/doc/codecompanion.txt)
