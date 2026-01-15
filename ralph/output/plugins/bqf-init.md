# nvim-bqf (bqf-init.lua)

## Plugin Info
- **Plugin**: kevinhwang91/nvim-bqf
- **Purpose**: Make Neovim's quickfix window better
- **Load condition**: Filetype `qf` (quickfix)

## Custom Keybindings

*No custom keybindings defined in this configuration file.*

This file only configures the quickfix text formatting function (`qftf`) to display entries with:
- Filename (max 60 chars, with `~` for home directory)
- Line number and column
- Error type indicator
- Error text

The plugin uses its own default keybindings within the quickfix window (see `plugin_defaults:nvim-bqf` for details).
