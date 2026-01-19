return {
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      -- Improve performance
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      -- Enable treesitter integration for better matching
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_hi_surround_always = 1
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
