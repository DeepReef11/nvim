# tabout.lua Keybindings

**Plugin:** `abecodes/tabout.nvim`
**Status:** Enabled
**Event:** InsertCharPre

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Tab>` | i | tabout | Jump out of brackets/quotes to the right |
| `<S-Tab>` | i | backwards tabout | Jump out of brackets/quotes to the left |
| `<C-t>` | i | default_tab | Shift content when tabout not possible (beginning of line) |
| `<C-d>` | i | default_shift_tab | Reverse shift when backwards tabout not possible |

## Supported Tabout Pairs

The plugin will tab out of these characters:
- Single quotes: `'...'`
- Double quotes: `"..."`
- Backticks: `` `...` ``
- Parentheses: `(...)`
- Square brackets: `[...]`
- Curly braces: `{...}`

## Configuration Notes

- `act_as_tab = true`: Falls back to normal Tab behavior when tabout isn't possible
- `act_as_shift_tab = false`: Does not fall back to Shift-Tab behavior
- `ignore_beginning = true`: Prefers tabout over shifting when cursor is at beginning of filled element
- `completion = false`: Tab key not used with completion popup menu
