# Vim/Neovim Default Keybindings Reference

This document lists the standard Vim/Neovim default keybindings organized by category.

---

## Movement

### Basic Movement
| Key | Mode | Action |
|-----|------|--------|
| `h` | n | Move left |
| `j` | n | Move down |
| `k` | n | Move up |
| `l` | n | Move right |
| `gj` | n | Move down (display line) |
| `gk` | n | Move up (display line) |

### Word Movement
| Key | Mode | Action |
|-----|------|--------|
| `w` | n | Move to next word start |
| `W` | n | Move to next WORD start |
| `e` | n | Move to end of word |
| `E` | n | Move to end of WORD |
| `b` | n | Move to previous word start |
| `B` | n | Move to previous WORD start |
| `ge` | n | Move to end of previous word |
| `gE` | n | Move to end of previous WORD |

### Line Movement
| Key | Mode | Action |
|-----|------|--------|
| `0` | n | Move to beginning of line |
| `^` | n | Move to first non-blank character |
| `$` | n | Move to end of line |
| `g_` | n | Move to last non-blank character |
| `g0` | n | Move to beginning of display line |
| `g^` | n | Move to first non-blank of display line |
| `g$` | n | Move to end of display line |
| `+` | n | Move to first non-blank of next line |
| `-` | n | Move to first non-blank of previous line |

### Screen Movement
| Key | Mode | Action |
|-----|------|--------|
| `H` | n | Move to top of screen |
| `M` | n | Move to middle of screen |
| `L` | n | Move to bottom of screen |
| `gg` | n | Go to first line |
| `G` | n | Go to last line |
| `{count}G` | n | Go to line {count} |
| `{count}gg` | n | Go to line {count} |

### Scroll
| Key | Mode | Action |
|-----|------|--------|
| `<C-f>` | n | Page down |
| `<C-b>` | n | Page up |
| `<C-d>` | n | Half page down |
| `<C-u>` | n | Half page up |
| `<C-e>` | n | Scroll down one line |
| `<C-y>` | n | Scroll up one line |
| `zz` | n | Center cursor line |
| `zt` | n | Cursor line to top |
| `zb` | n | Cursor line to bottom |

### Character/Line Search
| Key | Mode | Action |
|-----|------|--------|
| `f{char}` | n | Move to next {char} |
| `F{char}` | n | Move to previous {char} |
| `t{char}` | n | Move before next {char} |
| `T{char}` | n | Move after previous {char} |
| `;` | n | Repeat f/F/t/T forward |
| `,` | n | Repeat f/F/t/T backward |

### Paragraph/Sentence Movement
| Key | Mode | Action |
|-----|------|--------|
| `{` | n | Move to previous paragraph |
| `}` | n | Move to next paragraph |
| `(` | n | Move to previous sentence |
| `)` | n | Move to next sentence |
| `[[` | n | Move to previous section/function |
| `]]` | n | Move to next section/function |
| `[]` | n | Move to end of previous section |
| `][` | n | Move to end of next section |

### Jump List
| Key | Mode | Action |
|-----|------|--------|
| `<C-o>` | n | Jump to older position |
| `<C-i>` | n | Jump to newer position |
| `g;` | n | Go to older position in change list |
| `g,` | n | Go to newer position in change list |

---

## Operators

| Key | Mode | Action |
|-----|------|--------|
| `d` | n | Delete (motion follows) |
| `c` | n | Change (motion follows) |
| `y` | n | Yank (motion follows) |
| `>` | n | Indent right (motion follows) |
| `<` | n | Indent left (motion follows) |
| `=` | n | Auto-indent (motion follows) |
| `gq` | n | Format text (motion follows) |
| `gw` | n | Format text, keep cursor (motion follows) |
| `gu` | n | Make lowercase (motion follows) |
| `gU` | n | Make uppercase (motion follows) |
| `g~` | n | Toggle case (motion follows) |
| `!` | n | Filter through external program |

### Operator Shortcuts
| Key | Mode | Action |
|-----|------|--------|
| `dd` | n | Delete line |
| `cc` | n | Change line |
| `yy` | n | Yank line |
| `Y` | n | Yank to end of line (Neovim default) |
| `D` | n | Delete to end of line |
| `C` | n | Change to end of line |
| `>>` | n | Indent line right |
| `<<` | n | Indent line left |
| `==` | n | Auto-indent line |
| `guu` | n | Lowercase line |
| `gUU` | n | Uppercase line |
| `g~~` | n | Toggle case of line |

---

## Text Objects

### Word Objects
| Key | Mode | Action |
|-----|------|--------|
| `iw` | o,v | Inner word |
| `aw` | o,v | A word (includes space) |
| `iW` | o,v | Inner WORD |
| `aW` | o,v | A WORD (includes space) |

### Sentence/Paragraph Objects
| Key | Mode | Action |
|-----|------|--------|
| `is` | o,v | Inner sentence |
| `as` | o,v | A sentence |
| `ip` | o,v | Inner paragraph |
| `ap` | o,v | A paragraph |

### Block Objects
| Key | Mode | Action |
|-----|------|--------|
| `i(` / `i)` / `ib` | o,v | Inner parentheses |
| `a(` / `a)` / `ab` | o,v | A parentheses |
| `i[` / `i]` | o,v | Inner brackets |
| `a[` / `a]` | o,v | A brackets |
| `i{` / `i}` / `iB` | o,v | Inner braces |
| `a{` / `a}` / `aB` | o,v | A braces |
| `i<` / `i>` | o,v | Inner angle brackets |
| `a<` / `a>` | o,v | A angle brackets |
| `i"` | o,v | Inner double quotes |
| `a"` | o,v | A double quotes |
| `i'` | o,v | Inner single quotes |
| `a'` | o,v | A single quotes |
| `` i` `` | o,v | Inner backticks |
| `` a` `` | o,v | A backticks |
| `it` | o,v | Inner tag |
| `at` | o,v | A tag |

---

## Search

| Key | Mode | Action |
|-----|------|--------|
| `/` | n | Search forward |
| `?` | n | Search backward |
| `n` | n | Repeat search forward |
| `N` | n | Repeat search backward |
| `*` | n | Search word under cursor forward |
| `#` | n | Search word under cursor backward |
| `g*` | n | Search partial word forward |
| `g#` | n | Search partial word backward |
| `gd` | n | Go to local definition |
| `gD` | n | Go to global definition |

---

## Marks

| Key | Mode | Action |
|-----|------|--------|
| `m{a-zA-Z}` | n | Set mark |
| `` `{mark} `` | n | Jump to mark (exact position) |
| `'{mark}` | n | Jump to mark (line start) |
| `` `` `` | n | Jump to position before last jump |
| `''` | n | Jump to line before last jump |
| `` `. `` | n | Jump to last change position |
| `'.` | n | Jump to line of last change |
| `` `" `` | n | Jump to position when last editing file |
| `` `^ `` | n | Jump to position of last insert |
| `` `[ `` | n | Jump to start of last yank/change |
| `` `] `` | n | Jump to end of last yank/change |
| `` `< `` | n | Jump to start of last visual selection |
| `` `> `` | n | Jump to end of last visual selection |
| `:marks` | n | List all marks |
| `:delmarks {marks}` | n | Delete marks |

---

## Folds

| Key | Mode | Action |
|-----|------|--------|
| `zo` | n | Open fold |
| `zO` | n | Open folds recursively |
| `zc` | n | Close fold |
| `zC` | n | Close folds recursively |
| `za` | n | Toggle fold |
| `zA` | n | Toggle fold recursively |
| `zR` | n | Open all folds |
| `zM` | n | Close all folds |
| `zr` | n | Reduce folding by one level |
| `zm` | n | Increase folding by one level |
| `zv` | n | View cursor line (open folds) |
| `zx` | n | Update folds |
| `zj` | n | Move to next fold |
| `zk` | n | Move to previous fold |
| `[z` | n | Move to start of current fold |
| `]z` | n | Move to end of current fold |
| `zf{motion}` | n | Create fold |
| `zd` | n | Delete fold |
| `zD` | n | Delete folds recursively |
| `zE` | n | Eliminate all folds |
| `zn` | n | Fold none (disable folding) |
| `zN` | n | Fold normal (enable folding) |
| `zi` | n | Toggle folding |

---

## Windows

| Key | Mode | Action |
|-----|------|--------|
| `<C-w>s` | n | Split window horizontally |
| `<C-w>v` | n | Split window vertically |
| `<C-w>n` | n | New window with empty buffer |
| `<C-w>c` | n | Close window |
| `<C-w>o` | n | Close all other windows |
| `<C-w>q` | n | Quit window |
| `<C-w>h` | n | Move to left window |
| `<C-w>j` | n | Move to window below |
| `<C-w>k` | n | Move to window above |
| `<C-w>l` | n | Move to right window |
| `<C-w>w` | n | Move to next window |
| `<C-w>W` | n | Move to previous window |
| `<C-w>p` | n | Move to previous (last accessed) window |
| `<C-w>t` | n | Move to top-left window |
| `<C-w>b` | n | Move to bottom-right window |
| `<C-w>H` | n | Move window to far left |
| `<C-w>J` | n | Move window to bottom |
| `<C-w>K` | n | Move window to top |
| `<C-w>L` | n | Move window to far right |
| `<C-w>r` | n | Rotate windows down/right |
| `<C-w>R` | n | Rotate windows up/left |
| `<C-w>x` | n | Exchange window with next |
| `<C-w>T` | n | Move window to new tab |
| `<C-w>=` | n | Make all windows equal size |
| `<C-w>_` | n | Maximize window height |
| `<C-w>\|` | n | Maximize window width |
| `<C-w>+` | n | Increase window height |
| `<C-w>-` | n | Decrease window height |
| `<C-w>>` | n | Increase window width |
| `<C-w><` | n | Decrease window width |

---

## Tabs

| Key | Mode | Action |
|-----|------|--------|
| `gt` | n | Go to next tab |
| `gT` | n | Go to previous tab |
| `{count}gt` | n | Go to tab {count} |
| `:tabnew` | n | Open new tab |
| `:tabc` | n | Close tab |
| `:tabo` | n | Close all other tabs |
| `:tabm {n}` | n | Move tab to position {n} |
| `<C-w>gf` | n | Open file under cursor in new tab |

---

## Insert Mode

| Key | Mode | Action |
|-----|------|--------|
| `i` | n | Insert before cursor |
| `I` | n | Insert at beginning of line |
| `a` | n | Insert after cursor |
| `A` | n | Insert at end of line |
| `o` | n | Open line below |
| `O` | n | Open line above |
| `gi` | n | Insert at last insert position |
| `gI` | n | Insert at column 1 |
| `s` | n | Substitute character |
| `S` | n | Substitute line |
| `R` | n | Enter replace mode |
| `r{char}` | n | Replace character with {char} |

### Insert Mode Commands
| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | i | Exit insert mode |
| `<C-[>` | i | Exit insert mode |
| `<C-c>` | i | Exit insert mode (no abbreviation) |
| `<C-o>` | i | Execute one normal mode command |
| `<C-r>{reg}` | i | Insert register contents |
| `<C-a>` | i | Insert previously inserted text |
| `<C-w>` | i | Delete word before cursor |
| `<C-u>` | i | Delete to beginning of line |
| `<C-t>` | i | Indent line |
| `<C-d>` | i | Un-indent line |
| `<C-n>` | i | Next completion |
| `<C-p>` | i | Previous completion |
| `<C-x><C-f>` | i | File name completion |
| `<C-x><C-l>` | i | Line completion |
| `<C-x><C-o>` | i | Omni completion |
| `<C-v>{char}` | i | Insert character literally |
| `<C-k>{digraph}` | i | Insert digraph |

---

## Visual Mode

| Key | Mode | Action |
|-----|------|--------|
| `v` | n | Enter visual mode (character) |
| `V` | n | Enter visual mode (line) |
| `<C-v>` | n | Enter visual mode (block) |
| `gv` | n | Reselect last visual selection |
| `o` | v | Move to other end of selection |
| `O` | v | Move to other corner (block mode) |
| `<Esc>` | v | Exit visual mode |
| `u` | v | Make lowercase |
| `U` | v | Make uppercase |
| `~` | v | Toggle case |
| `>` | v | Indent selection |
| `<` | v | Un-indent selection |
| `=` | v | Auto-indent selection |
| `gq` | v | Format selection |
| `J` | v | Join lines |
| `gJ` | v | Join lines without space |
| `y` | v | Yank selection |
| `d` | v | Delete selection |
| `c` | v | Change selection |
| `r{char}` | v | Replace selection with {char} |
| `I` | v (block) | Insert at start of each line |
| `A` | v (block) | Append at end of each line |
| `$` | v (block) | Extend to end of each line |

---

## Macros

| Key | Mode | Action |
|-----|------|--------|
| `q{reg}` | n | Start recording macro to register |
| `q` | n | Stop recording macro |
| `@{reg}` | n | Execute macro from register |
| `@@` | n | Repeat last macro |
| `{count}@{reg}` | n | Execute macro {count} times |
| `:reg {reg}` | n | View register contents |

---

## Registers

| Key | Mode | Action |
|-----|------|--------|
| `"{reg}` | n | Use register for next delete/yank/put |
| `""` | n | Unnamed register (default) |
| `"0` | n | Yank register |
| `"1-9` | n | Numbered delete registers |
| `"-` | n | Small delete register |
| `"a-z` | n | Named registers |
| `"A-Z` | n | Append to named registers |
| `"+` | n | System clipboard |
| `"*` | n | Primary selection |
| `"/` | n | Last search pattern |
| `":` | n | Last command |
| `".` | n | Last inserted text |
| `"%` | n | Current file name |
| `"#` | n | Alternate file name |
| `"_` | n | Black hole register |
| `"=` | n | Expression register |
| `:reg` | n | Show all registers |

---

## Miscellaneous

### Undo/Redo
| Key | Mode | Action |
|-----|------|--------|
| `u` | n | Undo |
| `<C-r>` | n | Redo |
| `U` | n | Undo all changes on line |
| `.` | n | Repeat last change |
| `g-` | n | Go to older text state |
| `g+` | n | Go to newer text state |

### File Operations
| Key | Mode | Action |
|-----|------|--------|
| `:w` | n | Write (save) file |
| `:q` | n | Quit |
| `:wq` / `ZZ` | n | Write and quit |
| `:q!` / `ZQ` | n | Quit without saving |
| `:e {file}` | n | Edit file |
| `:r {file}` | n | Read file into buffer |
| `<C-g>` | n | Show file info |
| `g<C-g>` | n | Show detailed file info |

### Misc
| Key | Mode | Action |
|-----|------|--------|
| `J` | n | Join lines |
| `gJ` | n | Join lines without space |
| `K` | n | Look up keyword |
| `~` | n | Toggle case and move |
| `<C-a>` | n | Increment number |
| `<C-x>` | n | Decrement number |
| `g<C-a>` | v | Increment numbers sequentially |
| `g<C-x>` | v | Decrement numbers sequentially |
| `ga` | n | Show ASCII value of character |
| `g8` | n | Show UTF-8 bytes of character |
| `gf` | n | Go to file under cursor |
| `gF` | n | Go to file:line under cursor |
| `<C-^>` | n | Edit alternate file |
| `<C-l>` | n | Redraw screen |
| `<C-z>` | n | Suspend Vim |
| `!{motion}{filter}` | n | Filter through external command |
| `!!{filter}` | n | Filter line through external command |
| `:{range}!{filter}` | n | Filter range through external command |

### g-prefix Commands
| Key | Mode | Action |
|-----|------|--------|
| `gn` | n | Search forward and select match |
| `gN` | n | Search backward and select match |
| `g&` | n | Repeat last `:s` on all lines |
| `g@{motion}` | n | Call 'operatorfunc' |
| `gp` | n | Put and move cursor after |
| `gP` | n | Put before and move cursor after |
| `go` | n | Go to byte offset |
| `gs` | n | Sleep |

### z-prefix Commands (not folds)
| Key | Mode | Action |
|-----|------|--------|
| `z=` | n | Suggest spelling corrections |
| `zg` | n | Add word to spell file |
| `zw` | n | Mark word as wrong |
| `zug` | n | Undo zg |
| `zuw` | n | Undo zw |
| `z<CR>` | n | Cursor line to top, cursor to first non-blank |
| `z.` | n | Center and move cursor to first non-blank |
| `z-` | n | Cursor line to bottom, cursor to first non-blank |

### Bracket Commands
| Key | Mode | Action |
|-----|------|--------|
| `[{` | n | Jump to previous unmatched { |
| `]}` | n | Jump to next unmatched } |
| `[(` | n | Jump to previous unmatched ( |
| `])` | n | Jump to next unmatched ) |
| `[m` | n | Jump to previous method start |
| `]m` | n | Jump to next method start |
| `[M` | n | Jump to previous method end |
| `]M` | n | Jump to next method end |
| `[#` | n | Jump to previous #if/#else/#endif |
| `]#` | n | Jump to next #if/#else/#endif |
| `[*` / `[/` | n | Jump to start of comment |
| `]*` / `]/` | n | Jump to end of comment |

---

## Command-line Mode

| Key | Mode | Action |
|-----|------|--------|
| `:` | n | Enter command-line mode |
| `<C-c>` | c | Cancel command |
| `<C-r>{reg}` | c | Insert register |
| `<C-r><C-w>` | c | Insert word under cursor |
| `<C-r><C-a>` | c | Insert WORD under cursor |
| `<C-b>` | c | Move to beginning |
| `<C-e>` | c | Move to end |
| `<C-w>` | c | Delete word before cursor |
| `<C-u>` | c | Delete to beginning |
| `<Up>` / `<C-p>` | c | Previous command |
| `<Down>` / `<C-n>` | c | Next command |
| `q:` | n | Open command-line window |
| `q/` | n | Open search history window |
| `q?` | n | Open backward search history window |
| `<C-f>` | c | Open command-line window from command line |

---

*Note: `n` = Normal mode, `v` = Visual mode, `i` = Insert mode, `o` = Operator-pending mode, `c` = Command-line mode*
