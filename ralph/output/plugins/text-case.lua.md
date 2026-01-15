# text-case.lua - Keybindings

**Plugin:** `johmsalas/text-case.nvim`

## Lazy-Loaded Keys
| Key | Description |
|-----|-------------|
| `gu` | Text-case prefix - triggers lazy loading |

## Default Keymappings (prefix: `gu`)

The plugin uses `default_keymappings_enabled = true` with prefix `gu`. Based on enabled methods:

### Current Word (Quick)
| Key | Action | Description |
|-----|--------|-------------|
| `guu` | `to_upper_case` | Convert current word to UPPER CASE |
| `gul` | `to_lower_case` | Convert current word to lower case |
| `guc` | `to_camel_case` | Convert current word to camelCase |
| `gus` | `to_snake_case` | Convert current word to snake_case |
| `gut` | `to_title_dash_case` | Convert current word to Title-Dash-Case |
| `gun` | `to_constant_case` | Convert current word to CONSTANT_CASE |
| `gud` | `to_dot_case` | Convert current word to dot.case |
| `gup` | `to_phrase_case` | Convert current word to Phrase case |
| `gua` | `to_pascal_case` | Convert current word to PascalCase |
| `gui` | `to_title_case` | Convert current word to Title Case |
| `guf` | `to_path_case` | Convert current word to path/case |
| `guU` | `to_upper_phrase_case` | Convert current word to UPPER PHRASE CASE |
| `guL` | `to_lower_phrase_case` | Convert current word to lower phrase case |

### Operator Mode (with `o` suffix)
| Key | Action | Description |
|-----|--------|-------------|
| `guou` | operator `to_upper_case` | Apply UPPER CASE to motion/text object |
| `guol` | operator `to_lower_case` | Apply lower case to motion/text object |
| `guoc` | operator `to_camel_case` | Apply camelCase to motion/text object |
| `guos` | operator `to_snake_case` | Apply snake_case to motion/text object |
| `guot` | operator `to_title_dash_case` | Apply Title-Dash-Case to motion/text object |
| `guon` | operator `to_constant_case` | Apply CONSTANT_CASE to motion/text object |
| `guod` | operator `to_dot_case` | Apply dot.case to motion/text object |
| `guop` | operator `to_phrase_case` | Apply Phrase case to motion/text object |
| `guoa` | operator `to_pascal_case` | Apply PascalCase to motion/text object |
| `guoi` | operator `to_title_case` | Apply Title Case to motion/text object |
| `guof` | operator `to_path_case` | Apply path/case to motion/text object |
| `guoU` | operator `to_upper_phrase_case` | Apply UPPER PHRASE CASE to motion/text object |
| `guoL` | operator `to_lower_phrase_case` | Apply lower phrase case to motion/text object |

### LSP Rename (with `r` suffix) - if available
| Key | Action | Description |
|-----|--------|-------------|
| `guru` | LSP rename `to_upper_case` | LSP rename to UPPER CASE |
| `gurl` | LSP rename `to_lower_case` | LSP rename to lower case |
| `gurc` | LSP rename `to_camel_case` | LSP rename to camelCase |
| `gurs` | LSP rename `to_snake_case` | LSP rename to snake_case |
| `gura` | LSP rename `to_pascal_case` | LSP rename to PascalCase |
| ... | ... | (and other enabled methods) |

## Telescope Integration

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>rc` | n, v | `:TextCaseOpenTelescope<CR>` | Open text-case Telescope picker (defined in telescope/keymaps/misc.lua) |

## Available Commands
- `:TextCaseOpenTelescope` - Open Telescope picker for text case operations
- `:Subs` - Substitute command for text case operations

## Disabled Methods
- `to_dash_case` - Commented out in config

## Source
- File: `lua/plugins/text-case.lua`
