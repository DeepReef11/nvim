return {
  {
    "kevinhwang91/nvim-ufo",
    -- enabled = false,
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          if filetype == 'c' then
            return '' -- Disable for C
          else
            -- Only use two providers max
            return { 'lsp', 'indent' } -- Main and fallback
            -- Or alternatively
            -- return 'treesitter'  -- Single provider
          end
        end
      })
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end,
  },
}
