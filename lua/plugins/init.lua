return {
  -- Add subdirectories here
  {
    { import = "plugins.ai" },
    { import = "plugins.languages" },
    { import = "plugins.ui" },
    { import = "plugins.editor" },
    -- { import = "plugins.other" },
    { import = "plugins.util" },
    { import = "plugins.code" },
    -- { import = "plugins.telescope" },
    -- { import = "plugins.file-management" },
  },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │ General plugins                                         │
  -- ╰─────────────────────────────────────────────────────────╯
  { "AndrewRadev/switch.vim", lazy = false },
  -- { "tpope/vim-repeat",       lazy = false }, -- for surround.vim speeddating.vim unimpaired.vim vim-easyclip vim-radical
  -- { "tpope/vim-speeddating",  lazy = false },
  {
    "airblade/vim-rooter",
    event = "VeryLazy",
    config = function()
      vim.g.rooter_patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }
      vim.g.rooter_silent_chdir = 1
      vim.g.rooter_resolve_links = 1
    end,
  },
  {
    "kylechui/nvim-surround",
    enabled = false,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
}
