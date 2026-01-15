# copilot.lua Default Keybindings

## Plugin Info
- **Plugin**: [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- **Description**: Fully featured & enhanced replacement for copilot.vim with Lua API

## Default Suggestion Keymaps

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<M-l>` | Accept | i | Accept the current suggestion |
| `<M-]>` | Next | i | Navigate to next suggestion |
| `<M-[>` | Previous | i | Navigate to previous suggestion |
| `<C-]>` | Dismiss | i | Dismiss the current suggestion |
| *(disabled)* | Accept Word | i | Accept word by word |
| *(disabled)* | Accept Line | i | Accept line by line |
| *(disabled)* | Toggle Auto Trigger | i | Toggle auto-triggering of suggestions |

Note: `<M-` means Meta/Alt key (Option on Mac)

## Default Panel Keymaps

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `[[` | Jump Previous | n | Jump to previous suggestion in panel |
| `]]` | Jump Next | n | Jump to next suggestion in panel |
| `<CR>` | Accept | n | Accept selected suggestion |
| `gr` | Refresh | n | Refresh suggestions |
| `<M-CR>` | Open Panel | n | Open the Copilot panel |

## NES (Next Edit Suggestion) Keymaps

By default, all NES keymaps are disabled:
- Accept and Goto: disabled
- Accept: disabled
- Dismiss: disabled

## Custom Overrides in This Config

**Note**: The plugin is currently **disabled** (`enabled = false`) in this configuration.

If enabled, the following keymaps would override defaults:

| Default Key | Custom Key | Action |
|-------------|------------|--------|
| `<M-l>` | `<TAB>` | Accept suggestion |
| *(disabled)* | `<C-w>` | Accept word |
| *(disabled)* | `<C-l>` | Accept line |
| `<M-]>` | `<C-j>` | Next suggestion |
| `<M-[>` | `<C-k>` | Previous suggestion |
| `<C-]>` | `<ESC>` | Dismiss suggestion |

Panel is disabled in config (`panel = { enabled = false }`).

## Sources
- [copilot.lua GitHub Repository](https://github.com/zbirenbaum/copilot.lua)
