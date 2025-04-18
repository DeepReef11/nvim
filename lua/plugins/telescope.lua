return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "cljoly/telescope-repo.nvim",
    },
    cmd = "Telescope",
    config = function()
      require("plugins.telescope.config").setup()
    end,
    keys = function()
      return require("plugins.telescope.keymaps").get_all_keymaps()
    end,
  },
}


