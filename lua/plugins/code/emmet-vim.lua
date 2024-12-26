-- Expand html abbreviation,Wrap html tags easy

-- return { 'mattn/emmet-vim' }
return { {
-- enabled = false,
   "mattn/emmet-vim",

  config = function()
    -- vim.g.user_emmet_leader_key = '<C-h>' --Doesnt work
-- let g:user_emmet_leader_key='<C-Z>'
  end,
}, }
