# Plugin: linting.lua (nvim-lint)

## Source
`lua/plugins/linting.lua`

## Plugin
- **Name**: mfussenegger/nvim-lint
- **Event**: BufReadPre, BufNewFile

## Keybindings

**No active keybindings defined.**

### Commented Out (Inactive)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>l` | n | `lint.try_lint()` | Lint file (commented out) |

## Notes
- This plugin configures automatic linting for JavaScript, TypeScript, React, Svelte (via eslint_d), and Python (via pylint)
- Linting is triggered automatically on buffer events, not via manual keybinding
- The manual lint keybinding exists but is commented out
