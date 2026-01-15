# text-case.nvim Default Keybindings

> Plugin: [johmsalas/text-case.nvim](https://github.com/johmsalas/text-case.nvim)
>
> An all-in-one plugin for converting text case in Neovim

## Overview

The plugin uses a prefix-based keybinding system. The default prefix is `ga`. All keybindings follow the pattern:

- **Quick Replace (current word):** `ga{suffix}`
- **Operator Mode (motion/text object):** `gao{suffix}`
- **LSP Rename (across all references):** `ga{SUFFIX}` (uppercase)

## Default Keybindings Table

### Quick Replace (Current Word)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gau` | n | `to_upper_case` | Convert current word to UPPER CASE |
| `gal` | n | `to_lower_case` | Convert current word to lower case |
| `gas` | n | `to_snake_case` | Convert current word to snake_case |
| `gad` | n | `to_dash_case` | Convert current word to dash-case (kebab-case) |
| `gan` | n | `to_constant_case` | Convert current word to CONSTANT_CASE |
| `gac` | n | `to_camel_case` | Convert current word to camelCase |
| `gap` | n | `to_pascal_case` | Convert current word to PascalCase |

### Operator Mode (With Motion/Text Object)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gaou` | n | `to_upper_case` | Convert text object/motion to UPPER CASE |
| `gaol` | n | `to_lower_case` | Convert text object/motion to lower case |
| `gaos` | n | `to_snake_case` | Convert text object/motion to snake_case |
| `gaod` | n | `to_dash_case` | Convert text object/motion to dash-case |
| `gaon` | n | `to_constant_case` | Convert text object/motion to CONSTANT_CASE |
| `gaoc` | n | `to_camel_case` | Convert text object/motion to camelCase |
| `gaop` | n | `to_pascal_case` | Convert text object/motion to PascalCase |

### LSP Rename (Across All References)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gaU` | n | `to_upper_case` | LSP rename to UPPER CASE |
| `gaL` | n | `to_lower_case` | LSP rename to lower case |
| `gaS` | n | `to_snake_case` | LSP rename to snake_case |
| `gaD` | n | `to_dash_case` | LSP rename to dash-case |
| `gaN` | n | `to_constant_case` | LSP rename to CONSTANT_CASE |
| `gaC` | n | `to_camel_case` | LSP rename to camelCase |
| `gaP` | n | `to_pascal_case` | LSP rename to PascalCase |

### Visual Mode

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gau` | x | `to_upper_case` | Convert selection to UPPER CASE |
| `gal` | x | `to_lower_case` | Convert selection to lower case |
| `gas` | x | `to_snake_case` | Convert selection to snake_case |
| `gad` | x | `to_dash_case` | Convert selection to dash-case |
| `gan` | x | `to_constant_case` | Convert selection to CONSTANT_CASE |
| `gac` | x | `to_camel_case` | Convert selection to camelCase |
| `gap` | x | `to_pascal_case` | Convert selection to PascalCase |

## Summary by Suffix Key

| Suffix | Lowercase | Uppercase | Case Conversion |
|--------|-----------|-----------|-----------------|
| `u/U` | Quick/Operator | LSP | UPPER CASE |
| `l/L` | Quick/Operator | LSP | lower case |
| `s/S` | Quick/Operator | LSP | snake_case |
| `d/D` | Quick/Operator | LSP | dash-case |
| `n/N` | Quick/Operator | LSP | CONSTANT_CASE |
| `c/C` | Quick/Operator | LSP | camelCase |
| `p/P` | Quick/Operator | LSP | PascalCase |

## Additional Methods (No Default Keybindings)

The following case conversions are available but require custom keybinding configuration:

- `to_title_case` - Title Case
- `to_dot_case` - dot.case
- `to_comma_case` - comma,case
- `to_path_case` - path/case
- `to_phrase_case` - phrase case
- `to_title_dash_case` - Title-Dash-Case
- `to_upper_phrase_case` - UPPER PHRASE CASE
- `to_lower_phrase_case` - lower phrase case

## Configuration Notes

- Default keybindings can be disabled with `default_keymappings_enabled = false`
- The prefix can be customized via the `prefix` option in setup
- All conversions support the `.` (dot) repeat command
- LSP rename requires an active LSP with rename capability

## Telescope Integration

When using with Telescope, additional keybindings are available:

| Key | Action | Description |
|-----|--------|-------------|
| `ga.` | TextCaseOpenTelescope | Open Telescope picker for case conversion |
| `gaa` | TextCaseOpenTelescopeQuickChange | Quick change via Telescope |
| `gai` | TextCaseOpenTelescopeLSPChange | LSP change via Telescope |
