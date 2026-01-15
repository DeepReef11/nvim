# Treesitter Plugin Keybindings

**Source:** `lua/plugins/treesitter.lua`

## Plugins Configured
- `nvim-treesitter/nvim-treesitter`
- `windwp/nvim-ts-autotag`

---

## Incremental Selection (DISABLED - `enable = false`)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gnn` | n | init_selection | Initialize incremental selection |
| `<leader>gnr` | n | node_incremental | Increment selection to larger node |
| `<leader>gne` | n | scope_incremental | Increment selection to scope |
| `<leader>gnt` | n | node_decremental | Decrement selection to smaller node |

> Note: These are disabled in config (`enable = false`)

---

## Textobjects - Movement

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `][` | n,o,x | goto_next_start @block.outer | Go to next block start |
| `]f` | n,o,x | goto_next_start @function.outer | Go to next function start |
| `]c` | n,o,x | goto_next_start @class.outer | Go to next class start |
| `]]` | n,o,x | goto_next_end @block.outer | Go to next block end |
| `]F` | n,o,x | goto_next_end @function.outer | Go to next function end |
| `]C` | n,o,x | goto_next_end @class.outer | Go to next class end |
| `[[` | n,o,x | goto_previous_start @block.outer | Go to previous block start |
| `[f` | n,o,x | goto_previous_start @function.outer | Go to previous function start |
| `[c` | n,o,x | goto_previous_start @class.outer | Go to previous class start |
| `[]` | n,o,x | goto_previous_end @block.outer | Go to previous block end |
| `[F` | n,o,x | goto_previous_end @function.outer | Go to previous function end |
| `[C` | n,o,x | goto_previous_end @class.outer | Go to previous class end |

---

## Textobjects - Selection

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `af` | o,x | @function.outer | Select around function |
| `if` | o,x | @function.inner | Select inside function |
| `ac` | o,x | @class.outer | Select around class |
| `ic` | o,x | @class.inner | Select inside class |

---

## Textobjects - Swap

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `~` | n | swap_next @parameter.inner | Swap parameter with next |

---

## Textsubjects

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<CR>` | v | textsubjects-smart | Smart expand selection (in visual mode) |
| `<BS>` | v | prev_selection | Return to previous selection |

---

## Repeatable Movement

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `;` | n,x,o | repeat_last_move_next | Repeat last movement forward |
| `,` | n,x,o | repeat_last_move_previous | Repeat last movement backward |

---

## nvim-ts-autotag

This plugin provides automatic tag handling - no explicit keybindings, operates automatically:
- Auto close tags on typing
- Auto rename paired tags
- Auto close on trailing `</`
