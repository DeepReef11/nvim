# alpha-nvim Default Keybindings

## Overview
alpha-nvim is a fast and fully programmable greeter/dashboard for Neovim. It displays a customizable start screen when opening Neovim without arguments.

## Default Keybindings

**alpha-nvim has minimal built-in keybindings by design.** The plugin is primarily a dashboard display system, and keybindings are meant to be configured through the dashboard buttons/layout.

### Built-in Navigation Keys (when alpha buffer is active)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `j` / `k` | n | Navigate buttons | Move between dashboard buttons |
| `<CR>` | n | Execute button | Execute the selected button action |
| `<Down>` / `<Up>` | n | Navigate buttons | Alternative navigation keys |
| `q` | n | Close alpha | Close the dashboard (if configured) |

### Buffer-Local Behavior

When the alpha dashboard is displayed:
- The buffer is set as `nomodifiable` and `nofile`
- Cursor movements are typically restricted to button areas
- Mouse clicks on buttons trigger their actions

## Common Custom Button Keybindings

Most alpha-nvim configurations create buttons that trigger actions like:

| Button Label | Typical Action | Description |
|--------------|----------------|-------------|
| Find File | `:Telescope find_files` | Open file finder |
| Recent Files | `:Telescope oldfiles` | Show recent files |
| Find Text | `:Telescope live_grep` | Search in files |
| New File | `:ene <BAR> startinsert` | Create new file |
| Config | `:e $MYVIMRC` | Edit Neovim config |
| Lazy | `:Lazy` | Open plugin manager |
| Quit | `:qa` | Quit Neovim |

## Notes

- alpha-nvim's keybindings are entirely user-configurable through the theme/layout setup
- The plugin provides no global keybindings outside the dashboard buffer
- Button shortcuts are defined in the dashboard configuration, not as default plugin keybindings
- The dashboard typically auto-closes when navigating to another buffer

## User's Configuration

Based on the user's `lua/plugins/ui/alpha.lua`, custom buttons and their keybindings are configured in the dashboard setup. Refer to `alpha.lua.md` for the specific button configuration.
