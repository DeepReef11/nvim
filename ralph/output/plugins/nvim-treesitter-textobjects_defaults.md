# nvim-treesitter-textobjects Default Keybindings

> **Important Note**: nvim-treesitter-textobjects does NOT ship with pre-configured default keybindings out of the box. All keybindings must be explicitly configured by the user. The keybindings below are the **commonly recommended examples** from the official documentation that most users adopt.

---

## Text Object Selection

Text objects work in **Visual mode (v/V)** and **Operator-pending mode (o)**.

| Keybinding | Text Object | Description |
|------------|-------------|-------------|
| `af` | `@function.outer` | Select around function |
| `if` | `@function.inner` | Select inside function |
| `ac` | `@class.outer` | Select around class |
| `ic` | `@class.inner` | Select inside class |
| `as` | `@local.scope` | Select language scope |
| `aa` | `@parameter.outer` | Select around parameter/argument |
| `ia` | `@parameter.inner` | Select inside parameter/argument |
| `ab` | `@block.outer` | Select around block |
| `ib` | `@block.inner` | Select inside block |
| `al` | `@loop.outer` | Select around loop |
| `il` | `@loop.inner` | Select inside loop |
| `a/` | `@comment.outer` | Select around comment |
| `i/` | `@comment.inner` | Select inside comment |

### Selection Modes

You can configure how text objects are selected:

| Selection Mode | Vim Mode | Description |
|----------------|----------|-------------|
| `'v'` | charwise | Character-by-character selection |
| `'V'` | linewise | Full line selection |
| `'<c-v>'` | blockwise | Block/column selection |

---

## Movement Keybindings

Movement keybindings work in **Normal mode (n)**, **Visual mode (x)**, and **Operator-pending mode (o)**.

### Go to Next Start

| Keybinding | Text Object | Description |
|------------|-------------|-------------|
| `]m` | `@function.outer` | Next function start |
| `]]` | `@class.outer` | Next class start |
| `]o` | `@loop.*` | Next loop start |
| `]s` | `@local.scope` | Next scope start |
| `]z` | `@fold` | Next fold start |
| `]d` | `@conditional.outer` | Next conditional start |
| `]f` | `@function.outer` | Next function start (alternative) |
| `]c` | `@class.outer` | Next class start (alternative) |
| `]a` | `@parameter.inner` | Next parameter start |

### Go to Next End

| Keybinding | Text Object | Description |
|------------|-------------|-------------|
| `]M` | `@function.outer` | Next function end |
| `][` | `@class.outer` | Next class end |
| `]F` | `@function.outer` | Next function end (alternative) |
| `]C` | `@class.outer` | Next class end (alternative) |
| `]A` | `@parameter.inner` | Next parameter end |

### Go to Previous Start

| Keybinding | Text Object | Description |
|------------|-------------|-------------|
| `[m` | `@function.outer` | Previous function start |
| `[[` | `@class.outer` | Previous class start |
| `[f` | `@function.outer` | Previous function start (alternative) |
| `[c` | `@class.outer` | Previous class start (alternative) |
| `[d` | `@conditional.outer` | Previous conditional start |
| `[a` | `@parameter.inner` | Previous parameter start |

### Go to Previous End

| Keybinding | Text Object | Description |
|------------|-------------|-------------|
| `[M` | `@function.outer` | Previous function end |
| `[]` | `@class.outer` | Previous class end |
| `[F` | `@function.outer` | Previous function end (alternative) |
| `[C` | `@class.outer` | Previous class end (alternative) |
| `[A` | `@parameter.inner` | Previous parameter end |

---

## Swap Keybindings

Swap keybindings work in **Normal mode (n)**.

| Keybinding | Text Object | Description |
|------------|-------------|-------------|
| `<leader>a` | `@parameter.inner` | Swap with next parameter |
| `<leader>A` | `@parameter.inner` | Swap with previous parameter |
| `~` | `@parameter.inner` | Swap parameter (alternative) |

---

## Repeatable Movement

Keybindings for repeating the last movement, works in **Normal mode (n)**, **Visual mode (x)**, and **Operator-pending mode (o)**.

| Keybinding | Description |
|------------|-------------|
| `;` | Repeat last move (forward direction) |
| `,` | Repeat last move (backward direction) |
| `f`, `F`, `t`, `T` | Enhanced with repeat capability |

---

## LSP Interop (Peek Definition)

Peek definition keybindings work in **Normal mode (n)**.

| Keybinding | Text Object | Description |
|------------|-------------|-------------|
| `<leader>df` | `@function.outer` | Peek function definition in floating window |
| `<leader>dF` | `@class.outer` | Peek class definition in floating window |

> **Tip**: Press the keybinding twice to enter the floating window.

---

## Available Text Object Captures

The plugin provides 31 text object captures (with inner/outer variants):

| Category | Captures |
|----------|----------|
| **Code Structure** | `@function`, `@class`, `@block`, `@conditional`, `@loop` |
| **Parameters** | `@parameter`, `@call` |
| **Assignments** | `@assignment` (inner, outer, lhs, rhs) |
| **Comments** | `@comment` |
| **Attributes** | `@attribute` |
| **Return/Statement** | `@return`, `@statement` |
| **Regex** | `@regex` |
| **Other** | `@frame`, `@number`, `@scopename` |
| **Special Query Groups** | `@local.scope` (locals), `@fold` (folds) |

---

## Mode Reference

| Mode | Key | Description |
|------|-----|-------------|
| Normal | `n` | Standard editing mode |
| Visual | `v` | Character visual selection |
| Visual Line | `V` | Line visual selection |
| Visual Block | `x` | Block visual selection |
| Operator-pending | `o` | Waiting for motion after operator |
| Insert | `i` | Text insertion mode |
| Terminal | `t` | Terminal mode |

---

## Sources

- [nvim-treesitter-textobjects GitHub Repository](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter-textobjects README](https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/README.md)
- [LazyVim TreeSitter Configuration](http://www.lazyvim.org/plugins/treesitter)
