# Plugin Configuration: init.lua

**File:** `lua/plugins/init.lua`

## Overview

This is the main plugin entry point that imports other plugin directories and defines general plugins.

## Imported Plugin Directories

- `plugins.ai` - AI-related plugins
- `plugins.languages` - Language-specific plugins
- `plugins.ui` - UI-related plugins
- `plugins.editor` - Editor enhancement plugins
- `plugins.util` - Utility plugins
- `plugins.code` - Code-related plugins

## General Plugins Defined

| Plugin | Status | Description |
|--------|--------|-------------|
| `AndrewRadev/switch.vim` | Enabled | Boolean/value switching |
| `airblade/vim-rooter` | Enabled | Auto-cd to project root |
| `kylechui/nvim-surround` | **Disabled** | Surround text manipulation |

## Keybindings

**No custom keybindings defined in this file.**

The plugins listed here may have their own default keybindings:
- `switch.vim`: Uses `<C-a>` and `<C-x>` by default for switching values
- `nvim-surround`: Would provide surround operations but is **disabled**
