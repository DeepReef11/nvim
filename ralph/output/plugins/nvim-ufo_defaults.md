# nvim-ufo Default Keybindings

**Plugin:** [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
**Description:** Ultra fold plugin for Neovim with LSP/Treesitter support

---

## Important Note

nvim-ufo does **not** create any keybindings by default out of the box. The plugin provides functions that users are expected to map themselves. However, it does provide default mappings within the **preview window** when it is open.

---

## Recommended Keybindings (User Must Define)

These are the recommended mappings from the official documentation. Users must add these to their config:

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `zR` | n | `require('ufo').openAllFolds` | Open all folds (overrides vim default) |
| `zM` | n | `require('ufo').closeAllFolds` | Close all folds (overrides vim default) |
| `zr` | n | `require('ufo').openFoldsExceptKinds` | Open folds except specified kinds |
| `zm` | n | `require('ufo').closeFoldsWith(level)` | Close folds with level <= specified value |

### Navigation Functions (Optional)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `[z` | n | `require('ufo').goPreviousStartFold` | Navigate to previous fold start |
| `]z` | n | `require('ufo').goNextClosedFold` | Navigate to next closed fold |
| `zK` | n | `require('ufo').goPreviousClosedFold` | Navigate to previous closed fold |

### Peek/Preview Functions (Optional)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `zp` | n | `require('ufo').peekFoldedLinesUnderCursor()` | Preview folded lines without opening |
| `zP` | n | `require('ufo').peekFoldedLinesUnderCursor(true)` | Peek and enter preview window |
| `K` | n | Custom function with fallback to LSP hover | Common pattern for peek + hover |

---

## Preview Window Default Mappings

When the preview window is open (via `peekFoldedLinesUnderCursor`), these mappings are **automatically active**:

### Basic Controls

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `q` | n | close | Close the preview window |
| `<Tab>` | n | switch | Toggle between normal buffer and preview window |
| `<CR>` | n | trace | Jump to location under cursor, opens folds if needed |

### Scrolling

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-E>` | n | scrollE | Scroll preview down one line |
| `<C-Y>` | n | scrollY | Scroll preview up one line |

### Mouse Support

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<ScrollWheelUp>` | n | scroll | Scroll preview window up |
| `<ScrollWheelDown>` | n | scroll | Scroll preview window down |
| `<2-LeftMouse>` | n | trace | Same as `<CR>` - jump to location |

---

## Configurable Preview Window Mappings

These mappings have **no default keys assigned** but can be configured in the `preview.mappings` table:

| Mapping Name | Default | Purpose |
|--------------|---------|---------|
| `scrollU` | (none) | Scroll half-page up |
| `scrollD` | (none) | Scroll half-page down |
| `scrollB` | (none) | Scroll full page up |
| `scrollF` | (none) | Scroll full page down |
| `jumpTop` | (none) | Jump to top of preview |
| `jumpBot` | (none) | Jump to bottom of preview |

Example configuration:
```lua
require('ufo').setup({
    preview = {
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
        }
    }
})
```

---

## Standard Vim Fold Commands (Work with nvim-ufo)

These are native Neovim commands that work seamlessly with nvim-ufo:

| Key | Mode | Description |
|-----|------|-------------|
| `za` | n | Toggle fold under cursor |
| `zo` | n | Open fold under cursor |
| `zc` | n | Close fold under cursor |
| `zO` | n | Open all folds under cursor recursively |
| `zC` | n | Close all folds under cursor recursively |
| `zj` | n | Move to next fold |
| `zk` | n | Move to previous fold |
| `[z` | n | Move to start of current open fold |
| `]z` | n | Move to end of current open fold |

---

## Minimal Configuration Example

```lua
-- Required vim options
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Setup ufo
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'lsp', 'indent'}
    end
})

-- Recommended keymaps
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)

-- Optional: Peek with K key
vim.keymap.set('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)
```

---

## Notes

- nvim-ufo saves and restores your existing keymaps when the preview window is opened/closed
- The plugin works with `which-key.nvim` - pressing `z` will show available fold commands
- All modes listed as `n` are Normal mode only

---

*Generated: 2026-01-15*
*Source: [nvim-ufo GitHub Repository](https://github.com/kevinhwang91/nvim-ufo)*
