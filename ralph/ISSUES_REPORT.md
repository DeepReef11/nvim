# Issues Report - Neovim Configuration

Generated: 2026-01-19

This report documents issues found during testing that could not be fully resolved without removing existing configurations.

---

## Fixed Issues

### 1. DAP Breakpoints Not Saving (FIXED)

**Problem**: The `dap-breakpoints.nvim` plugin was configured with `persistent-breakpoints.nvim` as a dependency, but the dependency's `setup()` function was never called.

**Root Cause**: According to [dap-breakpoints.nvim documentation](https://github.com/Carcuis/dap-breakpoints.nvim), you must call:
```lua
require("persistent-breakpoints").setup()
require("dap-breakpoints").setup()
```
In that order. The config only called the second one.

**Fix Applied**: Modified `lua/plugins/dap.lua` to include the persistent-breakpoints setup:
```lua
dependencies = {
  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })
    end,
  },
  "mfussenegger/nvim-dap",
},
```

**Status**: Fixed - needs testing to verify.

---

## Unresolved Issues

### 2. Spell Suggestion Display

**Problem**: User unsure how to show spell suggestions on misspelled words.

**Analysis**: The configuration already has spell suggestion support through which-key:
- `lua/plugins/which-key/setup.lua` lines 13-15 enable spelling suggestions
- Press `z=` on a misspelled word to see suggestions via which-key popup

**Available Methods**:
1. `z=` - Default vim spell suggestion (enhanced by which-key to show 25 suggestions)
2. `[s` / `]s` - Navigate between misspellings
3. `zg` - Add word to spell dictionary
4. `zw` - Mark word as wrong
5. `zug` / `zuw` - Undo add/wrong

**Potential Enhancement**: Add Telescope spell_suggest picker:
```lua
-- In telescope keymaps
vim.keymap.set("n", "<Leader>ss", "<cmd>Telescope spell_suggest<CR>", { desc = "Spell Suggest" })
```
This would provide a fuzzy-searchable spell suggestion interface.

**Status**: Not a bug - user education needed. Optional enhancement available.

---

### 3. Quote Matching with `%`

**Problem**: User wants `%` to work on quotes (`"`, `'`, backticks) like it does for bracket pairs.

**Analysis**: The standard vim `%` command only works on matching pairs defined in `matchpairs` option. Quotes are not supported because they're identical for open/close.

**Current State**: No plugin for this is currently installed.

**Potential Solutions**:

1. **vim-matchup** plugin (recommended):
   ```lua
   {
     "andymass/vim-matchup",
     event = "BufReadPost",
     config = function()
       vim.g.matchup_matchparen_offscreen = { method = "popup" }
     end,
   }
   ```
   Note: vim-matchup extends `%` but quote matching still requires treesitter integration.

2. **Custom Treesitter-based mapping**:
   ```lua
   -- Using treesitter to find matching quote
   vim.keymap.set("n", "%", function()
     -- Check if on a quote, if so use treesitter to find match
     -- Otherwise use default %
   end)
   ```

3. **mini.pairs or similar**: These plugins handle pair insertion but not navigation.

**Recommendation**: Install vim-matchup with treesitter integration. This provides enhanced `%` functionality including better matching for various constructs.

**Status**: Feature request - requires new plugin installation.

---

### 4. Plugins Marked for Removal (from todo.md)

These plugins are listed for removal but still exist in the config:

| Plugin | File | Current Status |
|--------|------|----------------|
| toggleterm.lua | `lua/plugins/toggleterm.lua` | Still present |
| codecompanion | `lua/plugins/ai/codecompanion.lua` | Still present |
| nvim-tree | N/A | No plugin file found, but references exist in other configs |
| vim-doge | `lua/plugins/code/vim-doge.lua` | Present but `enabled = false` |
| copilot-chat | `lua/plugins/ai/copilot-chat.lua` | Still present |
| lazygit | `lua/plugins/git.lua` (line 241-262) | Keybinding commented out, plugin still loads |

**Action Required**: User should manually remove these files/configs as they have decided they don't need them.

**Status**: Awaiting user action - not modified to preserve existing config per instructions.

---

### 5. Dressing.nvim (Archived Plugin)

**Problem**: Dressing is installed but the plugin is archived (no longer maintained).

**Analysis**:
- Dressing provides enhanced `vim.ui.input` and `vim.ui.select`
- Snacks.nvim is already installed and can provide similar functionality

**Snacks Capabilities Check**:
Looking at the snacks.nvim documentation, it provides:
- `Snacks.input` - Enhanced input
- `Snacks.picker` - Enhanced selection
- `Snacks.notify` - Notifications

**Recommendation**: Test if snacks can fully replace dressing before removing:
1. Disable dressing temporarily
2. Test `vim.ui.input` and `vim.ui.select` calls
3. If snacks handles them well, remove dressing

**Status**: Needs investigation - user should test snacks capabilities.

---

### 6. Unused Plugins (from todo.md)

User mentions not using these plugins:

| Plugin | Purpose | Recommendation |
|--------|---------|----------------|
| nvim-bqf | Enhanced quickfix window | Test with `:copen` - if not using quickfix features, can remove |
| nvim-scissors | Snippet editing | If not using snippet editing features, can remove |

**Status**: User decision needed.

---

## Configuration Recommendations

### High Priority
1. **Test DAP breakpoints fix** - Verify breakpoints now persist across sessions
2. **Remove unused plugins** - Clean up toggleterm, codecompanion, copilot-chat, etc.

### Medium Priority
3. **Add spell suggestion keymap** - `<Leader>ss` for Telescope spell_suggest
4. **Evaluate dressing vs snacks** - Test if snacks can replace dressing

### Low Priority
5. **Quote matching** - Consider adding vim-matchup if quote navigation is important
6. **Review nvim-bqf and nvim-scissors** - Remove if not used

---

## Testing Notes

After applying the DAP breakpoints fix:

1. Open a Go file
2. Set breakpoint with `<Leader>dts`
3. Save file and close Neovim
4. Reopen the file
5. Verify breakpoint is restored
6. Check `:messages` for any errors

If errors persist, check:
- `~/.local/share/nvim/` for breakpoint storage files
- DAP log file for detailed errors

---

## Sources

- [dap-breakpoints.nvim GitHub](https://github.com/Carcuis/dap-breakpoints.nvim)
- [persistent-breakpoints.nvim GitHub](https://github.com/Weissle/persistent-breakpoints.nvim)
- [vim-matchup GitHub](https://github.com/andymass/vim-matchup)
