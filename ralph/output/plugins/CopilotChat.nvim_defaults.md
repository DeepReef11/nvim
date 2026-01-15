# CopilotChat.nvim Default Keybindings

Plugin: [CopilotC-Nvim/CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)

## Overview

CopilotChat.nvim is a Neovim plugin that integrates GitHub Copilot Chat functionality directly into Neovim. It allows users to have conversations with Copilot about their code.

## Default Keybindings (Plugin Defaults)

CopilotChat.nvim does NOT define any default keybindings out of the box. Users are expected to configure their own mappings.

### Built-in Chat Window Mappings

When inside the CopilotChat window, the following default mappings are available:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<CR>` | n | Submit | Submit the current prompt |
| `<C-s>` | n, i | Submit | Submit the current prompt |
| `q` | n | Close | Close the chat window |
| `<C-c>` | n, i | Stop | Stop current generation |
| `<Tab>` | n, i | Next | Select next completion |
| `<S-Tab>` | n, i | Previous | Select previous completion |
| `gy` | n | Yank diff | Copy the diff to clipboard |
| `gd` | n | Show diff | Show diff in vertical split |
| `gs` | n | Show system prompt | Display the system prompt |
| `gu` | n | Show user selection | Display user's code selection |
| `?` | n | Help | Show available mappings |

### Available Commands

The plugin provides these commands that can be mapped:

| Command | Description |
|---------|-------------|
| `:CopilotChat` | Open chat window |
| `:CopilotChatOpen` | Open chat window |
| `:CopilotChatClose` | Close chat window |
| `:CopilotChatToggle` | Toggle chat window |
| `:CopilotChatReset` | Reset chat history |
| `:CopilotChatStop` | Stop current generation |
| `:CopilotChatDebugInfo` | Show debug information |
| `:CopilotChatExplain` | Explain selected code |
| `:CopilotChatReview` | Review selected code |
| `:CopilotChatFix` | Fix selected code |
| `:CopilotChatOptimize` | Optimize selected code |
| `:CopilotChatDocs` | Generate documentation |
| `:CopilotChatTests` | Generate tests |
| `:CopilotChatFixDiagnostic` | Fix diagnostic under cursor |
| `:CopilotChatCommit` | Generate commit message |
| `:CopilotChatCommitStaged` | Generate commit for staged |

## User's Custom Configuration

The user's config (`lua/plugins/ai/copilot-chat.lua`) defines:

| Key | Mode | Action | Description | Status |
|-----|------|--------|-------------|--------|
| `<leader>cce` | n | `:CopilotChatExplain<cr>` | Explain code | Custom |
| `<leader>cct` | n | `:CopilotChatTests<cr>` | Generate tests | Custom |
| `<leader>ccc` | n, x | `:CopilotChatToggle<CR>` | Toggle chat | Custom |
| `<leader>ccf` | n | `:CopilotChatFixDiagnostic<cr>` | Fix diagnostic | Custom |

**Note:** This plugin is currently **disabled** in the user's config (`enabled = false`).

## Potential Conflicts

- `<leader>cc` prefix is also used by Claude Code plugin
- The chat window mappings (`q`, `<CR>`, etc.) only apply within the CopilotChat buffer

## Recommended Default Mappings (from plugin documentation)

```lua
keys = {
  { "<leader>ac", ":CopilotChatToggle<CR>", mode = { "n", "v" }, desc = "Toggle Copilot Chat" },
  { "<leader>ae", ":CopilotChatExplain<CR>", mode = { "n", "v" }, desc = "Explain code" },
  { "<leader>ar", ":CopilotChatReview<CR>", mode = { "n", "v" }, desc = "Review code" },
  { "<leader>af", ":CopilotChatFix<CR>", mode = { "n", "v" }, desc = "Fix code" },
  { "<leader>ao", ":CopilotChatOptimize<CR>", mode = { "n", "v" }, desc = "Optimize code" },
  { "<leader>ad", ":CopilotChatDocs<CR>", mode = { "n", "v" }, desc = "Document code" },
  { "<leader>at", ":CopilotChatTests<CR>", mode = { "n", "v" }, desc = "Generate tests" },
  { "<leader>am", ":CopilotChatCommit<CR>", desc = "Generate commit message" },
}
```
