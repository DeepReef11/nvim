# nvim-scissors Default Keybindings

nvim-scissors is a plugin for automagical editing and creation of snippets in Neovim.

## Popup Window Keymaps

These keybindings are active within the snippet editing popup window.

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `q` | n | Cancel | Cancel editing and close the popup |
| `<CR>` | n | Save | Save changes to the snippet (`:w` also works) |
| `<BS>` | n | Go back | Return to snippet selection/search |
| `<C-BS>` | n | Delete snippet | Delete the current snippet |
| `<C-d>` | n | Duplicate | Duplicate the current snippet |
| `<C-o>` | n | Open in file | Open the snippet in its source file for direct editing |
| `?` | n | Show help | Display a help notification with all keymaps |
| `<C-p>` | n, i | Insert placeholder | Insert the next placeholder (`$1`, `$2`, etc.) in snippet body |

## Navigation

The popup is a single window, so standard Vim motions like `j` and `k` work to move between the prefix area and the snippet body.

## User-Defined Keybindings (Recommended Setup)

The plugin does not set global keybindings by default. Users should define their own mappings to invoke the plugin functions:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>se` | n | Edit snippet | Open picker to select and edit existing snippets |
| `<leader>sa` | n, x | Add snippet | Create a new snippet (visual mode prefills selection as body) |

## Ex Commands

| Command | Description |
|---------|-------------|
| `:ScissorsEditSnippet` | Edit existing snippets via picker |
| `:ScissorsAddNewSnippet` | Add a new snippet (accepts ranges like `:'<,'>`) |

## Configuration

All popup keymaps can be customized via the `editSnippetPopup.keymaps` table in the plugin's setup configuration.

---

**Source:** [nvim-scissors GitHub Repository](https://github.com/chrisgrieser/nvim-scissors)
