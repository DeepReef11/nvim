# Plugin: blink.lua

## Source File
`lua/plugins/blink.lua`

## Plugin Overview
This file configures **blink.cmp** - a completion engine for Neovim. It uses the `super-tab` preset as a base.

## Active Keybindings (blink.cmp)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-space>` | i | show/show_documentation/hide_documentation | Toggle completion and documentation |
| `<S-k>` | i | scroll_documentation_up | Scroll documentation up |
| `<S-j>` | i | scroll_documentation_down | Scroll documentation down |
| `<PageUp>` | i | scroll_documentation_up | Scroll documentation up |
| `<PageDown>` | i | scroll_documentation_down | Scroll documentation down |
| `<A-CR>` | i | accept | Accept completion with Alt+Enter |

### Super-Tab Preset Defaults
The `super-tab` preset provides these additional keybindings:
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Tab>` | i | select_next / accept / snippet_forward | Navigate completions or accept |
| `<S-Tab>` | i | select_prev / snippet_backward | Navigate completions backward |
| `<C-e>` | i | hide | Hide completion menu |
| `<CR>` | i | fallback | Pass through Enter (doesn't accept) |

## Commented-Out Keybindings (blink.nvim - disabled)

The original blink.nvim plugin (now commented out) had these keys defined:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-;>` | n, v | toggle_char_eol(';') | Toggle semicolon at end of line |
| `,` | n, v | toggle_char_eol(',') | Toggle comma at end of line |
| `<C-e>` | n | BlinkTree reveal | Reveal current file in tree |
| `<leader>E` | n | BlinkTree toggle | Toggle file tree |
| `<leader>e` | n | BlinkTree toggle-focus | Toggle file tree focus |

## Notes
- Uses LuaSnip for snippet expansion
- Completion sources: lsp, path, snippets, buffer
- Ghost text is disabled
- Auto-brackets disabled
- Documentation auto-show disabled
