# Plugin: git/worktree.lua

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>gww` | n | `telescope git_worktrees()` | List git worktrees and switch between them |
| `<Leader>gwc` | n | `telescope create_git_worktree()` | Create a new git worktree |

## Telescope Picker Keymaps (within worktree picker)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Enter>` | telescope | switch | Switches to selected worktree |
| `<C-d>` | telescope | delete | Deletes selected worktree |
| `<C-f>` | telescope | toggle force | Toggles forcing of next deletion |

## Notes

- Uses `git-worktree.nvim` plugin with telescope integration
- Has hooks configured for automatic buffer management when switching worktrees
- On worktree switch: closes other buffers and reloads current buffer
