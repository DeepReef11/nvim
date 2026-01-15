# Plugin: neogen.lua

**Plugin:** danymat/neogen
**Source:** lua/plugins/code/neogen.lua

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>D` | n | `:lua require('neogen').generate()<CR>` | Generate documentation annotation |

## Notes

- Neogen is a documentation generator that creates annotations for functions, classes, etc.
- Uses treesitter to understand code structure
- Default configuration with `input_after_comment = true` (commented out but is default)
