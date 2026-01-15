# Plugin File: lua/plugins/languages/typescript.lua

## Plugins in this file
- `pmizio/typescript-tools.nvim` - TypeScript language support
- `razak17/tailwind-fold.nvim` - Fold long Tailwind classes
- `MaximilianLloyd/tw-values.nvim` - Show Tailwind CSS values
- `laytan/tailwind-sorter.nvim` - Sort Tailwind CSS classes
- `axelvc/template-string.nvim` - Auto-convert to template strings
- `dmmulroy/tsc.nvim` - TypeScript compiler integration
- `dmmulroy/ts-error-translator.nvim` - Translate TypeScript errors

## Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Leader>cv` | n | `<CMD>TWValues<CR>` | Tailwind CSS values (tw-values.nvim) |
| `<Leader>cS` | n | `<CMD>TailwindSortOnSaveToggle<CR>` | Toggle Tailwind CSS classes sort on save (tailwind-sorter.nvim) |

## Notes
- Most plugins in this file do not define custom keybindings
- `typescript-tools.nvim` relies on LSP keybindings defined elsewhere
- `template-string.nvim` works automatically on InsertEnter
- `tailwind-fold.nvim` works automatically on specific filetypes
