# Plugin File: lua/plugins/languages/markdown.lua

## Overview
This file configures markdown-related plugins for the Neovim configuration.

## Plugins Configured
1. **vim-table-mode** - Table editing mode for markdown files
2. **render-markdown.nvim** - Renders markdown with enhanced visuals
3. **markdown-preview.nvim** - Live markdown preview in browser

## Custom Keybindings Defined
**None** - No explicit keybindings are defined in this file.

## Commands Available
- `:MarkdownPreviewToggle` - Toggle markdown preview
- `:MarkdownPreview` - Start markdown preview
- `:MarkdownPreviewStop` - Stop markdown preview

## Notes
- All plugins are lazy-loaded for markdown filetype only
- `render-markdown.nvim` also activates for Avante, copilot-chat, and codecompanion filetypes
- `vim-table-mode` has its own default keybindings (see plugin_defaults task)
