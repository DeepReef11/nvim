return {
  "kkoomen/vim-doge",
  enabled = false,
  config = function()
    -- vim.g.doge_enable_mappings = 0
    vim.keymap.set('n', '<Leader>D', '<Plug>(doge-generate)')
  end
}
