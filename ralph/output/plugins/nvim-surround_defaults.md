# nvim-surround Default Keybindings

## Overview

nvim-surround is a Neovim plugin for adding, changing, and deleting surrounding delimiter pairs. Written in Lua by kylechui, it provides intuitive keybindings for manipulating surrounds like brackets, quotes, and HTML tags.

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `ys{motion}{char}` | n | Add surround | Surround text defined by motion with delimiter pair |
| `yss{char}` | n | Add surround (line) | Surround current line, ignoring leading/trailing whitespace |
| `yS{motion}{char}` | n | Add surround (new lines) | Surround motion with delimiter pair on new lines |
| `ySS{char}` | n | Add surround (line, new lines) | Surround current line with delimiter pair on new lines |
| `ds{char}` | n | Delete surround | Delete surrounding delimiter pair |
| `cs{target}{replacement}` | n | Change surround | Change surrounding pair from target to replacement |
| `cS{target}{replacement}` | n | Change surround (new lines) | Change surrounding pair, placing replacement on new lines |
| `<C-g>s` | i | Add surround | Add delimiter pair around cursor position |
| `<C-g>S` | i | Add surround (new lines) | Add delimiter pair on new lines around cursor |
| `S{char}` | v | Add surround | Add delimiter pair around visual selection |
| `gS{char}` | v | Add surround (new lines) | Add delimiter pair around selection on new lines |

## Surround Characters

### Bracket Pairs

| Key | Surround Type | Notes |
|-----|---------------|-------|
| `)` or `(` | Parentheses `()` | Opening `(` adds spaces, closing `)` does not |
| `]` or `[` | Square brackets `[]` | Opening `[` adds spaces, closing `]` does not |
| `}` or `{` | Curly braces `{}` | Opening `{` adds spaces, closing `}` does not |
| `>` or `<` | Angle brackets `<>` | Opening `<` adds spaces, closing `>` does not |

### Quote Characters

| Key | Surround Type |
|-----|---------------|
| `'` | Single quotes |
| `"` | Double quotes |
| `` ` `` | Backticks |

### Special Surrounds

| Key | Surround Type | Description |
|-----|---------------|-------------|
| `t` | HTML tags | Prompts for tag name/attributes (e.g., `<div>`) |
| `T` | HTML tags | Same as `t`, used for certain operations |
| `f` | Function call | Prompts for function name, wraps in `funcname()` |
| `F` | Function call | Matches function calls for deletion/change |
| `i` | Interactive | Prompts user for custom left and right delimiters |

### Aliases (Single-Character Shortcuts)

| Alias | Maps To | Description |
|-------|---------|-------------|
| `b` | `)` | Parentheses (no space) |
| `B` | `}` | Curly braces (no space) |
| `r` | `]` | Square brackets (no space) |
| `a` | `>` | Angle brackets (no space) |

### Multi-Character Aliases (for delete/change operations)

| Alias | Maps To | Description |
|-------|---------|-------------|
| `q` | `'"`, `'`, `` ` `` | Any quote character |
| `s` | `}`, `]`, `)`, `>`, `"`, `'`, `` ` `` | Any surrounding delimiter |

## Usage Examples

| Old Text | Command | New Text | Description |
|----------|---------|----------|-------------|
| `surr*ound_words` | `ysiw)` | `(surround_words)` | Surround inner word with parentheses |
| `surr*ound_words` | `ysiw(` | `( surround_words )` | Surround with parentheses and spaces |
| `*make strings` | `ys$"` | `"make strings"` | Surround to end of line with quotes |
| `[delete ar*ound me!]` | `ds]` | `delete around me!` | Delete surrounding brackets |
| `remove <b>HTML t*ags</b>` | `dst` | `remove HTML tags` | Delete surrounding HTML tags |
| `'change quot*es'` | `cs'"` | `"change quotes"` | Change single to double quotes |
| `<b>or tag* types</b>` | `csth1<CR>` | `<h1>or tag types</h1>` | Change tag type |
| `delete(functi*on calls)` | `dsf` | `function calls` | Delete function call surround |

## Important Notes

- **Opening vs Closing**: When using opening delimiters (`(`, `[`, `{`, `<`), spaces are added around the content. Closing delimiters (`)`, `]`, `}`, `>`) do not add spaces.
- **Dot Repeatable**: All surround operations are dot-repeatable (`.` to repeat last action).
- **Text Objects**: Works with all Vim motions and text objects (`iw`, `aw`, `ip`, `ap`, `i"`, etc.).
- **Line Operations**: `yss` and `ySS` operate on the current line, stripping leading/trailing whitespace.

## Sources

- [GitHub - kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- [nvim-surround documentation](https://github.com/kylechui/nvim-surround/blob/main/doc/nvim-surround.txt)
- [Configuration Wiki](https://github.com/kylechui/nvim-surround/wiki/Configuration)
