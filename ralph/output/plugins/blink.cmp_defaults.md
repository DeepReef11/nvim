# blink.cmp Default Keybindings

blink.cmp is a completion plugin for Neovim that offers different keymap presets and customizable completion behavior.

## Keymap Presets

blink.cmp offers several keymap presets. The current configuration uses **`super-tab`** preset.

### super-tab Preset (Active)
| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | `select_next` / `snippet_forward` | Select next item or jump forward in snippet |
| `<S-Tab>` | `select_prev` / `snippet_backward` | Select previous item or jump backward in snippet |
| `<CR>` | `accept` | Accept completion |
| `<C-e>` | `hide` | Hide completion menu |
| `<C-y>` | `accept` | Accept completion (alternative) |

### default Preset
| Key | Action | Description |
|-----|--------|-------------|
| `<C-space>` | `show` | Show completion menu |
| `<C-e>` | `hide` | Hide completion menu |
| `<C-y>` | `select_and_accept` | Select and accept completion |
| `<C-p>` | `select_prev` | Select previous item |
| `<C-n>` | `select_next` | Select next item |
| `<C-b>` | `scroll_documentation_up` | Scroll documentation up |
| `<C-f>` | `scroll_documentation_down` | Scroll documentation down |
| `<Tab>` | `snippet_forward` | Jump forward in snippet |
| `<S-Tab>` | `snippet_backward` | Jump backward in snippet |

### enter Preset
| Key | Action | Description |
|-----|--------|-------------|
| `<CR>` | `accept` | Accept completion |
| `<Tab>` | `select_next` / `snippet_forward` | Select next or jump forward |
| `<S-Tab>` | `select_prev` / `snippet_backward` | Select previous or jump backward |
| `<C-e>` | `hide` | Hide completion menu |

## Custom Keybindings in Config

The following custom keybindings are defined on top of the `super-tab` preset:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-space>` | Insert | `show`, `show_documentation`, `hide_documentation` | Toggle completion/documentation |
| `<S-k>` | Insert | `scroll_documentation_up` | Scroll documentation up |
| `<S-j>` | Insert | `scroll_documentation_down` | Scroll documentation down |
| `<PageUp>` | Insert | `scroll_documentation_up` | Scroll documentation up |
| `<PageDown>` | Insert | `scroll_documentation_down` | Scroll documentation down |
| `<A-CR>` | Insert | `accept` | Accept completion (Alt+Enter) |

## Snippet Navigation (via LuaSnip integration)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | i, s | Jump forward in snippet |
| `<S-Tab>` | i, s | Jump backward in snippet |

## Overrides from Custom Config

The custom configuration:
- Uses **super-tab** preset as base
- Adds `<S-j>` / `<S-k>` for documentation scrolling (may conflict with normal mode uses)
- Adds `<A-CR>` as alternative accept key
- Adds `<PageUp>` / `<PageDown>` for documentation scrolling

## Notes

- Ghost text is disabled (`ghost_text.enabled = false`)
- Auto-brackets are disabled (`auto_brackets.enabled = false`)
- Documentation auto-show is disabled (`auto_show = false`)
- Signature help is enabled
