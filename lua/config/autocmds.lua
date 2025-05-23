
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 1000 }) end })
-- Disable diagnostics in node_modules (0 is current buffer only)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })
-- Show `` in specific files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.json" },
  command = "setlocal conceallevel=0" })

-- Attach specific keybindings in which-key for specific filetypes
local present, _ = pcall(require, "which-key")
if not present then return end
local _, pwk = pcall(require, "plugins.which-key.setup")

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md",
  callback = function() pwk.attach_markdown(0) end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "package.json" },
  callback = function() pwk.attach_npm(0) end })
-- vim.api.nvim_create_autocmd("FileType",
--   { pattern = "*",
--     callback = function()
--       if EcoVim.plugins.zen.enabled and vim.bo.filetype ~= "alpha" then
--         pwk.attach_zen(0)
--       end
--     end
--   })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*test.js", "*test.ts", "*test.tsx", "*spec.ts", "*spec.tsx" },
  callback = function() pwk.attach_jest(0) end })
vim.api.nvim_create_autocmd("FileType", { pattern = "spectre_panel",
  callback = function() pwk.attach_spectre(0) end })
-- vim.api.nvim_create_autocmd("FileType", { pattern = "NvimTree",
--   callback = function() pwk.attach_nvim_tree(0) end })

vim.filetype.add({
    extension = {
        mdx = "markdown.mdx"  -- or just "markdown"
    }
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"markdown", "markdown.mdx"},
  callback = function()
    -- Enable line wrap
    vim.wo.wrap = true
    -- Soft wrap at words rather than characters
    vim.wo.linebreak = true
    -- Don't count wrapped lines when moving vertically
    vim.wo.breakindent = true
    -- Optional: Add some indentation to wrapped lines
    vim.wo.breakindentopt = "shift:2"
  end
})



vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*/scroll/*.conf", "*/scroll/config*"},
  callback = function()
    vim.bo.filetype = "i3config"
  end
})
