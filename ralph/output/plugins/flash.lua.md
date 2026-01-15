# Flash.nvim Keybindings

Plugin: `folke/flash.nvim`
Source file: `lua/plugins/editor/flash.lua`

## Custom Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `s` | n, x, o | `require("flash").jump()` | Flash - jump to any location |
| `S` | n, o, x | `require("flash").treesitter()` | Flash Treesitter - jump using treesitter nodes |
| `r` | o | `require("flash").remote()` | Remote Flash - operate on remote location |
| `R` | o, x | `require("flash").treesitter_search()` | Treesitter Search |
| `<C-s>` | c | `require("flash").toggle()` | Toggle Flash Search in command mode |

## Enhanced Character Motions

The plugin enhances native character motions:
- `f` - Find character forward (with labels)
- `F` - Find character backward (with labels)
- `t` - Till character forward (with labels)
- `T` - Till character backward (with labels)

## Notes

- Flash overrides the default `s` key (substitute) with jump functionality
- The `S` key (substitute line) is overridden with treesitter-based jumping
- Remote Flash (`r`) allows you to operate on text at a distance without moving cursor
- Enhanced f/F/t/T motions add visible labels for quick multi-character jumps
