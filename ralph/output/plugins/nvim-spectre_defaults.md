# nvim-spectre Default Keybindings

nvim-spectre is a search and replace panel for Neovim. Below are the default keybindings that come out of the box with the plugin.

## Panel Navigation & Item Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Tab>` | n | Next query | Navigate to the next input field (search/replace) |
| `<S-Tab>` | n | Previous query | Navigate to the previous input field |
| `dd` | n | Toggle item | Toggle (exclude/include) a search result item |
| `<CR>` | n | Open file | Jump to the file location of the selected result |
| `<leader>rd` | n | Delete line | Remove a result line from the display |

## Replace Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>rc` | n | Replace current | Execute replacement on the current line only |
| `<leader>R` | n | Replace all | Execute replacement on all search results |
| `<leader>c` | n | Replace command | Input a custom replace command |

## Search Options & Toggles

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>o` | n | Show options | Display available search/replace options menu |
| `ti` | n | Toggle ignore case | Toggle case-sensitive/insensitive searching |
| `th` | n | Toggle hidden | Toggle inclusion of hidden files in search |
| `tu` | n | Toggle live update | Toggle automatic search refresh on file write |
| `<leader>v` | n | Change view mode | Toggle between different result display formats |

## Replace Engine Selection

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `trs` | n | Use sed | Switch to sed as the replacement engine |
| `tro` | n | Use oxi | Switch to Rust-based oxi replacement engine |

## Quickfix & Templates

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>q` | n | Send to quickfix | Export all results to the quickfix list |
| `<leader>l` | n | Resume search | Repeat the last search query |
| `<leader>rp` | n | Pick template | Select from predefined search templates |

## Additional Hardcoded Mappings

These mappings are hardcoded by the plugin for proper functionality:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `x` | n | Delete + search | Delete character and trigger search change |
| `p` | n/v | Paste + search | Paste and trigger search change |
| `P` | v | Paste before | Paste before cursor and trigger search change |
| `d` | n | Disabled | Disabled (use `dd` for toggle instead) |
| `d` | v | Toggle checked | Toggle checked items in visual selection |
| `<C-c>` | i | Exit insert | Exit insert mode (Note: use `<Esc>` instead for proper behavior) |
| `o` / `O` | n | Navigate insert | Disabled append operations |
| `u` | n | Undo disabled | Undo is disabled in spectre buffer |
| `yy` | n | Copy line | Copy the current line |
| `?` | n | Show help | Display help information |

## Important Notes

1. **Use `<Esc>` instead of `<C-c>`**: To exit insert mode within Spectre, always use `<Esc>` rather than `<C-c>` to avoid UI issues.

2. **Commit before replacing**: Always commit your files before performing replacements. nvim-spectre does not support undo directly.

3. **Custom mappings**: You can customize all mappings via the `mapping` table in the setup configuration. Each mapping requires a `map` (keybinding), `cmd` (command), and `desc` (description) field.

## Sources

- [nvim-pack/nvim-spectre GitHub Repository](https://github.com/nvim-pack/nvim-spectre)
- [nvim-spectre Getting Started - DeepWiki](https://deepwiki.com/nvim-pack/nvim-spectre/2-getting-started)
