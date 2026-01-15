# Plugin File: lua/plugins/mini.lua

## Overview
This file configures multiple mini.nvim plugins from echasnovski's collection.

## Configured Plugins
- **mini.align** - Alignment plugin
- **mini.ai** - Extended text objects
- **mini.nvim** (main bundle containing):
  - mini.move
  - mini.splitjoin
  - mini.surround
  - mini.misc
  - mini.indentscope
  - mini.animate

## Keybindings

### mini.move (Visual Mode)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<M-Up>` | x | `MiniMove.move_selection("up")` | Move selection up |
| `<M-Down>` | x | `MiniMove.move_selection("down")` | Move selection down |
| `<M-Left>` | x | `MiniMove.move_selection("left")` | Move selection left |
| `<M-Right>` | x | `MiniMove.move_selection("right")` | Move selection right |

### mini.move (Normal Mode)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<M-Up>` | n | `MiniMove.move_line("up")` | Move line up |
| `<M-Down>` | n | `MiniMove.move_line("down")` | Move line down |
| `<M-Left>` | n | `MiniMove.move_line("left")` | Move line left (decrease indent) |
| `<M-Right>` | n | `MiniMove.move_line("right")` | Move line right (increase indent) |

### mini.splitjoin
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gS` | n | split/join | Split or join arguments (default mapping) |

### mini.surround
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gsa` | n,v | Add surrounding | Add surrounding in Normal and Visual modes |
| `gsd` | n | Delete surrounding | Delete surrounding |
| `gsf` | n | Find surrounding | Find surrounding (to the right) |
| `gsF` | n | Find surrounding | Find surrounding (to the left) |
| `gsh` | n | Highlight surrounding | Highlight surrounding |
| `gsr` | n | Replace surrounding | Replace surrounding |
| `gsn` | n | Update n_lines | Update `n_lines` setting |

### mini.indentscope (Text Objects & Motions)
| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `ii` | o,v | object_scope | Select inner indent scope |
| `ai` | o,v | object_scope_with_border | Select indent scope with border |
| `[i` | n | goto_top | Jump to top of indent scope |
| `]i` | n | goto_bottom | Jump to bottom of indent scope |

## Notes
- mini.ai adds extended text objects (uses default mappings)
- mini.align uses default mappings (typically `ga` in visual mode)
- mini.misc includes restore_cursor functionality
- mini.animate is enabled for cursor animation only (scroll animation disabled)
- Several modules are commented out: mini.files, mini.sessions, mini.jump, mini.tabline, mini.starter
