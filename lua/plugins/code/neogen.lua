return {
  "danymat/neogen",
  config = function()
    require('neogen').setup {}

    vim.keymap.set("n", "<Leader>D", function() require('neogen').generate() end, { desc = "Generate annotation" })

  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  -- require('neogen').setup {
  --   enabled = true,             --if you want to disable Neogen
  --   input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  --   -- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
  -- }
}
