# multicursors.nvim Default Keybindings

## Overview

[multicursors.nvim](https://github.com/smoka7/multicursors.nvim) by smoka7 is a multi-cursor plugin for Neovim that extends native text editing capabilities. It provides an intuitive way to edit repetitive text with multiple selections, allowing you to create and manage multiple cursors, perform simultaneous edits, and execute commands on all selections at once. The plugin requires `nvimtools/hydra.nvim` as a dependency.

## Commands to Enter Multicursor Mode

These are Ex commands (not keybindings) that must be mapped by the user:

| Command | Description |
|---------|-------------|
| `:MCstart` | Select word under cursor (or visual selection in visual mode) and start multicursor mode |
| `:MCvisual` | Select the last visual mode selection and start multicursor mode |
| `:MCpattern` | Prompt for a pattern and select every match in buffer |
| `:MCvisualPattern` | Prompt for a pattern and select every match in visual selection |
| `:MCunderCursor` | Select char under cursor and start multicursor mode |
| `:MCclear` | Clear all selections |

**Recommended mapping:** `<Leader>m` mapped to `<cmd>MCstart<cr>` in normal and visual modes.

## Default Mode Entry Keys (within multicursor mode)

| Key | Action | Description |
|-----|--------|-------------|
| `i` | insert | Enter insert mode at all selections |
| `a` | append | Enter append mode at all selections |
| `c` | change | Delete selection text and enter insert mode |
| `e` | extend | Enter extend mode for expanding/shrinking selections |

## Default Keybindings

### Normal Mode Keys (Multicursor Normal Mode)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Esc>` | n | Exit | Clear all selections, return to normal Neovim mode |
| `<C-c>` | n | Exit | Clear all selections, return to normal Neovim mode |
| `i` | n | Insert Mode | Enter insert mode at all selections |
| `a` | n | Append Mode | Enter append mode at all selections |
| `e` | n | Extend Mode | Enter extend mode for selection manipulation |
| `c` | n | Change | Delete selection text and enter insert mode |
| `n` | n | Find Next | Find next match after main selection |
| `N` | n | Find Previous | Find previous match before main selection |
| `<C-a>` | n | Find All | Create selections for all matches in buffer |
| `q` | n | Skip Next | Skip current selection, find next match |
| `Q` | n | Skip Previous | Skip current selection, find previous match |
| `]` | n | Goto Next | Swap main selection with next selection |
| `[` | n | Goto Previous | Swap main selection with previous selection |
| `}` | n | Skip Goto Next | Delete main selection, move to next |
| `{` | n | Skip Goto Previous | Delete main selection, move to previous |
| `<C-n>` | n | Create Char | Create selection for char under cursor |
| `j` | n | Create Down | Create selection one line below cursor |
| `k` | n | Create Up | Create selection one line above cursor |
| `J` | n | Skip Create Down | Skip current, create selection below |
| `K` | n | Skip Create Up | Skip current, create selection above |
| `r` | n | Replace | Replace selections with unnamed register content |
| `p` | n | Paste After | Put register content after selections |
| `P` | n | Paste Before | Put register content before selections |
| `y` | n | Yank | Yank selection text to unnamed register |
| `Y` | n | Yank End | Yank from selection to end of line |
| `yy` | n | Yank Line | Yank entire line of selections |
| `d` | n | Delete | Delete selection text |
| `D` | n | Delete End | Delete from selection to end of line |
| `dd` | n | Delete Line | Delete entire line of selections |
| `gu` | n | Lowercase | Convert selections to lowercase |
| `gU` | n | Uppercase | Convert selections to UPPERCASE |
| `z` | n | Align Before | Align selections by adding spaces before |
| `Z` | n | Align Start | Align selections at line start |
| `@` | n | Run Macro | Execute macro at each selection start |
| `.` | n | Dot Repeat | Repeat last change at all selections |
| `,` | n | Clear Others | Keep only main selection, clear all others |
| `:` | n | Normal Command | Execute normal mode command at all selections |
| `u` | n | Undo | Undo last change |
| `<C-r>` | n | Redo | Redo last undone change |

### Insert Mode Keys (Multicursor Insert/Append/Change Mode)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Esc>` | i | Exit | Return to multicursor normal mode |
| `<C-c>` | i | Exit | Return to multicursor normal mode |
| `<BS>` | i | Backspace | Delete character before selections |
| `<Del>` | i | Delete | Delete character under selections |
| `<CR>` | i | New Line | Insert new line below selections |
| `<C-j>` | i | New Line | Insert new line below selections |
| `<Left>` | i | Move Left | Move selections one character left |
| `<Right>` | i | Move Right | Move selections one character right |
| `<Up>` | i | Move Up | Move selections one line up |
| `<Down>` | i | Move Down | Move selections one line down |
| `<C-Left>` | i | Word Left | Move selections one word left |
| `<C-Right>` | i | Word Right | Move selections one word right |
| `<Home>` | i | Line Start | Move selections to start of line |
| `<End>` | i | Line End | Move selections to end of line |
| `<C-v>` | i | Paste | Paste from system clipboard |
| `<C-r>` | i | Register | Insert register contents |
| `<C-w>` | i | Delete Word | Delete one word before selections |
| `<C-BS>` | i | Delete Word | Delete one word before selections |
| `<C-u>` | i | Delete to Start | Delete from selection to line start |

### Extend Mode Keys (Selection Expansion/Shrinking)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Esc>` | e | Exit | Return to multicursor normal mode |
| `o` | e | Toggle Anchor | Toggle which side of selection extends |
| `O` | e | Toggle Anchor | Toggle which side of selection extends |
| `w` | e | Word Forward | Extend selection to start of next word |
| `e` | e | Word End | Extend selection to end of word |
| `b` | e | Word Backward | Extend selection to start of previous word |
| `h` | e | Char Left | Extend selection one character left |
| `j` | e | Char Down | Extend selection one line down |
| `k` | e | Char Up | Extend selection one line up |
| `l` | e | Char Right | Extend selection one character right |
| `^` | e | Line Start | Extend selection to first non-blank character |
| `$` | e | Line End | Extend selection to end of line |
| `t` | e | Node Parent | Extend to parent Treesitter node |
| `r` | e | Node First Child | Shrink to first child Treesitter node |
| `y` | e | Node Last Child | Shrink to last child Treesitter node |
| `u` | e | Undo | Undo last extend/shrink operation |
| `c` | e | Custom Motion | Prompt for custom motion and execute |

## Mode Legend

- `n` = Multicursor Normal Mode (active after entering multicursor mode)
- `i` = Multicursor Insert/Append/Change Mode
- `e` = Multicursor Extend Mode

## Notes

1. **No default global keybindings**: The plugin does not set any global keybindings by default. You must map commands like `:MCstart` yourself (recommended: `<Leader>m`).

2. **Keys not mapped pass through**: Any keys not explicitly mapped in the tables above will not affect other selections and work normally.

3. **Treesitter integration**: Extend mode supports Treesitter-based selection expansion (`t`, `r`, `y` keys) for syntax-aware selection.

4. **Hydra dependency**: The plugin uses hydra.nvim to manage the modal key state while in multicursor mode.

## Sources

- [smoka7/multicursors.nvim GitHub Repository](https://github.com/smoka7/multicursors.nvim)
- [multicursors.nvim README](https://github.com/smoka7/multicursors.nvim/blob/main/README.md)
