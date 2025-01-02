return {

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader><leader>",
        function()
          require("telescope.builtin").buffers({ sort_lastused = true, sort_mru = true })
        end,
        desc = "  Find existing buffers",
      },

      { "<leader>ff", require("telescope.builtin").find_files, desc = "Search Files" },
      {
        "<leader>Ff",
        function()
          require("telescope.builtin").find_files({ cwd = "~" })
        end,
        desc = "Search Files",
      },
      {
        "<leader>f.",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find . files (including hidden)",
      },
      {
        "<leader>f+",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find . files (including hidden and git ignore)",
      },
      {
        "<leader>F.",
        function()
          require("telescope.builtin").find_files({ cwd = "~", hidden = true })
        end,
        desc = "Find . files (including hidden)",
      },
      { "<leader>ssa", require("telescope.builtin").lsp_document_symbols, desc = "Search Symbols All" },
      { "<leader>ssr", require("telescope.builtin").lsp_references, desc = "Search Symbols References" },
      {
        "<leader>sss",
        function()
          local symbols = { "method", "function" }
          if vim.bo.filetype == "markdown" then
            table.insert(symbols, "string")
          end
          require("telescope.builtin").lsp_document_symbols({ symbols = symbols })
        end,
        desc = "Search Symbols Select functions and methods",
      },
      -- {
      --   "<leader>sst",
      --   function()
      --     require("telescope.builtin").lsp_document_symbols({ symbols = { "string" } })
      --   end,
      --   desc = "Search Title in md (string)" ,
      -- },

      {
        "<leader>ssv",
        function()
          require("telescope.builtin").lsp_document_symbols({ symbols = { "constant", "variable" } })
        end,
        desc = "Search Symbols Variable",
      },
      {
        "<leader>ssc",
        function()
          require("telescope.builtin").lsp_document_symbols({ symbols = { "class" } })
        end,
        desc = "Search Symbols Class",
      },
      {
        "<leader>ssp",
        function()
          require("telescope.builtin").lsp_document_symbols({ symbols = { "property" } })
        end,
        desc = "Search Symbols Property",
      },
      { "<leader>sw", require("telescope.builtin").grep_string, desc = "Search current Word" },
      { "<leader>sd", require("telescope.builtin").diagnostics, desc = "Search Diagnostics" },
      { "<leader>sr", require("telescope.builtin").resume, desc = "Search Resume" },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
