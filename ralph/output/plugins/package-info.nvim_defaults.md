# package-info.nvim Default Keybindings

**Plugin:** [vuki656/package-info.nvim](https://github.com/vuki656/package-info.nvim)

**Purpose:** Display npm package version information in `package.json` files with virtual text and provide package management commands.

---

## Default Keybindings

**package-info.nvim provides NO default keybindings out of the box.**

The plugin explicitly states: "Plugin has no default Keybindings."

All keybindings must be manually configured by users in their Neovim configuration.

---

## Available Functions for Custom Keybindings

The plugin provides the following Lua functions that can be mapped to custom keybindings:

| Function | Description |
|----------|-------------|
| `require("package-info").show()` | Display latest dependency versions as virtual text |
| `require("package-info").hide()` | Hide dependency versions virtual text |
| `require("package-info").toggle()` | Toggle dependency version display on/off |
| `require("package-info").update()` | Upgrade dependency on current line to latest version |
| `require("package-info").delete()` | Delete dependency on current line |
| `require("package-info").install()` | Install a new dependency (opens prompt) |
| `require("package-info").change_version()` | Install a different version of dependency on current line |
| `require("package-info").get_status()` | Return loading status (useful for statusline integration) |

---

## Recommended Keybinding Setup

The plugin documentation suggests the following keybinding pattern (using `<leader>n` prefix):

| Mode | Keybinding | Action | Function |
|------|------------|--------|----------|
| n | `<leader>ns` | Show versions | `require("package-info").show` |
| n | `<leader>nc` | Hide/Clear versions | `require("package-info").hide` |
| n | `<leader>nt` | Toggle versions | `require("package-info").toggle` |
| n | `<leader>nu` | Update dependency | `require("package-info").update` |
| n | `<leader>nd` | Delete dependency | `require("package-info").delete` |
| n | `<leader>ni` | Install dependency | `require("package-info").install` |
| n | `<leader>np` | Change version (pick) | `require("package-info").change_version` |

### Example Keybinding Configuration

```lua
-- Using vim.keymap.set (Neovim 0.7+)
vim.keymap.set("n", "<leader>ns", require("package-info").show, { silent = true, noremap = true, desc = "Show package versions" })
vim.keymap.set("n", "<leader>nc", require("package-info").hide, { silent = true, noremap = true, desc = "Hide package versions" })
vim.keymap.set("n", "<leader>nt", require("package-info").toggle, { silent = true, noremap = true, desc = "Toggle package versions" })
vim.keymap.set("n", "<leader>nu", require("package-info").update, { silent = true, noremap = true, desc = "Update dependency" })
vim.keymap.set("n", "<leader>nd", require("package-info").delete, { silent = true, noremap = true, desc = "Delete dependency" })
vim.keymap.set("n", "<leader>ni", require("package-info").install, { silent = true, noremap = true, desc = "Install dependency" })
vim.keymap.set("n", "<leader>np", require("package-info").change_version, { silent = true, noremap = true, desc = "Change dependency version" })
```

---

## Telescope Integration

### Command

| Command | Description |
|---------|-------------|
| `:Telescope package_info` | Browse and manage package dependencies via Telescope |

The Telescope extension must be loaded:

```lua
require("telescope").load_extension("package_info")
```

---

## Commands

The plugin does not provide any ex-commands by default. All functionality is accessed through the Lua API functions listed above.

---

## Notes

- All keybindings operate in **Normal mode (n)** only
- Functions like `update`, `delete`, and `change_version` operate on the dependency under the cursor
- The plugin auto-activates when opening `package.json` files (when `autostart = true`)
- Package manager is auto-detected from lock files (`yarn.lock`, `package-lock.json`, `pnpm-lock.yaml`, `bun.lockb`)
