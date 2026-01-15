# lazygit.nvim Default Keybindings

## Overview

lazygit.nvim is a Neovim plugin by kdheepak that provides integration with lazygit, a simple terminal UI for git commands. The plugin opens lazygit in a floating window within Neovim, allowing seamless git operations without leaving the editor.

**Important:** This plugin does NOT set any default keybindings. It provides commands that users must map to their preferred keys.

## Default Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| (none) | - | - | No default keybindings are set by the plugin |

## Available Commands

The plugin provides the following commands that can be mapped to keybindings:

| Command | Description |
|---------|-------------|
| `:LazyGit` | Opens lazygit in a floating window at the current working directory |
| `:LazyGitCurrentFile` | Opens lazygit in the project root of the current file |
| `:LazyGitConfig` | Opens the lazygit configuration file |
| `:LazyGitFilter` | Opens project commits in a floating window (git log view) |
| `:LazyGitFilterCurrentFile` | Opens buffer-specific commits in a floating window |

## Suggested Keybindings

While no defaults are set, the plugin documentation suggests these mappings:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>lg` | n | `:LazyGit<CR>` | Open lazygit (suggested in documentation) |
| `<leader>gg` | n | `:LazyGit<CR>` | Open lazygit (alternative suggestion) |

## Configuration Example (lazy.nvim)

```lua
return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
}
```

## Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| `g:lazygit_floating_window_winblend` | 0 | Transparency of the floating window (0-100) |
| `g:lazygit_floating_window_scaling_factor` | 0.9 | Size of the floating window relative to editor |
| `g:lazygit_floating_window_border_chars` | `['╭','─','╮','│','╯','─','╰','│']` | Border characters for the floating window |
| `g:lazygit_floating_window_use_plenary` | 0 | Use plenary.nvim for floating window if available |
| `g:lazygit_use_neovim_remote` | 1 | Enable neovim-remote integration for commit editing |
| `g:lazygit_use_custom_config_file_path` | 0 | Enable custom config file path |
| `g:lazygit_config_file_path` | '' | Custom lazygit config file path (can be a list) |
| `g:lazygit_on_exit_callback` | nil | Callback function executed when exiting lazygit |

## Inside Lazygit Window

Once lazygit is open, the following vim-like navigation keys work within the lazygit interface itself (these are part of lazygit, not the Neovim plugin):

| Key | Action |
|-----|--------|
| `h/j/k/l` | Navigate between panels |
| `q` | Close lazygit window |
| `C` | Open commit editor (uses neovim-remote if configured) |

## Sources

- [kdheepak/lazygit.nvim GitHub Repository](https://github.com/kdheepak/lazygit.nvim)
