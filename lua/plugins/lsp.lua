return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },

  {
    "antosha417/nvim-lsp-file-operations",
    event = "LspAttach",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-tree.lua" },
    },
    config = function()
      require("lsp-file-operations").setup()
    end
  },

  {
    "linux-cultist/venv-selector.nvim",
    enabled = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
    ---@type venv-selector.Config
    opts = {
      -- settings = {
      --   search = {
      --     my_venvs = {
      --       command = "find ~/pythonscad -maxdepth 1 -type d -name 'bin'",
      --     }
      --   }
      -- }
    },

    -- config = function()
    --   require('venv-selector').setup({
    --
    --     enable_debug_output = true
    --
    --     --     search_venv_managers = true,
    --     --     search_workspace = false,
    --     --     path = vim.fn.expand("~/pythonscad"), -- Expand tilde
    --   })
    -- end,

  },
}
