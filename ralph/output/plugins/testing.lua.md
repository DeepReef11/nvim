# Plugin: testing.lua

## Plugins Configured
- **nvim-coverage** - Code coverage display
- **neotest** - Test runner framework

## Keybindings Found

### Neotest Summary Panel Mappings (inside neotest summary window)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `a` | summary | attach | Attach to running test |
| `<CR>` | summary | expand | Expand test node |
| `<2-LeftMouse>` | summary | expand | Expand test node (mouse) |
| `e` | summary | expand_all | Expand all test nodes |
| `i` | summary | jumpto | Jump to test file |
| `o` | summary | output | Show test output |
| `r` | summary | run | Run test |
| `O` | summary | short | Short output |
| `u` | summary | stop | Stop running test |

## Notes
- No global keybindings defined in this config file
- The neotest summary mappings only apply within the neotest summary window
- Coverage commands are available via `:Coverage*` commands, no keymaps set
- Users would typically add keybindings for neotest in a separate keymaps file

## Missing Common Neotest Keybindings
This config doesn't define global keybindings for neotest. Typical mappings would include:
- `<leader>tn` - Run nearest test
- `<leader>tf` - Run file tests
- `<leader>ts` - Open summary
- `<leader>to` - Show output
