# tabout.nvim Default Keybindings

Plugin: [abecodes/tabout.nvim](https://github.com/abecodes/tabout.nvim)

A Neovim plugin to "tab out" from brackets, quotes, and other paired characters using treesitter.

---

## Primary Keybindings

These are the default keys configured out of the box.

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<Tab>` | Tabout forward | Insert | Move cursor past the closing bracket/quote |
| `<S-Tab>` | Tabout backward | Insert | Move cursor before the opening bracket/quote |

---

## Fallback Actions

When tabbing out is not possible (no surrounding brackets/quotes), these fallback behaviors apply.

| Key | Action | Mode | Condition |
|-----|--------|------|-----------|
| `<C-t>` | Indent line | Insert | At beginning of line when `act_as_tab = true` |
| `<C-d>` | Dedent line | Insert | When `act_as_shift_tab = true` |

---

## Plug API Mappings

These `<Plug>` mappings are available for custom keybinding configurations.

| Mapping | Mode | Description |
|---------|------|-------------|
| `<Plug>(Tabout)` | Insert | Tab out forward (single line) |
| `<Plug>(TaboutBack)` | Insert | Tab out backward (single line) |
| `<Plug>(TaboutMulti)` | Insert | Tab out forward (multi-line support) |
| `<Plug>(TaboutBackMulti)` | Insert | Tab out backward (multi-line support) |

### Example Custom Mapping

```lua
vim.api.nvim_set_keymap('i', '<A-x>', '<Plug>(TaboutMulti)', { silent = true })
```

---

## Commands

| Command | Description |
|---------|-------------|
| `:TaboutToggle` | Enable or disable the plugin |
| `:Tabout` | Trigger tabout (deprecated) |
| `:TaboutBack` | Trigger backward tabout (deprecated) |

---

## Supported Characters (Default)

The plugin can tab out of these paired characters by default:

| Open | Close |
|------|-------|
| `'` | `'` |
| `"` | `"` |
| `` ` `` | `` ` `` |
| `(` | `)` |
| `[` | `]` |
| `{` | `}` |

---

## Configuration Reference

Key-related configuration options:

| Option | Default | Description |
|--------|---------|-------------|
| `tabkey` | `'<Tab>'` | Key to trigger forward tabout (empty string to disable) |
| `backwards_tabkey` | `'<S-Tab>'` | Key to trigger backward tabout (empty string to disable) |
| `default_tab` | `'<C-t>'` | Fallback action at line beginning |
| `default_shift_tab` | `'<C-d>'` | Fallback action for reverse |
| `act_as_tab` | `true` | Shift content if tabout not possible |
| `act_as_shift_tab` | `false` | Reverse shift if tabout not possible |
| `enable_backwards` | `true` | Enable backward tabout functionality |

---

## Notes

- All keybindings work exclusively in **Insert mode**
- Requires `nvim-treesitter` for syntax awareness
- Compatible with completion plugins (nvim-cmp) via `completion` option
- Can be disabled per-filetype using the `exclude` option
