# Neovim Configuration Test Procedure

Generated: 2026-01-19

This document provides a systematic procedure to test the Neovim configuration in this repository.

---

## Pre-Test Setup

### Environment
```bash
# Ensure you're in the nvim config directory
cd /workspace/lua/nvim

# Check Neovim version (requires 0.9+)
nvim --version

# Clean plugin state if needed (optional, for fresh test)
# rm -rf ~/.local/share/nvim/lazy
# rm -rf ~/.local/state/nvim
```

### Start Neovim with this config
```bash
# If this is your main config
nvim

# Or specify explicitly
NVIM_APPNAME=nvim nvim
```

---

## 1. Startup Health Check

### 1.1 Plugin Loading
```vim
:Lazy
```
- [ ] All plugins load without errors
- [ ] No "Failed to load" messages in notifications
- [ ] Startup time is reasonable (check with `:Lazy profile`)

### 1.2 Health Check
```vim
:checkhealth
```
- [ ] No critical errors (warnings are often acceptable)
- [ ] LSP servers are available
- [ ] Treesitter parsers are installed
- [ ] DAP adapters are configured

---

## 2. DAP (Debugger) Testing

### 2.1 DAP Breakpoints Plugin (KNOWN ISSUE)
**Issue from todo.md**: Breakpoints not being saved/restored properly, error messages pop up.

#### Test Steps:
1. Open a Go file or JavaScript/TypeScript file
2. Set a breakpoint: `<Leader>db` or `<Leader>dts`
3. Close and reopen the file
4. Check if breakpoint persists

#### Commands to test:
```vim
" Set breakpoint
<Leader>dts

" Save breakpoints manually
<Leader>dtS

" Load breakpoints manually
<Leader>dtL

" Check DAP log for errors
:lua print(vim.fn.stdpath('cache') .. '/dap.log')
:e <path-from-above>
```

#### Expected vs Actual:
- [ ] Breakpoints save without error
- [ ] Breakpoints restore on file reopen
- [ ] No error popup on save/load

#### If errors occur, document:
- Error message text
- File type being debugged
- Steps to reproduce

### 2.2 DAP UI
```vim
<Leader>du   " Open DAP UI
<Leader>dc   " Close DAP UI
```
- [ ] UI opens correctly with left panel (scopes/breakpoints/watches)
- [ ] UI opens correctly with bottom panel (REPL/console)

### 2.3 Debug Session (requires project with debuggable code)
```vim
<Leader>dd   " Start debug session / continue
<Leader>di   " Step into
<Leader>do   " Step over
<Leader>dO   " Step out
<Leader>dT   " Terminate
```

---

## 3. Plugins to Remove (from todo.md)

Verify these plugins are either removed or disabled:

### 3.1 toggleterm.lua
```vim
:lua print(require('lazy.core.config').plugins['toggleterm.nvim'] and 'LOADED' or 'NOT LOADED')
```
- [ ] Plugin is disabled or removed

### 3.2 codecompanion
```vim
:lua print(require('lazy.core.config').plugins['codecompanion.nvim'] and 'LOADED' or 'NOT LOADED')
```
- [ ] Plugin is disabled or removed

### 3.3 nvim-tree
```vim
:NvimTreeToggle
```
- [ ] Command should not exist or plugin disabled

### 3.4 vim-doge
```vim
:lua print(require('lazy.core.config').plugins['vim-doge'] and require('lazy.core.config').plugins['vim-doge'].enabled or 'DISABLED')
```
- [ ] Plugin is disabled (`enabled = false` in config)

### 3.5 copilot-chat
```vim
:lua print(require('lazy.core.config').plugins['CopilotChat.nvim'] and 'LOADED' or 'NOT LOADED')
```
- [ ] Plugin is disabled or removed

### 3.6 lazygit
```vim
:LazyGit
```
- [ ] Command should not exist or plugin disabled (keybinding already commented out)

---

## 4. Spell Checking (KNOWN ISSUE)

**Issue from todo.md**: Unknown how to show spell suggestions on misspelled words.

### Test Steps:
```vim
" Enable spell checking
:set spell

" Navigate to misspelled word
]s   " Next misspelling
[s   " Previous misspelling

" Try these methods for suggestions:
z=          " Default vim suggestion popup
<C-x>s      " In insert mode, completion suggestions
```

### Potential fixes to try:
```vim
" Check if telescope has spell_suggest
:Telescope spell_suggest

" Check which-key for spell mappings
:WhichKey
" Look for 's' or 'z' prefixes
```

- [ ] Can navigate between misspellings
- [ ] Can view spelling suggestions
- [ ] Can accept a suggestion

---

## 5. Plugin Review Items

### 5.1 Dressing (archived plugin)
**Question**: Can it be replaced by snacks?

```vim
" Test input prompt
:lua vim.ui.input({prompt = 'Test: '}, function(input) print('Got: ' .. (input or 'nil')) end)

" Test select prompt
:lua vim.ui.select({'Option 1', 'Option 2'}, {prompt = 'Choose:'}, function(choice) print('Chose: ' .. (choice or 'nil')) end)
```
- [ ] Dressing intercepts vim.ui.input
- [ ] Dressing intercepts vim.ui.select
- [ ] Document if snacks can replace this

### 5.2 Snacks Usefulness
```vim
:lua print(vim.inspect(require('snacks')))
```
List features being used:
- [ ] Dashboard (alpha alternative?)
- [ ] Notifications
- [ ] Input/Select
- [ ] Other features

### 5.3 nvim-bqf (quickfix)
```vim
" Open quickfix
:copen
" Test bqf features
```
- [ ] Document usage or mark for removal

### 5.4 nvim-scissors (snippets)
```vim
:ScissorsEditSnippet
:ScissorsAddNewSnippet
```
- [ ] Document usage or mark for removal

---

## 6. Feature Request Testing

### 6.1 Matchit for Quotes (%)
**Request**: Use % on quotes like for bracket pairs.

Current behavior:
```vim
" In a file with: "hello world"
" Place cursor on closing quote, press %
```
- [ ] Does % work on quotes currently? (likely NO)

Potential solutions to investigate:
- vim-matchup plugin
- Custom mapping
- Treesitter-based solution

---

## 7. LSP Testing

### 7.1 Basic LSP Functions
Open a TypeScript/JavaScript file:
```vim
gd          " Go to definition
gr          " Go to references
gy          " Go to type definition
K           " Hover documentation
<C-s>       " Signature help
<Leader>ca  " Code actions
<Leader>rn  " Rename symbol
```
- [ ] All LSP functions work

### 7.2 Formatting
```vim
<Leader>cf  " Format file (if configured)
```
- [ ] Formatting works

---

## 8. Git Integration Testing

### 8.1 Gitsigns
```vim
]h          " Next hunk
[h          " Previous hunk
<Leader>ghp " Preview hunk
<Leader>ghs " Stage hunk
<Leader>ghr " Reset hunk
```
- [ ] Hunk navigation works
- [ ] Staging/reset works

### 8.2 Diffview
```vim
<Leader>gd  " Diff file history
<Leader>gS  " Git status
```
- [ ] Diffview opens correctly

### 8.3 Git Worktree
```vim
<Leader>gww " List worktrees
<Leader>gwc " Create worktree
```
- [ ] Worktree functions work

---

## 9. Completion Testing (blink.cmp)

### 9.1 Basic Completion
In insert mode in a code file:
```vim
<Tab>       " Navigate/accept completion
<S-Tab>     " Navigate backwards
<C-Space>   " Trigger completion
<C-e>       " Hide completion
<A-CR>      " Accept with Alt+Enter
```
- [ ] Completion popup appears
- [ ] Can navigate suggestions
- [ ] Can accept suggestions

---

## 10. Telescope Testing

```vim
<Leader>ff  " Find files
<Leader>fg  " Live grep
<Leader>fb  " Buffers
<Leader>fh  " Help tags
```
- [ ] Telescope opens
- [ ] Can search and select

---

## 11. Treesitter Testing

```vim
:TSInstallInfo
```
- [ ] Required parsers are installed
- [ ] Syntax highlighting works
- [ ] Text objects work (e.g., `vaf` for function)

---

## Test Results Summary

| Category | Status | Notes |
|----------|--------|-------|
| Startup | | |
| DAP Breakpoints | KNOWN ISSUE | |
| DAP UI | | |
| Plugin Removal | | |
| Spell Suggestions | KNOWN ISSUE | |
| Dressing/Snacks | REVIEW | |
| Quote Matching | FEATURE REQ | |
| LSP | | |
| Git | | |
| Completion | | |
| Telescope | | |
| Treesitter | | |

---

## Issue Tracking

### Confirmed Issues
1. **DAP Breakpoints**: Error popups, breakpoints not saved
2. **Spell Suggestions**: No clear method to show suggestions

### Plugins to Remove
- [ ] toggleterm.lua
- [ ] codecompanion
- [ ] nvim-tree related configs
- [ ] vim-doge
- [ ] copilot-chat
- [ ] lazygit

### Plugins to Review
- [ ] dressing (archived, can snacks replace?)
- [ ] snacks (is it useful?)
- [ ] nvim-bqf (not used?)
- [ ] nvim-scissors (not used?)

### Feature Requests
- [ ] % for quote matching

---

## Notes for Test Executor

1. Run tests in order - some depend on previous steps
2. Document actual error messages verbatim
3. Note Neovim version and OS
4. If a test fails, try `:messages` to see recent errors
5. Check `:Lazy log` for plugin-related issues
6. DAP issues can be investigated via the DAP log file

---

## Post-Test Actions

After completing tests, create a report in `ralph/TEST_RESULTS.md` with:
1. Date and environment info
2. Pass/fail for each test
3. Detailed notes on failures
4. Recommendations for fixes
