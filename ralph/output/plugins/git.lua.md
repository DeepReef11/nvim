# Git Plugins Keybindings

Source: `lua/plugins/git.lua`

## gitsigns.nvim (lewis6991/gitsigns.nvim)

### Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]h` | n | gs.next_hunk() | Navigate to next hunk (expr, respects diff mode) |
| `[h` | n | gs.prev_hunk() | Navigate to previous hunk (expr, respects diff mode) |

### Actions

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ghs` | n,v | gs.stage_hunk | Stage hunk |
| `<leader>ghr` | n,v | gs.reset_hunk | Reset hunk |
| `<leader>ghS` | n | gs.stage_buffer | Stage entire buffer |
| `<leader>ghu` | n | gs.undo_stage_hunk | Undo stage hunk |
| `<leader>ghR` | n | gs.reset_buffer | Reset entire buffer |
| `<leader>ghp` | n | gs.preview_hunk | Preview hunk |
| `<leader>gm` | n | gs.blame_line{full=true} | Show full blame for line |
| `<leader>ghd` | n | gs.diffthis | Diff this hunk |
| `<leader>ght` | n | gs.toggle_deleted | Toggle deleted lines display |

### Text Object

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `ih` | o,x | select_hunk | Select inside hunk (text object) |

---

## diffview.nvim (sindrets/diffview.nvim)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>gd` | n | toggle_file_history() | Toggle diff file history |
| `<Leader>gS` | n | toggle_status() | Toggle git status |

---

## git-conflict.nvim (akinsho/git-conflict.nvim)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>gcb` | n | GitConflictChooseBoth | Choose both (ours + theirs) |
| `<Leader>gcn` | n | GitConflictNextConflict | Move to next conflict |
| `<Leader>gcc` | n | GitConflictChooseOurs | Choose current (ours) |
| `<Leader>gcp` | n | GitConflictPrevConflict | Move to previous conflict |
| `<Leader>gci` | n | GitConflictChooseTheirs | Choose incoming (theirs) |

---

## git-worktree.nvim (ThePrimeagen/git-worktree.nvim)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>gww` | n | telescope git_worktrees | List and switch worktrees |
| `<Leader>gwc` | n | telescope create_git_worktree | Create new worktree |

---

## lazygit.nvim (kdheepak/lazygit.nvim)

*No keybindings currently active (commented out)*

---

## octo.nvim (pwntester/octo.nvim)

**Note:** These keybindings are filetype-specific (octo buffer) and use `<LocalLeader>`.

### Issue Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<LocalLeader>ic` | n | close_issue | Close issue |
| `<LocalLeader>io` | n | reopen_issue | Reopen issue |
| `<LocalLeader>il` | n | list_issues | List open issues on same repo |
| `R` | n | reload | Reload issue |
| `B` | n | open_in_browser | Open issue in browser |
| `<C-y>` | n | copy_url | Copy URL to clipboard |
| `<LocalLeader>aa` | n | add_assignee | Add assignee |
| `<LocalLeader>ad` | n | remove_assignee | Remove assignee |
| `<LocalLeader>lc` | n | create_label | Create label |
| `<LocalLeader>la` | n | add_label | Add label |
| `<LocalLeader>ld` | n | remove_label | Remove label |
| `<LocalLeader>gi` | n | goto_issue | Navigate to local repo issue |
| `<LocalLeader>ca` | n | add_comment | Add comment |
| `<LocalLeader>cd` | n | delete_comment | Delete comment |
| `]c` | n | next_comment | Go to next comment |
| `[c` | n | prev_comment | Go to previous comment |

### Reactions

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<LocalLeader>rp` | n | react_hooray | Add/remove hooray reaction |
| `<LocalLeader>rh` | n | react_heart | Add/remove heart reaction |
| `<LocalLeader>re` | n | react_eyes | Add/remove eyes reaction |
| `<LocalLeader>r+` | n | react_thumbs_up | Add/remove thumbs up reaction |
| `<LocalLeader>r-` | n | react_thumbs_down | Add/remove thumbs down reaction |
| `<LocalLeader>rr` | n | react_rocket | Add/remove rocket reaction |
| `<LocalLeader>rl` | n | react_laugh | Add/remove laugh reaction |
| `<LocalLeader>rc` | n | react_confused | Add/remove confused reaction |

### Pull Request Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<LocalLeader>po` | n | checkout_pr | Checkout PR |
| `<LocalLeader>pMm` | n | merge_pr | Merge commit PR |
| `<LocalLeader>pMs` | n | squash_and_merge_pr | Squash and merge PR |
| `<LocalLeader>pc` | n | list_commits | List PR commits |
| `<LocalLeader>pf` | n | list_changed_files | List PR changed files |
| `<LocalLeader>pd` | n | show_pr_diff | Show PR diff |
| `<LocalLeader>va` | n | add_reviewer | Add reviewer |
| `<LocalLeader>vd` | n | remove_reviewer | Remove reviewer request |
| `<LocalLeader>pmc` | n | close_issue | Close PR |
| `<LocalLeader>pmo` | n | reopen_issue | Reopen PR |
| `gf` | n | goto_file | Go to file |

### Review Thread Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<LocalLeader>sa` | n | add_suggestion | Add suggestion |
| `]q` | n | select_next_entry | Move to next changed file |
| `[q` | n | select_prev_entry | Move to previous changed file |
| `<C-c>` | n | close_review_tab | Close review tab |
| `]t` | n | next_thread | Move to next thread |
| `[t` | n | prev_thread | Move to previous thread |

### Submit Window Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<LocalLeader>sa` | n | approve_review | Approve review |
| `<LocalLeader>sc` | n | comment_review | Comment review |
| `<LocalLeader>sr` | n | request_changes | Request changes review |
| `<LocalLeader>sx` | n | close_review_tab | Close review tab |

### Review Diff Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<LocalLeader>ca` | n | add_review_comment | Add review comment |
| `<LocalLeader>sa` | n | add_review_suggestion | Add review suggestion |
| `<LocalLeader>e` | n | focus_files | Focus changed file panel |
| `<LocalLeader>b` | n | toggle_files | Hide/show changed files panel |
| `<LocalLeader><space>` | n | toggle_viewed | Toggle viewer viewed state |

### File Panel Mappings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `j` | n | next_entry | Move to next changed file |
| `k` | n | prev_entry | Move to previous changed file |
| `<cr>` | n | select_entry | Show selected changed file diffs |
| `R` | n | refresh_files | Refresh changed files panel |
| `<LocalLeader>f` | n | focus_files | Move focus to changed file panel |

### Which-Key Groups (octo buffer)

| Key | Mode | Description |
|-----|------|-------------|
| `<LocalLeader>a` | n,x | Assignee |
| `<LocalLeader>c` | n,x | Comment |
| `<LocalLeader>g` | n,x | Go To |
| `<LocalLeader>i` | n,x | Issue |
| `<LocalLeader>l` | n,x | Label |
| `<LocalLeader>p` | n,x | Pull Request |
| `<LocalLeader>pr` | n,x | Mark draft as ready |
| `<LocalLeader>ps` | n,x | Status of all checks |
| `<LocalLeader>pm` | n,x | Manage pull request |
| `<LocalLeader>pM` | n,x | Merge |
| `<LocalLeader>r` | n,x | Reaction |
| `<LocalLeader>s` | n,x | Submit |
| `<LocalLeader>t` | n,x | Thread |
| `<LocalLeader>tr` | n,x | Resolve thread |
| `<LocalLeader>tu` | n,x | Unresolve thread |
| `<LocalLeader>v` | n,x | Reviewer |
| `<LocalLeader>R` | n,x | Review |
| `<LocalLeader>Rs` | n,x | Start review |
| `<LocalLeader>Rr` | n,x | Resume |
| `<LocalLeader>Rm` | n,x | Manage Review |
| `<LocalLeader>Rmd` | n,x | Delete pending review |
| `<LocalLeader>Rms` | n,x | Submit review |
| `<LocalLeader>Rmc` | n,x | View pending comments |
| `<LocalLeader>Rmp` | n,x | Pick a commit |

---

## gitlinker.nvim (linrongbin16/gitlinker.nvim)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>gL` | x | GitLink | Get URL for selection |
