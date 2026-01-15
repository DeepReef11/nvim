# octo.nvim Default Keybindings

> GitHub integration for Neovim - Edit and review GitHub issues and pull requests

**Plugin:** [pwntester/octo.nvim](https://github.com/pwntester/octo.nvim)

**Note:** Default mappings can be disabled with `mappings_disable_default = true` in config.
The `<localleader>` is typically set to `\` or `,` depending on your config.

---

## Issue Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<CR>` | n | Show issue options |
| `<localleader>ic` | n | Close issue |
| `<localleader>io` | n | Reopen issue |
| `<localleader>il` | n | List open issues on same repo |
| `<C-r>` | n | Reload issue |
| `<C-b>` | n | Open issue in browser |
| `<C-y>` | n | Copy URL to system clipboard |
| `<localleader>gi` | n | Navigate to a local repo issue |

---

## Pull Request Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<CR>` | n | Show PR options |
| `<localleader>po` | n | Checkout PR |
| `<localleader>pm` | n | Merge PR |
| `<localleader>psm` | n | Squash and merge PR |
| `<localleader>prm` | n | Rebase and merge PR |
| `<localleader>pq` | n | Merge commit PR and add to merge queue |
| `<localleader>psq` | n | Squash and add to merge queue |
| `<localleader>prq` | n | Rebase and add to merge queue |
| `<localleader>pc` | n | List PR commits |
| `<localleader>pf` | n | List PR changed files |
| `<localleader>pd` | n | Show PR diff |
| `<C-r>` | n | Reload PR |
| `<C-b>` | n | Open PR in browser |
| `<C-y>` | n | Copy URL to system clipboard |
| `gf` | n | Go to file |

---

## Review Mappings

### Starting/Managing Reviews

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<localleader>vs` | n | Start a review for the current PR |
| `<localleader>vr` | n | Resume a pending review for the current PR |
| `<localleader>va` | n | Add reviewer |
| `<localleader>vd` | n | Remove reviewer request / Discard review (context dependent) |

### Review Diff Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<localleader>vs` | n | Submit review |
| `<localleader>vd` | n | Discard review |
| `<localleader>ca` | n, v | Add a new review comment |
| `<localleader>sa` | n, v | Add a new review suggestion |
| `<localleader>e` | n | Move focus to changed file panel |
| `<localleader>b` | n | Hide/show changed files panel |
| `<localleader><space>` | n | Toggle viewer viewed state |
| `gf` | n | Go to file |
| `<C-c>` | n | Close review tab |

### Review Thread Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<localleader>gi` | n | Navigate to a local repo issue |
| `<localleader>ca` | n | Add comment |
| `<localleader>cr` | n | Add reply |
| `<localleader>sa` | n | Add suggestion |
| `<localleader>cd` | n | Delete comment |
| `<localleader>rt` | n | Resolve PR thread |
| `<localleader>rT` | n | Unresolve PR thread |
| `<C-c>` | n | Close review tab |

### Review Submit Window Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-a>` | n, i | Approve review |
| `<C-m>` | n, i | Comment review |
| `<C-r>` | n, i | Request changes review |
| `<C-c>` | n, i | Close review tab |

---

## Comment Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<localleader>ca` | n | Add comment |
| `<localleader>cr` | n | Add reply |
| `<localleader>cd` | n | Delete comment |
| `]c` | n | Go to next comment |
| `[c` | n | Go to previous comment |

---

## Navigation Mappings

### Thread Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `]t` | n | Move to next thread |
| `[t` | n | Move to previous thread |

### Changed File Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `]q` | n | Move to next changed file |
| `[q` | n | Move to previous changed file |
| `]Q` | n | Move to last changed file |
| `[Q` | n | Move to first changed file |
| `]u` | n | Move to next unviewed changed file |
| `[u` | n | Move to previous unviewed changed file |

---

## Label Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<localleader>lc` | n | Create label |
| `<localleader>la` | n | Add label |
| `<localleader>ld` | n | Remove label |

---

## Assignee Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<localleader>aa` | n | Add assignee |
| `<localleader>ad` | n | Remove assignee |

---

## Reaction Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<localleader>rp` | n | Add/remove party reaction |
| `<localleader>rh` | n | Add/remove heart reaction |
| `<localleader>re` | n | Add/remove eyes reaction |
| `<localleader>r+` | n | Add/remove thumbs up reaction |
| `<localleader>r-` | n | Add/remove thumbs down reaction |
| `<localleader>rr` | n | Add/remove rocket reaction |
| `<localleader>rl` | n | Add/remove laugh reaction |
| `<localleader>rc` | n | Add/remove confused reaction |

---

## File Panel Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `j` | n | Move to next changed file |
| `k` | n | Move to previous changed file |
| `<CR>` | n | Show selected changed file diffs |
| `R` | n | Refresh changed files panel |
| `<localleader>e` | n | Move focus to changed file panel |
| `<localleader>b` | n | Hide/show changed files panel |
| `<localleader><space>` | n | Toggle viewer viewed state |
| `<C-c>` | n | Close review tab |

---

## Discussion Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<CR>` | n | Show discussion options |
| `<C-b>` | n | Open discussion in browser |
| `<C-y>` | n | Copy URL to system clipboard |
| `<localleader>ca` | n | Add comment |
| `<localleader>cr` | n | Add reply |
| `<localleader>cd` | n | Delete comment |
| `<localleader>la` | n | Add label |
| `<localleader>ld` | n | Remove label |
| `]c` | n | Go to next comment |
| `[c` | n | Go to previous comment |

---

## Repository Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<CR>` | n | Show repo options |
| `<localleader>ic` | n | Create issue |
| `<localleader>dc` | n | Create discussion |
| `<localleader>cg` | n | View contributing guidelines |
| `<C-b>` | n | Open repo in browser |

---

## Workflow Runs Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `o` | n | Expand workflow step |
| `<C-b>` | n | Open workflow run in browser |
| `<C-r>` | n | Refresh workflow |
| `<C-o>` | n | Rerun workflow |
| `<C-f>` | n | Rerun failed workflow |
| `<C-x>` | n | Cancel workflow |
| `<C-y>` | n | Copy URL to system clipboard |

---

## Notification Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<localleader>nr` | n | Mark notification as read |
| `<localleader>nd` | n | Mark notification as done |
| `<localleader>nu` | n | Unsubscribe from notifications |

---

## Release Mappings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-b>` | n | Open release in browser |

---

## Mode Legend

| Mode | Description |
|------|-------------|
| n | Normal mode |
| v | Visual mode |
| i | Insert mode |

---

## Common Commands

| Command | Description |
|---------|-------------|
| `:Octo issue list` | List issues |
| `:Octo issue create` | Create new issue |
| `:Octo pr list` | List pull requests |
| `:Octo pr create` | Create pull request |
| `:Octo review` | Start/enter review mode |
| `:Octo actions` | List GitHub Actions |
| `:Octo repo view` | View repository |
