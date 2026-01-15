# which-key.nvim Default Keybindings

**Plugin:** [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

which-key.nvim is a popup keybinding discovery plugin. It does not create new keybindings but displays help for existing Neovim keymaps and provides built-in plugins for marks, registers, and spelling.

---

## Popup Window Controls

When the which-key popup is open, these keys are available:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Esc>` | n | Close popup | Cancel and close the which-key popup |
| `<BS>` | n | Go back | Navigate up one level in key hierarchy |
| `<C-d>` | n | Scroll down | Scroll the popup window down |
| `<C-u>` | n | Scroll up | Scroll the popup window up |

---

## Built-in Plugin Triggers

These keys trigger which-key's built-in plugins:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `'` | n | Show marks | Display buffer local and global marks |
| `` ` `` | n | Show marks | Display buffer local and global marks |
| `"` | n | Show registers | Display available registers |
| `<C-r>` | i | Show registers | Display available registers in insert mode |
| `z=` | n | Spelling suggestions | Show spelling correction suggestions |

---

## Preset: Operators

Help text for Neovim operators (Normal and Visual modes):

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `c` | n, v | Change | Delete and enter insert mode |
| `d` | n, v | Delete | Delete text |
| `y` | n, v | Yank | Copy text to register |
| `v` | n | Visual | Enter visual character mode |
| `V` | n | Visual Line | Enter visual line mode |
| `r` | n | Replace | Replace character |
| `<` | n, v | Indent left | Decrease indentation |
| `>` | n, v | Indent right | Increase indentation |
| `!` | n, v | Filter | Run external program on text |
| `~` | n | Toggle case | Switch character case |
| `gu` | n, v | Lowercase | Convert to lowercase |
| `gU` | n, v | Uppercase | Convert to uppercase |
| `g~` | n, v | Toggle case | Toggle text case |
| `gw` | n, v | Format | Format text |
| `zf` | n, v | Create fold | Define a fold |

---

## Preset: Motions

Help text for movement commands (Normal, Operator-pending, Visual modes):

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `h` | n, o, v | Left | Move cursor left |
| `j` | n, o, v | Down | Move cursor down |
| `k` | n, o, v | Up | Move cursor up |
| `l` | n, o, v | Right | Move cursor right |
| `w` | n, o, v | Next word | Move to start of next word |
| `W` | n, o, v | Next WORD | Move to start of next WORD |
| `e` | n, o, v | End of word | Move to end of word |
| `E` | n, o, v | End of WORD | Move to end of WORD |
| `b` | n, o, v | Previous word | Move to start of previous word |
| `B` | n, o, v | Previous WORD | Move to start of previous WORD |
| `ge` | n, o, v | Previous word end | Move to end of previous word |
| `0` | n, o, v | Start of line | Move to first column |
| `^` | n, o, v | First non-blank | Move to first non-whitespace |
| `$` | n, o, v | End of line | Move to end of line |
| `%` | n, o, v | Matching bracket | Jump to matching bracket |
| `f` | n, o, v | Find char | Move to next character |
| `F` | n, o, v | Find char backward | Move to previous character |
| `t` | n, o, v | Till char | Move before next character |
| `T` | n, o, v | Till char backward | Move after previous character |
| `;` | n, o, v | Repeat f/t | Repeat last f/t/F/T forward |
| `,` | n, o, v | Repeat f/t backward | Repeat last f/t/F/T backward |
| `gg` | n, o, v | First line | Go to first line |
| `G` | n, o, v | Last line | Go to last line |
| `{` | n, o, v | Previous paragraph | Move to previous empty line |
| `}` | n, o, v | Next paragraph | Move to next empty line |
| `/` | n, o, v | Search forward | Search forward |
| `?` | n, o, v | Search backward | Search backward |

---

## Preset: Text Objects

Help text for text objects (Operator-pending and Visual modes):

### Around (`a` prefix)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `aw` | o, v | Around word | Select word with whitespace |
| `aW` | o, v | Around WORD | Select WORD with whitespace |
| `as` | o, v | Around sentence | Select sentence |
| `ap` | o, v | Around paragraph | Select paragraph |
| `a"` | o, v | Around quotes | Select quoted string |
| `a'` | o, v | Around quotes | Select single-quoted string |
| `` a` `` | o, v | Around backticks | Select backtick string |
| `a(` / `a)` | o, v | Around parens | Select parentheses block |
| `a[` / `a]` | o, v | Around brackets | Select bracket block |
| `a{` / `a}` | o, v | Around braces | Select brace block |
| `a<` / `a>` | o, v | Around angle brackets | Select angle bracket block |
| `at` | o, v | Around tag | Select HTML/XML tag block |
| `ab` | o, v | Around block | Select block (parens) |
| `aB` | o, v | Around Block | Select Block (braces) |

### Inside (`i` prefix)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `iw` | o, v | Inside word | Select word |
| `iW` | o, v | Inside WORD | Select WORD |
| `is` | o, v | Inside sentence | Select inner sentence |
| `ip` | o, v | Inside paragraph | Select inner paragraph |
| `i"` | o, v | Inside quotes | Select inside quotes |
| `i'` | o, v | Inside quotes | Select inside single quotes |
| `` i` `` | o, v | Inside backticks | Select inside backticks |
| `i(` / `i)` | o, v | Inside parens | Select inside parentheses |
| `i[` / `i]` | o, v | Inside brackets | Select inside brackets |
| `i{` / `i}` | o, v | Inside braces | Select inside braces |
| `i<` / `i>` | o, v | Inside angle brackets | Select inside angle brackets |
| `it` | o, v | Inside tag | Select inside HTML/XML tag |
| `ib` | o, v | Inside block | Select inside block (parens) |
| `iB` | o, v | Inside Block | Select inside Block (braces) |

---

## Preset: Window Commands (`<C-w>`)

Help text for window management (Normal and Visual modes):

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-w>h` | n, v | Go left | Move to window on the left |
| `<C-w>j` | n, v | Go down | Move to window below |
| `<C-w>k` | n, v | Go up | Move to window above |
| `<C-w>l` | n, v | Go right | Move to window on the right |
| `<C-w>w` | n, v | Next window | Cycle to next window |
| `<C-w>W` | n, v | Previous window | Cycle to previous window |
| `<C-w>s` | n, v | Split horizontal | Split window horizontally |
| `<C-w>v` | n, v | Split vertical | Split window vertically |
| `<C-w>q` | n, v | Close window | Close current window |
| `<C-w>c` | n, v | Close window | Close current window |
| `<C-w>o` | n, v | Close others | Close all other windows |
| `<C-w>x` | n, v | Exchange | Exchange with next window |
| `<C-w>H` | n, v | Move far left | Move window to far left |
| `<C-w>J` | n, v | Move far down | Move window to very bottom |
| `<C-w>K` | n, v | Move far up | Move window to very top |
| `<C-w>L` | n, v | Move far right | Move window to far right |
| `<C-w>T` | n, v | Break to tab | Move window to new tab |
| `<C-w>=` | n, v | Equalize | Make all windows equal size |
| `<C-w>+` | n, v | Increase height | Increase window height |
| `<C-w>-` | n, v | Decrease height | Decrease window height |
| `<C-w><` | n, v | Decrease width | Decrease window width |
| `<C-w>>` | n, v | Increase width | Increase window width |
| `<C-w>_` | n, v | Max height | Maximize window height |
| `<C-w>\|` | n, v | Max width | Maximize window width |
| `<C-w>n` | n, v | New window | Create new window |
| `<C-w>p` | n, v | Previous window | Go to previous window |
| `<C-w>r` | n, v | Rotate down | Rotate windows downward |
| `<C-w>R` | n, v | Rotate up | Rotate windows upward |

---

## Preset: Z-Prefix Commands

Help text for folding, scrolling, and spelling (Normal mode):

### Folding

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `za` | n | Toggle fold | Toggle fold under cursor |
| `zA` | n | Toggle all folds | Toggle all folds under cursor |
| `zc` | n | Close fold | Close fold under cursor |
| `zC` | n | Close all folds | Close all folds under cursor |
| `zo` | n | Open fold | Open fold under cursor |
| `zO` | n | Open all folds | Open all folds under cursor |
| `zd` | n | Delete fold | Delete fold under cursor |
| `zD` | n | Delete all folds | Delete all folds recursively |
| `zE` | n | Eliminate folds | Eliminate all folds in window |
| `zf` | n, v | Create fold | Create fold over motion/selection |
| `zM` | n | Close all | Close all folds |
| `zR` | n | Open all | Open all folds |
| `zm` | n | Fold more | Increase fold level |
| `zr` | n | Fold less | Decrease fold level |
| `zn` | n | Fold none | Disable folding |
| `zN` | n | Fold normal | Enable folding |
| `zi` | n | Toggle folding | Toggle fold enable |

### Scrolling

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `zt` | n | Scroll top | Scroll cursor line to top |
| `zz` | n | Scroll center | Scroll cursor line to center |
| `zb` | n | Scroll bottom | Scroll cursor line to bottom |
| `z<CR>` | n | Top + col 1 | Scroll to top, cursor at column 1 |
| `z.` | n | Center + col 1 | Scroll to center, cursor at column 1 |
| `z-` | n | Bottom + col 1 | Scroll to bottom, cursor at column 1 |
| `zH` | n | Scroll left half | Scroll half screen to the left |
| `zL` | n | Scroll right half | Scroll half screen to the right |
| `zh` | n | Scroll left | Scroll screen to the left |
| `zl` | n | Scroll right | Scroll screen to the right |

### Spelling

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `z=` | n | Spelling suggestions | Show spelling suggestions |
| `zg` | n | Add good word | Add word to spell file |
| `zw` | n | Add wrong word | Mark word as misspelled |
| `zug` | n | Undo zg | Remove word from spell file |
| `zuw` | n | Undo zw | Remove word from wrong list |

---

## Preset: G-Prefix Commands

Help text for miscellaneous g-prefixed commands (Normal mode):

### Tab Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gt` | n | Next tab | Go to next tab |
| `gT` | n | Previous tab | Go to previous tab |

### File and Position

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gf` | n | Go to file | Edit file under cursor |
| `gF` | n | Go to file:line | Edit file at line under cursor |
| `gx` | n | Open | Open file/URL with system handler |
| `g;` | n | Previous change | Go to previous change position |
| `g,` | n | Next change | Go to next change position |

### Search and Selection

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gn` | n, o, v | Search select | Select next search match |
| `gN` | n, o, v | Search select backward | Select previous search match |
| `g*` | n | Search word (partial) | Search word under cursor (partial) |
| `g#` | n | Search word backward | Search word backward (partial) |

### Visual Mode

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gv` | n | Reselect visual | Reselect last visual selection |

### Display

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `g0` | n | Display start | Go to start of display line |
| `g$` | n | Display end | Go to end of display line |
| `g^` | n | Display first non-blank | First non-blank of display line |
| `gm` | n | Display middle | Go to middle of display line |
| `gj` | n | Display line down | Move down display line |
| `gk` | n | Display line up | Move up display line |

---

## Preset: Navigation

Additional navigation helpers (Normal mode):

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `H` | n | Window top | Move to top of window |
| `M` | n | Window middle | Move to middle of window |
| `L` | n | Window bottom | Move to bottom of window |
| `]]` | n | Next section | Jump to next section |
| `[[` | n | Previous section | Jump to previous section |
| `][` | n | Next section end | Jump to next section end |
| `[]` | n | Previous section end | Jump to previous section end |
| `]m` | n | Next method start | Jump to next method start |
| `[m` | n | Previous method start | Jump to previous method start |
| `]M` | n | Next method end | Jump to next method end |
| `[M` | n | Previous method end | Jump to previous method end |
| `]s` | n | Next misspelling | Jump to next misspelled word |
| `[s` | n | Previous misspelling | Jump to previous misspelled word |

---

## Mode Legend

| Mode | Description |
|------|-------------|
| `n` | Normal mode |
| `v` | Visual mode |
| `i` | Insert mode |
| `o` | Operator-pending mode |
| `x` | Visual mode (exclusive) |
| `s` | Select mode |
| `t` | Terminal mode |

---

## Notes

- which-key.nvim primarily displays help for **existing** keymaps rather than creating new ones
- The presets provide **descriptions** for built-in Neovim keybindings
- All presets can be enabled/disabled individually in the configuration
- The plugin auto-triggers on prefixes like `<C-w>`, `z`, `g`, `[`, `]`, etc.
- User-defined keymaps with `desc` attribute are automatically picked up by which-key
