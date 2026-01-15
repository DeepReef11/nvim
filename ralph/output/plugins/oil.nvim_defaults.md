# Oil.nvim Default Keybindings

Oil.nvim is a file explorer that lets you edit your filesystem like a normal Neovim buffer. This document covers all default keybindings provided out of the box.

## Navigation

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<CR>` | `actions.select` | n | Open the entry under the cursor (file or directory) |
| `-` | `actions.parent` | n | Navigate to the parent path |
| `_` | `actions.open_cwd` | n | Open oil in Neovim's current working directory |

## Window Management

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<C-s>` | `actions.select` | n | Open the entry in a vertical split |
| `<C-h>` | `actions.select` | n | Open the entry in a horizontal split |
| `<C-t>` | `actions.select` | n | Open the entry in a new tab |
| `<C-p>` | `actions.preview` | n | Toggle preview window for entry under cursor |
| `<C-c>` | `actions.close` | n | Close oil and restore original buffer |

## Directory Operations

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `` ` `` | `actions.cd` | n | `:cd` to the current oil directory |
| `g~` | `actions.cd` | n | `:tcd` to the current oil directory (tab scope) |
| `<C-l>` | `actions.refresh` | n | Refresh current directory list |

## View Options

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `g.` | `actions.toggle_hidden` | n | Toggle hidden files and directories |
| `gs` | `actions.change_sort` | n | Change the sort order |
| `g\` | `actions.toggle_trash` | n | Jump to and from the trash for the current directory |

## External Programs

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `gx` | `actions.open_external` | n | Open the entry under the cursor in an external program |

## Help

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `g?` | `actions.show_help` | n | Show default keymaps |

## Additional Available Actions (Not Bound by Default)

These actions are available but not bound to any key by default. You can add them to your configuration:

| Action | Description |
|--------|-------------|
| `actions.preview_scroll_down` | Scroll down in the preview window |
| `actions.preview_scroll_up` | Scroll up in the preview window |
| `actions.preview_scroll_left` | Scroll left in the preview window |
| `actions.preview_scroll_right` | Scroll right in the preview window |
| `actions.open_terminal` | Open a terminal in the current directory |
| `actions.open_cmdline` | Open vim cmdline with current entry as an argument |
| `actions.yank_entry` | Yank the filepath of the entry under the cursor to a register |
| `actions.copy_to_system_clipboard` | Copy the entry under the cursor to the system clipboard |
| `actions.paste_from_system_clipboard` | Paste the system clipboard into the current oil directory |
| `actions.send_to_qflist` | Send files in the current oil directory to the quickfix list |

## Configuration Notes

- All default keybindings work in **Normal mode** (`n`)
- Default keymaps can be disabled entirely by setting `use_default_keymaps = false`
- Individual keymaps can be overridden or disabled (set to `false`) in the `keymaps` table
- Keymaps support additional options like `{ vertical = true }`, `{ horizontal = true }`, `{ tab = true }`, and `{ scope = "tab" }`

## Example Custom Keymap Configuration

```lua
keymaps = {
  ["g?"] = "actions.show_help",
  ["<CR>"] = "actions.select",
  ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
  ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
  ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },
  ["<C-p>"] = "actions.preview",
  ["<C-c>"] = "actions.close",
  ["<C-l>"] = "actions.refresh",
  ["-"] = "actions.parent",
  ["_"] = "actions.open_cwd",
  ["`"] = "actions.cd",
  ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
  ["gs"] = "actions.change_sort",
  ["gx"] = "actions.open_external",
  ["g."] = "actions.toggle_hidden",
  ["g\\"] = "actions.toggle_trash",
}
```
