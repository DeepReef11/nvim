# mini.ai Default Keybindings

## Overview

**mini.ai** is a Neovim Lua plugin by echasnovski that extends and creates `a`/`i` textobjects. Part of the 'mini.nvim' library, it enhances built-in textobjects (like `a(`, `a)`, `a'`), creates new ones (like `a*`, `af`, `a?`), and allows custom textobject creation via Lua patterns, Treesitter, or functions.

Key features:
- Dot-repeat support
- Count support (`v:count`)
- Multiple search methods (cover, next, prev, nearest)
- Consecutive application
- Next/last textobject variants
- Go-to edge motions

## Default Keybindings

### Main Textobject Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `a` | x, o | Around textobject | Select around a textobject (includes surrounding delimiters) |
| `i` | x, o | Inside textobject | Select inside a textobject (excludes delimiters) |
| `an` | x, o | Around next | Select around the next occurrence of textobject |
| `in` | x, o | Inside next | Select inside the next occurrence of textobject |
| `al` | x, o | Around last | Select around the previous (last) occurrence of textobject |
| `il` | x, o | Inside last | Select inside the previous (last) occurrence of textobject |
| `g[` | n, x | Go to left edge | Move cursor to the left edge of `a` textobject |
| `g]` | n, x | Go to right edge | Move cursor to the right edge of `a` textobject |

**Mode Legend:** `n` = Normal, `x` = Visual, `o` = Operator-pending

### Built-in Textobject Identifiers

These identifiers are used after the prefix mappings (e.g., `ai(` = around inside parentheses, `if` = inside function call):

| Key | Textobject | Description |
|-----|------------|-------------|
| `(` | Balanced `()` | Parentheses (opening variant - `i` ignores inner whitespace) |
| `)` | Balanced `()` | Parentheses (closing variant - `i` includes inner whitespace) |
| `[` | Balanced `[]` | Square brackets (opening variant) |
| `]` | Balanced `[]` | Square brackets (closing variant) |
| `{` | Balanced `{}` | Curly braces (opening variant) |
| `}` | Balanced `{}` | Curly braces (closing variant) |
| `<` | Balanced `<>` | Angle brackets (opening variant) |
| `>` | Balanced `<>` | Angle brackets (closing variant) |
| `b` | Bracket alias | Matches any of `)`, `]`, or `}` (finds nearest) |
| `"` | Double quotes | Balanced double quote pairs |
| `'` | Single quotes | Balanced single quote pairs |
| `` ` `` | Backticks | Balanced backtick pairs |
| `q` | Quote alias | Matches any of `"`, `'`, or `` ` `` (finds nearest) |
| `f` | Function call | Function name followed by balanced `()` |
| `a` | Argument | Region inside balanced brackets between separators (`,`, `;`) |
| `t` | Tag | Balanced HTML/XML tag pairs with content |
| `?` | User prompt | Interactively ask user for left/right textobject edges |

### Default Behavior for Other Characters

Any character that is not a Latin letter and not explicitly defined above triggers the **default textobject** behavior. This includes:
- Punctuation characters (e.g., `*`, `_`, `-`, `.`, etc.)
- Digit characters
- Whitespace characters

This allows patterns like `a*` (around asterisks), `a_` (around underscores), or `a<Space>` (around spaces) to work automatically.

## Usage Examples

| Command | Action |
|---------|--------|
| `daf` | Delete around function call |
| `cia` | Change inside argument |
| `yinq` | Yank inside next quote |
| `valt` | Visual select around last tag |
| `g[f` | Go to left edge of function call |
| `da*` | Delete around asterisks (using default behavior) |
| `ci"` | Change inside double quotes |
| `vib` | Visual select inside nearest bracket |

## Default Configuration

```lua
require('mini.ai').setup({
  -- Table with textobject id as fields, textobject specification as values
  custom_textobjects = nil,

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    around = 'a',
    inside = 'i',
    around_next = 'an',
    inside_next = 'in',
    around_last = 'al',
    inside_last = 'il',
    goto_left = 'g[',
    goto_right = 'g]',
  },

  -- Number of lines within which textobject is searched
  n_lines = 50,

  -- How to search for object (first argument is for `a` textobject,
  -- second is for `i` textobject). Options:
  -- 'cover', 'cover_or_next', 'cover_or_prev', 'cover_or_nearest',
  -- 'next', 'prev', 'nearest'
  search_method = 'cover_or_next',

  -- Whether to show notifications
  silent = false,
})
```

## Notes

- **Neovim 0.12+ Conflict**: The default `an` and `in` mappings may conflict with built-in LSP selection range mappings (`v_an`, `v_in`). Consider using different keys or mapping LSP functionality manually via `vim.lsp.buf.selection_range()`.
- Opening brackets (`(`, `[`, `{`, `<`) handle whitespace differently than closing brackets for `i` textobjects - opening ignores inner whitespace, closing includes it.
- The `b` and `q` aliases find the nearest matching bracket/quote type, making them versatile for quick selections.

## Sources

- [GitHub - echasnovski/mini.ai](https://github.com/echasnovski/mini.ai)
- [mini.ai Documentation](https://nvim-mini.org/mini.nvim/doc/mini-ai.html)
- [mini.ai README](https://nvim-mini.org/mini.nvim/readmes/mini-ai.html)
