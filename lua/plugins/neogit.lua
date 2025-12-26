return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua",              -- optional
    -- "echasnovski/mini.pick",         -- optional
  },
  config = function()
    require("neogit").setup({
      graph_style = "unicode",
      integrations = {
        telescope = true,
        diffview = true,
      },
      sections = {
        worktrees = {
          folded = true,
          hidden = false,
        },
      },
    })
  end,
  keys = {
    {"<Leader>ggg", "<cmd>Neogit<CR>", desc = "neoGit"},
    {"<Leader>ggc", "<cmd>Neogit commit<CR>", desc = "commit"},
    {"<Leader>ggP", "<cmd>Neogit push<CR>", desc = "Push"},
    {"<Leader>ggp", "<cmd>Neogit pull<CR>", desc = "Pull"},
  }
}
