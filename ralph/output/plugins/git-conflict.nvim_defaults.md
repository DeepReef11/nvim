# git-conflict.nvim Default Keybindings

## Overview

git-conflict.nvim is a Neovim plugin by akinsho that visualizes and helps resolve merge conflicts directly within Neovim. It highlights conflict markers and provides convenient keybindings to choose between conflicting changes. The plugin creates buffer-local mappings inside conflicted files, ensuring mappings only apply to relevant buffers.

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `co` | n | Choose Ours | Select the current/ours version of the conflict |
| `ct` | n | Choose Theirs | Select the incoming/theirs version of the conflict |
| `cb` | n | Choose Both | Keep both versions of the conflicting changes |
| `c0` | n | Choose None | Remove both versions (delete the conflict entirely) |
| `]x` | n | Next Conflict | Jump to the next conflict marker in the buffer |
| `[x` | n | Previous Conflict | Jump to the previous conflict marker in the buffer |

## Commands

| Command | Description |
|---------|-------------|
| `:GitConflictChooseOurs` | Select current/ours changes |
| `:GitConflictChooseTheirs` | Select incoming/theirs changes |
| `:GitConflictChooseBoth` | Select both versions |
| `:GitConflictChooseNone` | Remove all conflicting changes |
| `:GitConflictNextConflict` | Navigate to next conflict |
| `:GitConflictPrevConflict` | Navigate to previous conflict |
| `:GitConflictListQf` | Populate quickfix list with all conflicts |

## Plug Mappings

For custom mapping configuration, use these `<Plug>` targets:

| Plug Mapping | Action |
|--------------|--------|
| `<Plug>(git-conflict-ours)` | Choose ours |
| `<Plug>(git-conflict-theirs)` | Choose theirs |
| `<Plug>(git-conflict-both)` | Choose both |
| `<Plug>(git-conflict-none)` | Choose none |
| `<Plug>(git-conflict-next-conflict)` | Next conflict |
| `<Plug>(git-conflict-prev-conflict)` | Previous conflict |

## Notes

- All default keybindings are **buffer-local** and only active in buffers containing merge conflicts
- Keybindings operate in **normal mode** only
- To disable default mappings, set `default_mappings = false` in your configuration
- Custom mappings can be configured via the `default_mappings` table in setup

## Sources

- [GitHub Repository](https://github.com/akinsho/git-conflict.nvim)
- [README](https://github.com/akinsho/git-conflict.nvim/blob/main/README.md)
