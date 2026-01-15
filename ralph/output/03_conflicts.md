# Keybinding Conflicts Report

Generated: 2026-01-15 20:15:58

## Summary

| Type | Count |
|------|-------|
| Total unique key+mode combinations | 454 |
| Direct conflicts (different plugin configs) | 12 |
| Shadows (custom overriding defaults) | 30 |

---

## Direct Conflicts

These are keybindings where multiple plugin configurations define the same key in the same mode.

### `<leader>-` (mode: `n`)

| Source | Description |
|--------|-------------|
| which-key/setup.lua | resize -5 |
| which-key/setup.lua (nvim-tree) | resize -5 |

### `<leader>=` (mode: `n`)

| Source | Description |
|--------|-------------|
| which-key/setup.lua | resize +5 |
| which-key/setup.lua (nvim-tree) | resize +5 |

### `<leader>cf` (mode: `n`)

| Source | Description |
|--------|-------------|
| keymappings.lua | LSP Format |
| which-key/setup.lua (typescript) | fix all |

### `<leader>cr` (mode: `n`)

| Source | Description |
|--------|-------------|
| keymappings.lua | LSP Rename |
| which-key/setup.lua (typescript) | rename file |

### `<leader>cs` (mode: `n`)

| Source | Description |
|--------|-------------|
| typescript.lua | Toggle Tailwind CSS classes sort on save (tailwind-sorter.nv |
| which-key/setup.lua (typescript) | sort imports |

### `<leader>d` (mode: `n`)

| Source | Description |
|--------|-------------|
| neogen.lua | Generate documentation annotation (neogen) |
| vim-doge.lua | Generate documentation (vim-doge - disabled plugin) |

### `<leader>gs` (mode: `n`)

| Source | Description |
|--------|-------------|
| git.lua | Toggle git status (diffview.nvim) |
| which-key/setup.lua | telescope status |

### `<leader>nd` (mode: `n`)

| Source | Description |
|--------|-------------|
| notify.lua | Notify Dismiss (nvim-notify) |
| which-key/setup.lua (npm) | delete package |

### `<leader>ns` (mode: `n`)

| Source | Description |
|--------|-------------|
| telescope/keymaps/misc.lua | Search Notify (telescope.nvim) |
| which-key/setup.lua (npm) | show |

### `gp` (mode: `n`)

| Source | Description |
|--------|-------------|
| printer.lua | Print inner word under cursor (printer.nvim) |
| yanky.lua | Put yanked text after selection |
| yanky.lua | Put yanked text before selection |

### `h` (mode: `n`)

| Source | Description |
|--------|-------------|
| keymappings.lua | Move to first non-blank character |
| bufferline.lua | Bufferline cycle prev buffer |

### `q` (mode: `n`)

| Source | Description |
|--------|-------------|
| CopilotChat.nvim | N/A |
| alpha-nvim | N/A |
| codecompanion.nvim (chat buffer) | Stop current request |

---

## Shadows (Custom Config Overriding Plugin Defaults)

These are keybindings where your custom configuration overrides a plugin's default binding.
This is usually intentional, but worth reviewing.

### `<a-cr>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | blink.lua | Accept completion with Alt+Enter (blink.cmp) |
| plugin_default | custom_config | N/A |

### `<c-d>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | tabout.lua | Reverse shift when backwards tabout not possible (tabout.nvi |
| custom | plugins/util/auto-session.lua | Delete session (in session lens picker) |
| plugin_default | plugin_default | N/A |

### `<c-e>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | blink.lua | Hide completion menu (blink.cmp super-tab preset) |
| plugin_default | plugin_default | N/A |

### `<c-h>` (mode: `t`)

| Type | Source | Description |
|------|--------|-------------|
| custom | toggleterm.lua | Switch to left window from terminal (toggleterm.nvim - disab |
| plugin_default | claude-code.nvim | N/A |

### `<c-j>` (mode: `t`)

| Type | Source | Description |
|------|--------|-------------|
| custom | toggleterm.lua | Switch to window below from terminal (toggleterm.nvim - disa |
| plugin_default | claude-code.nvim | N/A |

### `<c-k>` (mode: `t`)

| Type | Source | Description |
|------|--------|-------------|
| custom | toggleterm.lua | Switch to window above from terminal (toggleterm.nvim - disa |
| plugin_default | claude-code.nvim | N/A |

### `<c-l>` (mode: `t`)

| Type | Source | Description |
|------|--------|-------------|
| custom | toggleterm.lua | Switch to right window from terminal (toggleterm.nvim - disa |
| plugin_default | claude-code.nvim | N/A |

### `<c-s>` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | keymappings.lua | LSP show signature (Press twice to focus) |
| plugin_default | codecompanion.nvim (chat buffer) | Send message to LLM (alternative) |

### `<c-s>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | plugins/util/auto-session.lua | Alternate session (in session lens picker) |
| plugin_default | plugin_default | N/A |

### `<c-space>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | keymappings.lua | LSP show suggestion, trigger completion |
| custom | blink.lua | Toggle completion and documentation (blink.cmp) |
| plugin_default | custom_config | N/A |

### `<c-y>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | plugins/util/auto-session.lua | Copy session (in session lens picker) |
| plugin_default | plugin_default | N/A |

### `<cr>` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | keymappings.lua | Remove highlights |
| plugin_default | CopilotChat.nvim | N/A |
| plugin_default | alpha-nvim | N/A |
| plugin_default | codecompanion.nvim (chat buffer) | Send message to LLM |

### `<leader>cc` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | keymappings.lua | Launch Claude in Docker |
| custom | keymappings.lua | Launch Claude in Docker (resume) |
| plugin_default | claude-code.nvim | N/A |

### `<leader>cv` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | typescript.lua | Tailwind CSS values (tw-values.nvim) |
| plugin_default | claude-code.nvim | N/A |

### `<pagedown>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | blink.lua | Scroll documentation down (blink.cmp) |
| plugin_default | custom_config | N/A |

### `<pageup>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | blink.lua | Scroll documentation up (blink.cmp) |
| plugin_default | custom_config | N/A |

### `<s-j>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | blink.lua | Scroll documentation down (blink.cmp) |
| plugin_default | custom_config | N/A |

### `<s-k>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | blink.lua | Scroll documentation up (blink.cmp) |
| plugin_default | custom_config | N/A |

### `<s-tab>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | blink.lua | Navigate completions backward (blink.cmp super-tab preset) |
| custom | tabout.lua | Jump out of brackets/quotes to the left (tabout.nvim) |
| plugin_default | plugin_default | N/A |

### `<tab>` (mode: `i`)

| Type | Source | Description |
|------|--------|-------------|
| custom | blink.lua | Navigate completions or accept (blink.cmp super-tab preset) |
| custom | tabout.lua | Jump out of brackets/quotes to the right (tabout.nvim) |
| plugin_default | plugin_default | N/A |

### `gbc` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | comment.lua | Toggle block comment on current line (Comment.nvim) |
| plugin_default | Comment.nvim | N/A |

### `gca` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | comment.lua | Insert comment at end of line and enter insert mode (Comment |
| plugin_default | Comment.nvim | N/A |

### `gcc` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | comment.lua | Toggle line comment on current line (Comment.nvim) |
| plugin_default | Comment.nvim | N/A |

### `gco` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | comment.lua | Insert comment on next line and enter insert mode (Comment.n |
| custom | comment.lua | Insert comment on previous line and enter insert mode (Comme |
| plugin_default | Comment.nvim | N/A |
| plugin_default | Comment.nvim | N/A |

### `gd` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | telescope/keymaps/misc.lua | Telescope lsp definitions (overrides vim default) |
| plugin_default | CopilotChat.nvim | N/A |
| plugin_default | codecompanion.nvim (chat buffer) | View/debug chat buffer contents |
| plugin_default | codecompanion.nvim (chat buffer) | Access super diff feature |

### `gr` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | keymappings.lua | Go to references (excluding declaration) |
| plugin_default | codecompanion.nvim (chat buffer) | Regenerate last response |
| plugin_default | codecompanion.nvim (chat buffer) | Jump to file under cursor |

### `gs` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | mini.lua | Split or join arguments (mini.splitjoin) |
| plugin_default | CopilotChat.nvim | N/A |
| plugin_default | codecompanion.nvim (chat buffer) | Toggle system prompt on/off |
| plugin_default | codecompanion.nvim (chat buffer) | Show Copilot usage stats |

### `gu` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | text-case.lua | Text-case prefix (text-case.nvim) |
| plugin_default | CopilotChat.nvim | N/A |

### `gx` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | keymappings.lua | Open links under cursor in browser |
| plugin_default | codecompanion.nvim (chat buffer) | Clear chat buffer contents |

### `gy` (mode: `n`)

| Type | Source | Description |
|------|--------|-------------|
| custom | keymappings.lua | Go to type definition |
| plugin_default | CopilotChat.nvim | N/A |
| plugin_default | codecompanion.nvim (chat buffer) | Yank last codeblock in chat buffer |

---

## Recommended Actions

### High Priority Conflicts

1. **`h` in normal mode**: Both `keymappings.lua` (move to first non-blank) and `bufferline.lua` (cycle prev buffer) use `H`. Check if the lowercase `h` conflict is intentional.

2. **`<leader>cr` in normal mode**: Conflicts between LSP Rename and TypeScript rename file. Consider using different prefixes.

3. **`<leader>cf` in normal mode**: LSP Format vs TypeScript fix all. Similar prefix issue.

4. **`<leader>gs` in normal mode**: Git status (diffview) vs Telescope status. Consider consolidating git operations.

5. **`<leader>d` in normal mode**: Neogen vs vim-doge (disabled). Since vim-doge is disabled, this should resolve automatically.

6. **`gp` in normal mode**: Printer, yanky put after, and yanky put before all conflict. This needs attention.

### Shadows to Review

- `<Enter>` in normal mode: Your "remove highlights" may prevent CopilotChat/codecompanion message sending
- `gx` in normal mode: Your "open links" may conflict with codecompanion's "clear chat"
- `gr` in normal mode: Your "go to references" may conflict with codecompanion's "regenerate"
- `<C-Space>` in insert mode: Multiple completion triggers - ensure only one is active

