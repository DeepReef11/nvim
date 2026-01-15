# auto-session.nvim Default Keybindings

**Plugin:** [rmagatti/auto-session](https://github.com/rmagatti/auto-session)

## Plugin Default Keybindings

auto-session does NOT set any global keybindings by default. Users must configure their own mappings.

### Session-Lens Picker Keybindings (When Picker is Open)

These keybindings are available when the session picker/telescope interface is open:

| Mode | Key | Action |
|------|-----|--------|
| i | `<CR>` | Load the currently highlighted session |
| i | `<C-s>` | Swap to previously opened session (quick switching) |
| i | `<C-d>` | Delete the currently highlighted session |
| i | `<C-y>` | Create a copy of the highlighted session |

## Available Commands

| Command | Description |
|---------|-------------|
| `:AutoSession save` | Save session for current directory |
| `:AutoSession restore` | Restore session for current directory |
| `:AutoSession delete` | Delete session for current directory |
| `:AutoSession search` | Open session picker (Telescope/vim.ui.select) |
| `:AutoSession toggle` | Toggle autosave on/off |
| `:SessionToggleAutoSave` | Toggle autosave on/off |

## User's Custom Configuration

The user has configured the following custom keybindings:

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>wl` | `:AutoSession search<CR>` | Session lens (open session picker) |
| n | `<leader>ws` | `:AutoSession save<CR>` | Save session |
| n | `<leader>wa` | `:SessionToggleAutoSave<CR>` | Toggle autosave |

### Session-Lens Picker Overrides

The user has customized the session-lens picker mappings:

| Mode | Key | Action |
|------|-----|--------|
| i | `<C-D>` | Delete session |
| i | `<C-S>` | Alternate session (swap) |
| i | `<C-Y>` | Copy session |

Note: These are the same as defaults but with uppercase letters (visual difference only, functionally identical).

## Conflicts with User Config

None detected - the user's custom keybindings use the `<leader>w` prefix which doesn't conflict with plugin defaults.
