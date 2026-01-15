# Plugin: git/diffview.lua

This file defines helper functions for diffview.nvim integration. The actual keybindings using these functions are defined in `git.lua`.

## Functions Defined

| Function | Purpose |
|----------|---------|
| `toggle_file_history()` | Opens diffview file history if not open, closes if open |
| `toggle_status()` | Opens diffview status if not open, closes if open |

## Related Keybindings

These functions are mapped in `git.lua`:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>gd` | n | `toggle_file_history()` | Toggle diff file history |
| `<Leader>gS` | n | `toggle_status()` | Toggle git status (diffview) |

## Notes

- This file contains no direct `vim.keymap.set()` calls
- Functions serve as toggle wrappers around diffview commands
- Uses diffview's internal `lib` module to check/manage view state
