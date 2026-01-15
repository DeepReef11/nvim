# Telescope Config Keymappings

**Source:** `lua/plugins/telescope/config.lua`

This file configures the Telescope plugin's default mappings that apply inside Telescope picker windows.

## Insert Mode (inside Telescope picker)

| Key | Action | Description |
|-----|--------|-------------|
| `<C-c>` | `<esc>` | Exit to normal mode |
| `<C-q>` | `smart_send_to_qflist + open_qflist` | Send results to quickfix and open |
| `<C-s>` | `cycle_previewers_next` | Cycle to next previewer |
| `<C-a>` | `cycle_previewers_prev` | Cycle to previous previewer |
| `<ESC>` | `close` | Close Telescope |
| `<C-k>` | `delete_buffer` | Delete the selected buffer |
| `<C-d>` | `delete_buffer` | Delete the selected buffer (alternative) |
| `<C-Up>` | `preview_scrolling_up` | Scroll preview up |
| `<C-Down>` | `preview_scrolling_down` | Scroll preview down |
| `<C-p>` | `toggle_preview` | Toggle preview window visibility |

## Normal Mode (inside Telescope picker)

| Key | Action | Description |
|-----|--------|-------------|
| `<C-s>` | `cycle_previewers_next` | Cycle to next previewer |
| `<C-a>` | `cycle_previewers_prev` | Cycle to previous previewer |
| `<C-p>` | `toggle_preview` | Toggle preview window visibility |

## Notes

- These keybindings only apply when inside a Telescope picker window
- Some keybindings are commented out (disabled) in the config:
  - `<C-x>` (open in horizontal split)
  - `<C-v>` (open in vertical split)
  - `<C-j>` (move selection next)
  - `<C-l>` (cycle layout)
