# Plugin: openscad.nvim

**Source file:** `lua/plugins/editor/openscad.lua`

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Enter>` | n | openscad_cheatsheet_toggle | Toggle OpenSCAD cheatsheet |
| `<A-h>` | n | openscad_help_trig | Show OpenSCAD help |
| `<A-m>` | n | openscad_help_manual_trig | Show OpenSCAD manual help |
| `<A-o>` | n | openscad_exec_openscad_trig | Execute OpenSCAD |
| `<A-c>` | n | openscad_top_toggle | Toggle OpenSCAD top view |

## Notes
- These keybindings are set via global variables (`vim.g.openscad_*`)
- Plugin loads snippets via LuaSnip
- Dependencies: LuaSnip, fzf.vim
