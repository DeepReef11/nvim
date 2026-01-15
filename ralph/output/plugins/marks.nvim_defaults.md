# marks.nvim Default Keybindings

## Overview

marks.nvim is a Neovim plugin that provides a better user experience for viewing and interacting with Vim marks. It displays marks in the sign column, offers enhanced navigation between marks, and introduces a bookmark system with numbered bookmark groups (0-9). The plugin requires Neovim 0.5+ and can be configured to enable/disable default mappings via `default_mappings = true/false`.

**Repository:** [chentoast/marks.nvim](https://github.com/chentoast/marks.nvim)

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `mx` | n | set | Set mark x (where x is any letter a-z or A-Z) |
| `m,` | n | set_next | Set the next available alphabetical (lowercase) mark |
| `m;` | n | toggle | Toggle the next available mark at the current line |
| `dmx` | n | delete | Delete mark x (where x is any letter a-z or A-Z) |
| `dm-` | n | delete_line | Delete all marks on the current line |
| `dm<space>` | n | delete_buf | Delete all marks in the current buffer |
| `m]` | n | next | Move to next mark in buffer |
| `m[` | n | prev | Move to previous mark in buffer |
| `m:` | n | preview | Preview mark (prompts for a specific mark; press `<cr>` to preview next mark) |
| `m0` | n | set_bookmark0 | Add a bookmark from bookmark group 0 |
| `m1` | n | set_bookmark1 | Add a bookmark from bookmark group 1 |
| `m2` | n | set_bookmark2 | Add a bookmark from bookmark group 2 |
| `m3` | n | set_bookmark3 | Add a bookmark from bookmark group 3 |
| `m4` | n | set_bookmark4 | Add a bookmark from bookmark group 4 |
| `m5` | n | set_bookmark5 | Add a bookmark from bookmark group 5 |
| `m6` | n | set_bookmark6 | Add a bookmark from bookmark group 6 |
| `m7` | n | set_bookmark7 | Add a bookmark from bookmark group 7 |
| `m8` | n | set_bookmark8 | Add a bookmark from bookmark group 8 |
| `m9` | n | set_bookmark9 | Add a bookmark from bookmark group 9 |
| `dm0` | n | delete_bookmark0 | Delete all bookmarks from bookmark group 0 |
| `dm1` | n | delete_bookmark1 | Delete all bookmarks from bookmark group 1 |
| `dm2` | n | delete_bookmark2 | Delete all bookmarks from bookmark group 2 |
| `dm3` | n | delete_bookmark3 | Delete all bookmarks from bookmark group 3 |
| `dm4` | n | delete_bookmark4 | Delete all bookmarks from bookmark group 4 |
| `dm5` | n | delete_bookmark5 | Delete all bookmarks from bookmark group 5 |
| `dm6` | n | delete_bookmark6 | Delete all bookmarks from bookmark group 6 |
| `dm7` | n | delete_bookmark7 | Delete all bookmarks from bookmark group 7 |
| `dm8` | n | delete_bookmark8 | Delete all bookmarks from bookmark group 8 |
| `dm9` | n | delete_bookmark9 | Delete all bookmarks from bookmark group 9 |
| `dm=` | n | delete_bookmark | Delete the bookmark under the cursor |
| `m}` | n | next_bookmark | Move to next bookmark of same type (works across buffers) |
| `m{` | n | prev_bookmark | Move to previous bookmark of same type (works across buffers) |

## Commands

| Command | Description |
|---------|-------------|
| `:MarksToggleSigns [buffer]` | Toggle signs globally (optionally for a specific buffer) |
| `:MarksListBuf` | Fill location list with all marks in current buffer |
| `:MarksListGlobal` | Fill location list with all global marks in open buffers |
| `:MarksListAll` | Fill location list with all marks in all open buffers |
| `:BookmarksList group_number` | Fill location list with all bookmarks of specified group |
| `:BookmarksListAll` | Fill location list with all bookmarks across all groups |

## Notes

- All default keybindings operate in **normal mode** only
- Default mappings can be disabled by setting `default_mappings = false` in setup
- Individual keybindings can be customized or disabled via the `mappings` table in configuration
- The plugin also exposes `<Plug>` mappings for vimscript configuration
- Bookmark navigation (`m}` and `m{`) works across buffers, first by line number then by buffer number
