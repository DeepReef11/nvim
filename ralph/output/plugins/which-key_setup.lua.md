# Plugin File: lua/plugins/which-key/setup.lua

## Overview
This file sets up which-key configuration and defines many leader-key based keybindings organized by groups.

## Which-Key Configuration
- **preset**: helix
- **marks**: enabled (shows marks on ' and `)
- **registers**: enabled (shows registers on " in NORMAL or <C-r> in INSERT)
- **spelling**: enabled with 25 suggestions on z=
- **presets**: operators, motions, windows, nav, z-prefix, g-prefix all enabled

## Keybindings Defined

### Which-Key
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>?` | `require("which-key").show({ global = true })` | Buffer Keymaps (which-key) |

### Mini Surround
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n, v | `gs` | (group) | Surround |

### Single/Window Management
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>=` | `<cmd>vertical resize +5<CR>` | resize +5 |
| n | `<leader>-` | `<cmd>vertical resize -5<CR>` | resize -5 |
| n | `<leader>v` | `<C-W>v` | split right |
| n | `<leader>V` | `<C-W>s` | split below |
| n | `<leader>q` | (desc only) | quicklist |

### Buffer Group (`<leader>b`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>b` | (group) | Buffer |
| n | `<leader>bs` | (group) | Sort |
| n | `<leader>bc` | `require("utils").closeOtherBuffers()` | Close but current |
| n | `<leader>ba` | `<cmd>edit ~/.config/nvim/.claude_last_answer.md<CR>` | Claude answer |

### Workspace Group (`<leader>w`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>w` | (group) | Workspace |

### LSP Group (`<leader>c`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n, v | `<leader>c` | (group) | LSP |
| n, v | `<leader>ca` | (desc only) | code quick action |
| n | `<leader>cd` | `<cmd>Trouble diagnostics toggle<CR>` | diagnostics (Trouble) |
| n | `<leader>cD` | `<cmd>Telescope diagnostics wrap_results=true<CR>` | workspace diagnostics |
| n, v | `<leader>cf` | (desc only) | format |
| n | `<leader>cl` | (desc only) | line diagnostics |
| n | `<leader>cr` | (desc only) | rename |
| n | `<leader>cR` | (desc only) | structural replace |
| n | `<leader>ct` | `<cmd>LspToggleAutoFormat<CR>` | toggle format on save |

### Debug Group (`<leader>d`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>d` | (group) | Debug |
| n | `<leader>da` | (desc only) | attach |
| n | `<leader>db` | (desc only) | breakpoint |
| n | `<leader>dc` | (desc only) | close UI |
| n | `<leader>dd` | (desc only) | continue |
| n | `<leader>dh` | (desc only) | visual hover |
| n | `<leader>di` | (desc only) | step into |
| n | `<leader>do` | (desc only) | step over |
| n | `<leader>dO` | (desc only) | step out |
| n | `<leader>dr` | (desc only) | repl |
| n | `<leader>ds` | (desc only) | scopes |
| n | `<leader>dt` | (desc only) | terminate |
| n | `<leader>dU` | (desc only) | open UI |
| n | `<leader>dv` | (desc only) | log variable |
| n | `<leader>dV` | (desc only) | log variable above |
| n | `<leader>dw` | (desc only) | watches |

### Git Group (`<leader>g`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n, v | `<leader>g` | (group) | Git |
| n, v | `<leader>gg` | (group) | neoGit |
| n | `<leader>ga` | `<cmd>!git add %:p<CR>` | add current |
| n | `<leader>gA` | `<cmd>!git add .<CR>` | add all |
| n | `<leader>gb` | `<cmd>BlameToggle window<CR>` | blame |
| n | `<leader>gB` | `<cmd>Telescope git_branches<CR>` | branches |
| n | `<leader>gc` | (group) | Conflict |
| n | `<leader>gh` | (group) | Hunk |
| v | `<leader>ghr` | (desc only) | reset hunk |
| v | `<leader>ghs` | (desc only) | stage hunk |
| n | `<leader>gi` | `<cmd>Octo issue list<CR>` | Issues List |
| n | `<leader>gl` | (group) | Log |
| n | `<leader>glA` | `require('plugins.telescope.other.pickers').my_git_commits()` | commits (Telescope) |
| n | `<leader>gla` | `<cmd>LazyGitFilter<CR>` | commits |
| n | `<leader>glC` | `require('plugins.telescope.pickers').my_git_bcommits()` | buffer commits (Telescope) |
| n | `<leader>glc` | `<cmd>LazyGitFilterCurrentFile<CR>` | buffer commits |
| n | `<leader>gm` | (desc only) | blame line |
| n | `<leader>gp` | `<cmd>Octo pr list<CR>` | Pull Requests List |
| n | `<leader>gs` | `<cmd>Telescope git_status<CR>` | telescope status |
| n | `<leader>gw` | (group) | Worktree |
| n | `<leader>gww` | (desc only) | worktrees |
| n | `<leader>gwc` | (desc only) | create worktree |

### Project Group (`<leader>p`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>p` | (group) | Project |
| n | `<leader>pl` | `require'telescope'.extensions.repo.cached_list{...}` | list |
| n | `<leader>pt` | `<cmd>TodoTrouble<CR>` | todo |

### Refactor Group (`<leader>r`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n, v | `<leader>r` | (group) | Refactor |

### Search Group (`<leader>s`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>s` | (group) | Search |
| n | `<leader>ss` | (group) | Search Symbol |
| n | `<leader>f` | (group) | Find |
| n | `<leader>F` | (group) | Find from outside project |
| v | `<leader>s` | `<cmd>'<,'>sort<CR>` | sort |

### Notification Group (`<leader>n`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>n` | (group) | Notification |

## Buffer-Local Keybindings (Filetype-Specific)

### Markdown (`attach_markdown`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>a` | (group) | Actions |
| n | `<leader>am` | `<cmd>MarkdownPreviewToggle<CR>` | markdown preview |

### TypeScript (`attach_typescript`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>c` | (group) | LSP |
| n | `<leader>ce` | `<cmd>TSC<CR>` | workspace errors (TSC) |
| n | `<leader>cF` | `<cmd>TSToolsFixAll<CR>` | fix all |
| n | `<leader>ci` | `<cmd>TSToolsAddMissingImports<CR>` | import all |
| n | `<leader>co` | `<cmd>TSToolsOrganizeImports<CR>` | organize imports |
| n | `<leader>cs` | `<cmd>TSToolsSortImports<CR>` | sort imports |
| n | `<leader>cu` | `<cmd>TSToolsRemoveUnused<CR>` | remove unused |
| n | `<leader>cR` | `<cmd>TSToolsRenameFile<CR>` | rename file |
| n | `<leader>cF` | `<cmd>TSToolsFileReferences<CR>` | file references |

### NPM/package.json (`attach_npm`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>n` | (group) | NPM |
| n | `<leader>nc` | `require("package-info").change_version()` | change version |
| n | `<leader>nd` | `require("package-info").delete()` | delete package |
| n | `<leader>nh` | `require('package-info').hide()` | hide |
| n | `<leader>ni` | `require("package-info").install()` | install new package |
| n | `<leader>nr` | `require("package-info").reinstall()` | reinstall dependencies |
| n | `<leader>ns` | `require('package-info').show()` | show |
| n | `<leader>nu` | `require("package-info").update()` | update package |

### Zen Mode (`attach_zen`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>z` | `<cmd>ZenMode<CR>` | zen |

### Jest/Testing (`attach_jest`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>j` | (group) | Jest |
| n | `<leader>jf` | `require('neotest').run.run(vim.fn.expand('%'))` | run current file |
| n | `<leader>ji` | `require('neotest').summary.toggle()` | toggle info panel |
| n | `<leader>jj` | `require('neotest').run.run()` | run nearest test |
| n | `<leader>jl` | `require('neotest').run.run_last()` | run last test |
| n | `<leader>jo` | `require('neotest').output.open({ enter = true })` | open test output |
| n | `<leader>js` | `require('neotest').run.stop()` | stop |

### Spectre (`attach_spectre`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<LocalLeader>r` | (desc only) | Replace all |
| n | `<LocalLeader>o` | (desc only) | Show options |
| n | `<LocalLeader>q` | (desc only) | Send all to Quicklist |
| n | `<LocalLeader>v` | (desc only) | Change view mode |

### NvimTree (`attach_nvim_tree`)
| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>=` | `<cmd>NvimTreeResize +5<CR>` | resize +5 |
| n | `<leader>-` | `<cmd>NvimTreeResize -5<CR>` | resize +5 |

## Notes
- Many keybindings are "desc only" meaning they just add descriptions to which-key for mappings defined elsewhere
- The buffer-local functions (`attach_*`) are exported and presumably called from autocmds or after/ftplugin files
- There's a potential conflict with `<leader>cF` in TypeScript (defined twice: fix all and file references)
- There's a potential conflict with `<leader>n` group (Notification vs NPM depending on context)
