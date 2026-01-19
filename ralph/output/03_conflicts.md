# Keybinding Conflicts Report

Generated: 2026-01-15 20:15:58 (Updated: 2026-01-15 - case sensitivity review)

## Summary

| Type | Count |
|------|-------|
| Total unique key+mode combinations | 454 |
| Direct conflicts (different plugin configs) | 6 |
| Shadows (custom overriding defaults) | 30 |
| Removed (false positives due to case) | 6 |

---


## Direct Conflicts

These are keybindings where multiple plugin configurations define the same key in the same mode.



### `<leader>D` (mode: `n`) - Disabled plugin

| Source | File | Description |
|--------|------|-------------|
| neogen.lua:7 | lua/plugins/code/neogen.lua | Generate documentation annotation (neogen) |
| vim-doge.lua:6 | lua/plugins/code/vim-doge.lua | Generate documentation (vim-doge - **disabled**) |

*Note**: vim-doge is disabled (`enabled = false`), so no actual conflict at runtime.

### `<leader>nd` (mode: `n`) - Buffer-local conflict
fixed

| Source | File | Description |
|--------|------|-------------|
| notify.lua:12 | lua/plugins/notify.lua | Notify Dismiss (nvim-notify) - global |
| which-key/setup.lua:258 (package.json buffer) | lua/plugins/which-key/setup.lua | delete package (package-info) - buffer-local |

**Note**: Only conflicts in package.json files where npm keymaps are attached.

### `<leader>ns` (mode: `n`) - Buffer-local conflict
fixed
| Source | File | Description |
|--------|------|-------------|
| telescope/keymaps/misc.lua:10 | lua/plugins/telescope/keymaps/misc.lua | Search Notify (telescope.nvim) - global |
| which-key/setup.lua:262 (package.json buffer) | lua/plugins/which-key/setup.lua | show (package-info) - buffer-local |

**Note**: Only conflicts in package.json files where npm keymaps are attached.

### `H` (mode: `n`) - Real conflict
fixed
| Source | File | Description |
|--------|------|-------------|
| keymappings.lua:148 | lua/config/keymappings.lua | Move to first non-blank character (`^`) |
| bufferline.lua:61 | lua/plugins/ui/bufferline.lua | Bufferline cycle prev buffer |

**Note**: Both define `H` (uppercase). This is a real conflict requiring resolution.

### `gP` (mode: `n`) - Real conflict
fixed
| Source | File | Description |
|--------|------|-------------|
| printer.lua:45 | lua/plugins/code/printer.lua | Print inner word under cursor (printer.nvim) |
| yanky.lua:27 | lua/plugins/yanky.lua | Put yanked text before selection (yanky.nvim) |

**Note**: Both define `gP` (uppercase P). `gp` (lowercase) is only defined in yanky.lua:26 - no conflict there.

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

### High Priority Conflicts (Requires Resolution)

1. **`H` in normal mode**: Both `keymappings.lua:148` (move to first non-blank) and `bufferline.lua:61` (cycle prev buffer) define `H`. One needs to be remapped.

2. **`gP` in normal mode**: Both `printer.lua:45` (print debug) and `yanky.lua:27` (put before) define `gP`. Consider changing printer.nvim keymap in `lua/plugins/code/printer.lua`.

### Low Priority / Intentional Conflicts

3. **`<leader>nd` and `<leader>ns`**: Only conflicts in package.json files. If you rarely edit package.json, this is fine.

4. **`<leader>-` and `<leader>=`**: Intentional buffer-local overrides for nvim-tree - no action needed.

5. **`<leader>D`**: vim-doge is disabled, so no actual conflict.

6. **`q`**: Plugin defaults for specific buffer types - these don't conflict in practice.

### Shadows to Review

- `<Enter>` in normal mode: Your "remove highlights" may prevent CopilotChat/codecompanion message sending in chat buffers
- `gx` in normal mode: Your "open links" overrides codecompanion's "clear chat" in chat buffers
- `gr` in normal mode: Your "go to references" overrides codecompanion's "regenerate" in chat buffers
- `<C-Space>` in insert mode: Multiple completion triggers - ensure only one is active

### Corrections Applied

The original report incorrectly flagged case-insensitive matches as conflicts:
- `<leader>cf` vs `<leader>cF` - different keys
- `<leader>cr` vs `<leader>cR` - different keys
- `<leader>cs` vs `<leader>cS` - different keys
- `<leader>gs` vs `<leader>gS` - different keys
- `gp` vs `gP` - different keys (only `gP` has conflict)
- `h` was reported but actual conflict is on `H` (uppercase)

