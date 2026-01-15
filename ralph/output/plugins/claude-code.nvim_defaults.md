# claude-code.nvim Default Keybindings

Plugin: [greggh/claude-code.nvim](https://github.com/greggh/claude-code.nvim)

> **Note:** This plugin is currently **disabled** in the user's config (`enabled = false`).

## Overview
Claude-code.nvim provides seamless integration between Claude Code AI assistant and Neovim, allowing you to interact with Claude directly from your editor via a terminal window.

## Default Keybindings

### Primary Toggle Keymaps

| Key | Mode | Action | Default |
|-----|------|--------|---------|
| `<C-,>` | Normal & Terminal | Toggle Claude Code terminal window | Enabled |
| `<leader>ac` | Normal | Toggle Claude Code terminal window | Enabled |

### Variant Mode Keymaps

| Key | Mode | Action | Default |
|-----|------|--------|---------|
| `<leader>cC` | Normal | Launch Claude Code with `--continue` flag | Enabled |
| `<leader>cV` | Normal | Launch Claude Code with `--verbose` flag | Enabled |

### Window Navigation Keymaps

These keymaps are active when the Claude Code terminal is focused.

| Key | Mode | Action | Configurable |
|-----|------|--------|--------------|
| `<C-h>` | Terminal | Move to left window | `keymaps.window_navigation` |
| `<C-j>` | Terminal | Move to window below | `keymaps.window_navigation` |
| `<C-k>` | Terminal | Move to window above | `keymaps.window_navigation` |
| `<C-l>` | Terminal | Move to right window | `keymaps.window_navigation` |

### Scrolling Keymaps

| Key | Mode | Action | Configurable |
|-----|------|--------|--------------|
| `<C-f>` | Terminal | Scroll full-page down | `keymaps.scrolling` |
| `<C-b>` | Terminal | Scroll full-page up | `keymaps.scrolling` |

## User's Custom Configuration

The user has customized the following keymaps:

| Key | Mode | Action | Status |
|-----|------|--------|--------|
| `<C-.>` | Normal | Toggle Claude Code | Custom (overrides `<C-,>`) |
| `<C-.>` | Terminal | Toggle Claude Code | Custom (overrides `<C-,>`) |
| `<leader>cC` | Normal | Continue flag | Disabled |
| `<leader>cV` | Normal | Verbose flag | Disabled |

**Additional user keybindings (from keymappings.lua):**

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cc` | Normal | Launch Claude in Docker |
| `<leader>cC` | Normal | Launch Claude in Docker (resume) |

## Overridden Defaults

- `<C-,>` changed to `<C-.>` for toggle
- `--continue` and `--verbose` variants are disabled

## Potential Conflicts

- `<C-h>` in insert mode is also mapped to delete word backward in keymappings.lua
- `<C-f>` and `<C-b>` may conflict with other page scroll mappings
- `<leader>cC` is used for Docker Claude resume (custom), conflicts with default continue variant (but variant is disabled)
