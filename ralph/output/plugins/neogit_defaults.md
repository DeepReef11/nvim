# neogit Default Keybindings

## Overview

Neogit is an interactive and powerful Git interface for Neovim, inspired by Magit. It provides a comprehensive status buffer for viewing and managing Git operations, along with various popup menus for specific Git commands like commit, push, pull, rebase, and more. The plugin is developed by NeogitOrg and is designed to offer a Magit-like experience within Neovim.

## Default Keybindings

### Status Buffer - Movement and Basic Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `j` | n | MoveDown | Move cursor down |
| `k` | n | MoveUp | Move cursor up |
| `q` | n | Close | Close the status buffer |
| `o` | n | OpenTree | Open file tree view |
| `I` | n | InitRepo | Initialize a new Git repository |
| `1` | n | Depth1 | Set fold depth to level 1 |
| `2` | n | Depth2 | Set fold depth to level 2 |
| `3` | n | Depth3 | Set fold depth to level 3 |
| `4` | n | Depth4 | Set fold depth to level 4 |
| `Q` | n | Command | Open command prompt |
| `<c-r>` | n | RefreshBuffer | Refresh the status buffer |
| `gp` | n | GoToParentRepo | Navigate to parent repository |

### Status Buffer - Folding

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<tab>` | n | Toggle | Toggle fold under cursor |
| `za` | n | Toggle | Toggle fold under cursor (alternative) |
| `zo` | n | OpenFold | Open fold under cursor |
| `zc` | n | CloseFold | Close fold under cursor |
| `zC` | n | CloseAllFolds | Close all folds |

### Status Buffer - Staging and Unstaging

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `s` | n/v | Stage | Stage file or hunk under cursor |
| `S` | n | StageUnstaged | Stage all unstaged changes |
| `<c-s>` | n | StageAll | Stage all changes (staged and unstaged) |
| `u` | n/v | Unstage | Unstage file or hunk under cursor |
| `U` | n | UnstageStaged | Unstage all staged changes |
| `x` | n/v | Discard | Discard changes under cursor |
| `K` | n | Untrack | Untrack file under cursor |

### Status Buffer - Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<cr>` | n | GoToFile | Go to file under cursor |
| `<s-cr>` | n | PeekFile | Peek file without leaving status buffer |
| `<c-v>` | n | VSplitOpen | Open file in vertical split |
| `<c-x>` | n | SplitOpen | Open file in horizontal split |
| `<c-t>` | n | TabOpen | Open file in new tab |
| `{` | n | GoToPreviousHunkHeader | Jump to previous hunk header |
| `}` | n | GoToNextHunkHeader | Jump to next hunk header |
| `[c` | n | OpenOrScrollUp | Open hunk or scroll up in preview |
| `]c` | n | OpenOrScrollDown | Open hunk or scroll down in preview |
| `<c-k>` | n | PeekUp | Peek at previous item |
| `<c-j>` | n | PeekDown | Peek at next item |
| `<c-n>` | n | GoToNextSection | Jump to next section |
| `<c-p>` | n | GoToPreviousSection | Jump to previous section |

### Status Buffer - Miscellaneous

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `y` | n | ShowRefs | Show references |
| `$` | n | CommandHistory | Show command history |
| `Y` | n/v | YankSelected | Yank selected text/commit hash |

### Popup Menus (from Status Buffer)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `?` | n | HelpPopup | Show help popup with keybindings |
| `A` | n | CherryPickPopup | Open cherry pick menu |
| `b` | n | BranchPopup | Open branch menu |
| `B` | n | BisectPopup | Open bisect menu |
| `c` | n | CommitPopup | Open commit menu |
| `d` | n | DiffPopup | Open diff menu |
| `f` | n | FetchPopup | Open fetch menu |
| `i` | n | IgnorePopup | Open ignore menu |
| `l` | n | LogPopup | Open log menu |
| `L` | n | LogMarginPopup | Open log margin menu |
| `m` | n | MergePopup | Open merge menu |
| `M` | n | RemotePopup | Open remote menu |
| `p` | n | PullPopup | Open pull menu |
| `P` | n | PushPopup | Open push menu |
| `r` | n | RebasePopup | Open rebase menu |
| `t` | n | TagPopup | Open tag menu |
| `v` | n | RevertPopup | Open revert menu |
| `w` | n | WorktreePopup | Open worktree menu |
| `X` | n | ResetPopup | Open reset menu |
| `Z` | n | StashPopup | Open stash menu |

### Commit Editor

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `q` | n | Close | Close commit editor |
| `<c-c><c-c>` | n/i | Submit | Submit the commit message |
| `<c-c><c-k>` | n/i | Abort | Abort the commit |
| `<m-p>` | i | PrevMessage | Load previous commit message |
| `<m-n>` | i | NextMessage | Load next commit message |
| `<m-r>` | i | ResetMessage | Reset to original commit message |

### Rebase Editor

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `p` | n | Pick | Mark commit as pick |
| `r` | n | Reword | Mark commit as reword |
| `e` | n | Edit | Mark commit as edit |
| `s` | n | Squash | Mark commit as squash |
| `f` | n | Fixup | Mark commit as fixup |
| `x` | n | Execute | Mark commit as execute |
| `d` | n | Drop | Mark commit as drop |
| `b` | n | Break | Insert break |
| `q` | n | Close | Close rebase editor |
| `<cr>` | n | OpenCommit | Open commit under cursor |
| `gk` | n/v | MoveUp | Move commit up in rebase order |
| `gj` | n/v | MoveDown | Move commit down in rebase order |
| `<c-c><c-c>` | n | Submit | Submit the rebase |
| `<c-c><c-k>` | n | Abort | Abort the rebase |
| `[c` | n | OpenOrScrollUp | Scroll preview up |
| `]c` | n | OpenOrScrollDown | Scroll preview down |

### Finder/Selection Interface

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<cr>` | i | Select | Select current item |
| `<c-c>` | i | Close | Close finder |
| `<esc>` | i | Close | Close finder (alternative) |
| `<c-n>` | i | Next | Move to next item |
| `<down>` | i | Next | Move to next item (alternative) |
| `<c-p>` | i | Previous | Move to previous item |
| `<up>` | i | Previous | Move to previous item (alternative) |
| `<tab>` | i | InsertCompletion | Insert completion |
| `<space>` | i | MultiselectToggleNext | Toggle selection and move to next |
| `<s-space>` | i | MultiselectTogglePrevious | Toggle selection and move to previous |
| `<c-y>` | i | CopySelection | Copy selected item(s) |

## Mode Legend

- `n` - Normal mode
- `v` - Visual mode
- `i` - Insert mode
- `n/v` - Works in both Normal and Visual modes
- `n/i` - Works in both Normal and Insert modes

## Configuration

All keybindings can be customized through the Neogit setup function:

```lua
require('neogit').setup({
  mappings = {
    status = {
      ["<custom-key>"] = "ActionName",
      -- Set to false to disable a mapping
      ["s"] = false,
    },
    popup = {
      ["<custom-key>"] = "PopupName",
    },
    commit_editor = {
      ["<custom-key>"] = "ActionName",
    },
    rebase_editor = {
      ["<custom-key>"] = "ActionName",
    },
    finder = {
      ["<custom-key>"] = "ActionName",
    },
  },
})
```

## Notes

- Neogit uses different default keys than Magit for Push (`P`) and Pull (`p`). In Magit, Push uses `p/P` and Pull uses `F`.
- The `?` key opens a help popup showing available keybindings in the current context.
- Most status buffer operations work on the item under cursor (file, hunk, or section).
- Visual mode selections allow staging/unstaging/discarding specific lines within hunks.

## Sources

- [NeogitOrg/neogit GitHub Repository](https://github.com/NeogitOrg/neogit)
- [Neogit README Documentation](https://github.com/NeogitOrg/neogit/blob/master/README.md)
