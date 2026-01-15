# Complete Neovim Keybinding Audit Report

*Generated: 2026-01-15*

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Core Custom Keymappings](#core-custom-keymappings)
3. [Plugin Keybindings Overview](#plugin-keybindings-overview)
4. [Vim/Neovim Defaults Reference](#vimneovim-defaults-reference)
5. [Conflicts Analysis](#conflicts-analysis)
6. [Available Keys & Suggestions](#available-keys--suggestions)
7. [Plugin Configuration Details](#plugin-configuration-details)

---

## Executive Summary

### Statistics

| Metric | Count |
|--------|-------|
| **Custom keybindings defined** | 484 |
| **Plugin keybindings (from configs)** | 77 |
| **Total unique key combinations** | 438 |
| **Direct conflicts** | 12 |
| **Shadow conflicts** | 30 |
| **Plugin files analyzed** | 85 |
| **Plugin defaults documented** | 59 |

### Key Findings

1. **12 Direct Conflicts** - Multiple bindings for the same key
2. **30 Shadow Conflicts** - Custom overriding plugin defaults
3. **All Function Keys Available** - F1-F11 completely unbound
4. **Many Alt Combinations Free** - 28 available for new mappings
5. **Leader key well-organized** - Using which-key for discoverability

### Priority Actions

| Priority | Issue | Recommendation |
|----------|-------|----------------|
| High | `<leader>cr` conflict (LSP rename vs TS rename file) | Use `<leader>cR` for file rename |
| High | `<leader>cf` conflict (LSP format vs TS fix all) | Use `<leader>cF` for fix all |
| High | `gp` conflict (printer vs yanky) | Disable one or remap |
| Medium | `<leader>gs` conflict (diffview vs telescope) | Consolidate git commands |
| Low | `H` remapped from screen-top | Intentional, document in which-key |

---

## Core Custom Keymappings

*Source: `lua/config/keymappings.lua`*

### Commands

| Command | Action | Description |
|---------|--------|-------------|
| `:Claude [args]` | `launch_claude_docker(args)` | Launch Claude in Docker container |
| `:Y` | `%y+\|wq` | Yank buffer, save and exit |
| `:CodeSnapText` | Format and yank visual selection | Format selection for sharing as text |

### Leader Key Bindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>cc` | n | `launch_claude_docker('')` | Launch Claude in Docker |
| `<leader>cC` | n | `launch_claude_docker('-r')` | Launch Claude in Docker (resume) |
| `<leader>ps` | n | `pythonscad <file>` | Launch PythonSCAD with current buffer |
| `<leader>T` | n | `launch_terminal()` | Execute terminal program in background |
| `<leader>cy` | x/n | `<cmd>CodeSnapText<CR>` | Yank and format text for sharing |
| `<leader>bk` | n | `<cmd>bd<CR>` | Buffer Delete |
| `<leader>bd` | n | `<cmd>bd!<CR>` | Buffer Delete force! |
| `<leader>q` | n | `toggle_quicklist()` | Toggle quicklist |
| `<leader>ca` | n/v | `vim.lsp.buf.code_action()` | LSP Code Action |
| `<leader>cr` | n | `vim.lsp.buf.rename()` | LSP Rename |
| `<leader>cf` | n/v | `lsp.format()` | LSP Format |
| `<leader>cl` | n | `vim.diagnostic.open_float()` | Open diagnostic float |

### Insert Mode

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-BS>` | i | `<C-w>` | Delete word backward |
| `<C-h>` | i | `<C-w>` | Delete word backward (terminal) |
| `<C-Del>` | i | `<C-o>dw` | Delete word forward |
| `jj` | i | `<Esc>` | Exit insert mode |
| `<C-Space>` | i | completion | LSP trigger completion |

### Normal Mode

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `i` | n | Smart indent | Properly indent on empty line |
| `gV` | n | `v`]o`[` | Select last pasted |
| `H` | n | `^` | Move to first non-blank character |
| `<CR>` | n | `:noh<CR>` | Remove highlights |
| `<Esc>` | n | `nohlsearch` | Remove highlights on escape |
| `x`, `X`, `<Del>` | n | `"_x` / `"_X` | Delete without yank |
| `gx` | n | Open browser | Open links under cursor |

### Visual Mode

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<S-Up/Down/Left/Right>` | v | Direction | Prevent page scroll |
| `<` / `>` | v | Indent | Keep visual mode after indent |
| `` ` `` / `<A-`>` | v | Case | Lowercase / Uppercase |
| `x`, `X` | v | Delete | Delete without yank |
| `p` | v | `"_dP` | Paste without yank |

### LSP Bindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gr` | n | `lsp.buf.references()` | Go to references |
| `gy` | n | `lsp.buf.type_definition()` | Go to type definition |
| `<C-Space>` | n | `lsp.buf.code_action()` | LSP Code Action |
| `gl` | n | `diagnostic.open_float()` | Open diagnostic float |
| `]g` / `[g` | n | `diagnostic.goto_*()` | Next/prev diagnostic |
| `<C-s>` | n | `lsp.buf.signature_help()` | LSP signature help |
| `<C-k>` | n | Peek/Hover | Peek fold or LSP hover |

### Deleted Default Mappings

```
[a, [A, ]a, ]A - Argument list navigation
[b, [B, ]b, ]B - Buffer navigation
[q, [Q, ]q, ]Q - Quickfix navigation
[l, [L, ]l, ]L - Location list navigation
[t, [T, ]t, ]T - Tag navigation
[<C-L>, ]<C-L> - Location list file
[<C-Q>, ]<C-Q> - Quickfix file
[<C-T>, ]<C-T> - Tag stack
```

---

## Plugin Keybindings Overview

### AI Plugins

#### Claude Code (`<leader>c*`)
| Key | Mode | Action |
|-----|------|--------|
| `<leader>cc` | n | Launch Claude in Docker |
| `<leader>cC` | n | Resume Claude session |

#### Copilot Chat
| Key | Mode | Action |
|-----|------|--------|
| `<leader>aa` | n/v | Toggle chat |
| `<leader>ax` | n | Clear chat |
| `<leader>aq` | n | Quick chat |
| `ga` | v | Add to chat |
| `<C-s>` | i | Submit prompt |

#### CodeCompanion
| Key | Mode | Action |
|-----|------|--------|
| `<leader>aa` | n/v | Toggle chat |
| `<leader>ad` | n | Debug toggle |
| `<C-s>` | n (chat) | Send message |
| `gr` | n (chat) | Regenerate |
| `gx` | n (chat) | Clear buffer |

### Git Plugins

#### Gitsigns (`<leader>g*`)
| Key | Mode | Action |
|-----|------|--------|
| `<leader>gj` | n | Next hunk |
| `<leader>gk` | n | Prev hunk |
| `<leader>gl` | n | Blame line |
| `<leader>gp` | n | Preview hunk |
| `<leader>gr` | n | Reset hunk |
| `<leader>gR` | n | Reset buffer |
| `<leader>gs` | n | Stage hunk |
| `<leader>gu` | n | Undo stage |
| `<leader>gd` | n | Diff this |

#### Diffview
| Key | Mode | Action |
|-----|------|--------|
| `<leader>gdo` | n | Open diffview |
| `<leader>gdc` | n | Close diffview |
| `<leader>gdh` | n | File history |

#### Neogit
| Key | Mode | Action |
|-----|------|--------|
| `<leader>gg` | n | Open Neogit |
| Various | buffer | Extensive commit/branch operations |

#### Git Worktree
| Key | Mode | Action |
|-----|------|--------|
| `<leader>gwc` | n | Create worktree |
| `<leader>gws` | n | Switch worktree |

### Navigation Plugins

#### Telescope (`<leader>f*`, `<leader>s*`)
| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | n | Find files |
| `<leader>fb` | n | Buffers |
| `<leader>fg` | n | Live grep |
| `<leader>fh` | n | Help tags |
| `<leader>fo` | n | Recent files |
| `<leader>fw` | n | Grep current word |
| `gd` | n | LSP definitions |
| `gi` | n | LSP implementations |

#### Flash
| Key | Mode | Action |
|-----|------|--------|
| `s` | n/x/o | Jump |
| `S` | n/x/o | Treesitter |
| `r` | o | Remote |
| `R` | o/x | Treesitter search |
| `<C-s>` | c | Toggle flash search |

#### Spider (Smart Word Motion)
| Key | Mode | Action |
|-----|------|--------|
| `w` | n/o/x | Smart word forward |
| `e` | n/o/x | Smart end of word |
| `b` | n/o/x | Smart word backward |

### Code Editing Plugins

#### Mini.surround (`gs*`)
| Key | Mode | Action |
|-----|------|--------|
| `gsa` | n | Add surrounding |
| `gsd` | n | Delete surrounding |
| `gsf` | n | Find surrounding |
| `gsh` | n | Highlight surrounding |
| `gsn` | n | Update n_lines |
| `gsr` | n | Replace surrounding |

#### Comment.nvim (`gc*`, `gb*`)
| Key | Mode | Action |
|-----|------|--------|
| `gcc` | n | Toggle line comment |
| `gbc` | n | Toggle block comment |
| `gc` | v | Comment selection |
| `gca` | n | Add comment end of line |
| `gco` | n | Add comment below |
| `gcO` | n | Add comment above |

#### TreeSJ
| Key | Mode | Action |
|-----|------|--------|
| `<leader>j` | n | Toggle split/join |

### Testing & Debugging

#### Neotest (`<leader>t*`)
| Key | Mode | Action |
|-----|------|--------|
| `<leader>tn` | n | Run nearest test |
| `<leader>tf` | n | Run file tests |
| `<leader>ts` | n | Run test suite |
| `<leader>to` | n | Toggle output |
| `<leader>tp` | n | Toggle summary |

#### DAP (Debug) (`<leader>d*`, `<F*>`)
| Key | Mode | Action |
|-----|------|--------|
| `<leader>db` | n | Toggle breakpoint |
| `<leader>dc` | n | Continue |
| `<leader>di` | n | Step into |
| `<leader>do` | n | Step over |
| `<leader>dO` | n | Step out |
| `<leader>dr` | n | REPL open |
| `<leader>dl` | n | Run last |
| `<leader>du` | n | Toggle UI |

### UI & Windows

#### Smart Splits
| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | n | Move left |
| `<C-j>` | n | Move down |
| `<C-k>` | n | Move up |
| `<C-l>` | n | Move right |
| `<A-h>` | n | Resize left |
| `<A-j>` | n | Resize down |
| `<A-k>` | n | Resize up |
| `<A-l>` | n | Resize right |

#### Bufferline (`H`, `L`)
| Key | Mode | Action |
|-----|------|--------|
| `H` | n | Previous buffer |
| `L` | n | Next buffer |
| `<leader>bp` | n | Pick buffer |
| `<leader>bc` | n | Close others |

#### Oil (File Explorer)
| Key | Mode | Action |
|-----|------|--------|
| `-` | n | Open parent directory |
| `<CR>` | oil | Open entry |
| `g?` | oil | Show help |

### Text Manipulation

#### Text-case (`gu*`, `ga*`)
| Key | Mode | Action |
|-----|------|--------|
| `guu` | n | To upper case |
| `gul` | n | To lower case |
| `gus` | n | To snake_case |
| `gud` | n | To dash-case |
| `guc` | n | To camelCase |
| `gup` | n | To PascalCase |
| `gut` | n | To Title Case |

#### Yanky
| Key | Mode | Action |
|-----|------|--------|
| `p` | n/x | Put after |
| `P` | n/x | Put before |
| `<C-p>` | n | Previous yank |
| `<C-n>` | n | Next yank |
| `]p` / `[p` | n | Put with indent |

---

## Vim/Neovim Defaults Reference

### Movement Summary

| Category | Keys |
|----------|------|
| **Basic** | `h j k l` |
| **Word** | `w W e E b B ge gE` |
| **Line** | `0 ^ $ g_ + -` |
| **Screen** | `H M L gg G` |
| **Scroll** | `<C-f> <C-b> <C-d> <C-u> <C-e> <C-y>` |
| **Search** | `f F t T ; , / ? n N * #` |
| **Jump** | `<C-o> <C-i> g; g,` |
| **Paragraph** | `{ } ( ) [[ ]] [] ][` |

### Operators

| Key | Action |
|-----|--------|
| `d` | Delete |
| `c` | Change |
| `y` | Yank |
| `>` / `<` | Indent |
| `=` | Auto-indent |
| `gq` | Format |
| `gu` / `gU` | Case |

### Text Objects

| Category | Inner | Around |
|----------|-------|--------|
| Word | `iw` | `aw` |
| WORD | `iW` | `aW` |
| Sentence | `is` | `as` |
| Paragraph | `ip` | `ap` |
| Parentheses | `i(` `ib` | `a(` `ab` |
| Brackets | `i[` | `a[` |
| Braces | `i{` `iB` | `a{` `aB` |
| Quotes | `i"` `i'` | `a"` `a'` |
| Tags | `it` | `at` |

### Registers

| Register | Purpose |
|----------|---------|
| `""` | Unnamed (default) |
| `"0` | Yank register |
| `"1-9` | Delete history |
| `"a-z` | Named |
| `"+` | System clipboard |
| `"_` | Black hole |
| `"/` | Last search |

### Folds

| Key | Action |
|-----|--------|
| `zo` / `zO` | Open fold |
| `zc` / `zC` | Close fold |
| `za` / `zA` | Toggle fold |
| `zR` / `zM` | Open/Close all |
| `zj` / `zk` | Next/Prev fold |

### Windows

| Key | Action |
|-----|--------|
| `<C-w>s` | Split horizontal |
| `<C-w>v` | Split vertical |
| `<C-w>c` | Close window |
| `<C-w>o` | Close others |
| `<C-w>hjkl` | Navigate |
| `<C-w>HJKL` | Move window |
| `<C-w>=` | Equalize |

---

## Conflicts Analysis

### Direct Conflicts (12)

| Key | Mode | Sources | Resolution |
|-----|------|---------|------------|
| `<leader>-` | n | which-key (2x) | Duplicate, remove one |
| `<leader>=` | n | which-key (2x) | Duplicate, remove one |
| `<leader>cf` | n | keymappings (format) vs typescript (fix all) | Use `<leader>cF` for fix all |
| `<leader>cr` | n | keymappings (rename) vs typescript (rename file) | Use `<leader>cR` for file rename |
| `<leader>cs` | n | typescript (2 different actions) | Review and consolidate |
| `<leader>d` | n | neogen vs vim-doge (disabled) | OK - vim-doge is disabled |
| `<leader>gs` | n | git.lua vs which-key | Use `<leader>gS` for telescope |
| `<leader>nd` | n | notify vs npm delete | Use different prefix for npm |
| `<leader>ns` | n | telescope vs npm show | Use different prefix for npm |
| `gp` | n | printer vs yanky (2x) | Remap printer to `gP` |
| `H` | n | keymappings vs bufferline | Review: both useful |
| `q` | n | CopilotChat vs alpha vs codecompanion | Context-dependent, OK |

### Shadow Conflicts (30)

Key shadows where custom config overrides plugin defaults:

| Key | Mode | Custom | Plugin Default |
|-----|------|--------|----------------|
| `<CR>` | n | Remove highlights | CopilotChat/codecompanion send |
| `<leader>cc` | n | Claude Docker | claude-code.nvim default |
| `gr` | n | LSP references | codecompanion regenerate |
| `gs` | n | mini.splitjoin | CopilotChat/codecompanion |
| `gx` | n | Open browser | codecompanion clear |
| `gy` | n | Type definition | CopilotChat/codecompanion yank |
| `<Tab>` | i | blink.cmp | tabout.nvim |
| `<S-Tab>` | i | blink.cmp | tabout.nvim |
| `<C-Space>` | i | Multiple | Multiple |

### Recommended Actions

1. **High Priority**:
   - Remap `gp` for printer.nvim to `gP`
   - Change TypeScript `<leader>cf` to `<leader>cF`
   - Change TypeScript `<leader>cr` to `<leader>cR`

2. **Medium Priority**:
   - Consolidate git telescope under `<leader>gS`
   - Move npm commands to `<leader>np*` prefix

3. **Review**:
   - `<CR>` behavior in AI chat buffers
   - `<C-Space>` completion triggers

---

## Available Keys & Suggestions

### Function Keys (Almost All Available!)

| Key | Status | Suggested Use |
|-----|--------|---------------|
| `<F1>` | Free | Help / Documentation |
| `<F2>` | Free | Rename symbol |
| `<F3>` | Free | Find next |
| `<F4>` | Free | Toggle explorer |
| `<F5>` | Free | Start debugger |
| `<F6>` | Free | Toggle terminal |
| `<F7>` | Free | Run tests |
| `<F8>` | Free | Toggle breakpoint |
| `<F9>` | Free | Step over |
| `<F10>` | Free | Step into |
| `<F11>` | Free | Step out |
| `<F12>` | **Used** | - |

### Available Alt Combinations

```
<A-a> <A-d> <A-f> <A-g> <A-i> <A-j> <A-k> <A-l>
<A-n> <A-q> <A-r> <A-s> <A-t> <A-u> <A-v> <A-x>
<A-y> <A-z> <A-0> <A-1> ... <A-9>
```

**Suggestions**:
- `<A-j>` / `<A-k>`: Move line down/up
- `<A-d>`: Duplicate line
- `<A-f>`: Format document
- `<A-s>`: Save all

### Available g-Prefix

```
gh gi gm gn gq gt gw gz
```

**Note**: `gg`, `gj`, `gk`, `go`, `gv` are Vim defaults you may want to preserve.

### Available z-Prefix

Most `z` keys are used for folds (Vim defaults). Available custom:
```
zp zq zs zu zw zx zy
```

### Available Bracket Keys

```
[a ]a [e ]e [j ]j [k ]k [l ]l
[m ]m [n ]n [o ]o [v ]v [w ]w
```

**Suggestions**:
- `[e` / `]e`: Prev/Next error
- `[w` / `]w`: Prev/Next warning

### Available Leader Keys (Single Char)

Currently unused single-character leaders:
```
<leader>a <leader>e <leader>i <leader>k
<leader>m <leader>o <leader>v <leader>z
```

---

## Plugin Configuration Details

Full documentation for each plugin is available in:

```
./ralph/output/plugins/
├── <plugin>.lua.md         # Custom config keybindings
└── <plugin>_defaults.md    # Plugin default keybindings
```

### Files by Size (Most Comprehensive)

1. `snacks.nvim_defaults.md` (384 lines)
2. `which-key.nvim_defaults.md` (321 lines)
3. `octo.nvim_defaults.md` (262 lines)
4. `git.lua.md` (201 lines)
5. `which-key_setup.lua.md` (199 lines)
6. `telescope.nvim_defaults.md` (194 lines)
7. `neogit_defaults.md` (193 lines)

### Key Plugin Categories

| Category | Plugins |
|----------|---------|
| **AI** | claude-code, copilot, codecompanion |
| **Git** | gitsigns, neogit, diffview, lazygit, octo |
| **Navigation** | telescope, flash, oil, nvim-tree |
| **LSP** | lspconfig, trouble, blink.cmp |
| **Editing** | mini.*, comment, treesitter, treesj |
| **Testing** | neotest, nvim-dap |
| **UI** | which-key, bufferline, noice, snacks |

---

## Quick Reference Card

### Essential Navigation
```
H           → Line start (non-blank)
L           → Next buffer
s           → Flash jump
<C-hjkl>    → Window navigation
<leader>ff  → Find files
<leader>fg  → Live grep
<leader>fb  → Buffers
```

### Essential Editing
```
gcc         → Comment line
gc{motion}  → Comment selection
gsa{char}   → Add surround
gsd         → Delete surround
<leader>j   → Split/Join
```

### Essential LSP
```
gd          → Go to definition
gr          → Go to references
gy          → Go to type def
<leader>ca  → Code action
<leader>cr  → Rename
<leader>cf  → Format
<C-k>       → Hover / Peek
```

### Essential Git
```
<leader>gg  → Neogit
<leader>gl  → Blame line
<leader>gp  → Preview hunk
<leader>gs  → Stage hunk
]c / [c     → Next/Prev hunk
```

### Essential Debug
```
<leader>db  → Breakpoint
<leader>dc  → Continue
<leader>di  → Step into
<leader>do  → Step over
<leader>du  → Toggle UI
```

---

*Report compiled from 85 plugin configuration files and 59 plugin default documentations.*
*Total keybindings analyzed: 500+*
