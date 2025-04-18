-- local utils = require("plugins.telescope.utils")
local M = {}
-- Search is for current buffer
function M.get_keymaps()
  local builtin = require("telescope.builtin")

  return {


    -- Help and documentation
    { "<leader>sh",  function() builtin.help_tags() end,            desc = "Search Help" },
    { "<leader>sk",  function() builtin.keymaps() end,              desc = "Search Keymaps" },
    { "<leader>st",  function() builtin.builtin() end,              desc = "Search Telescope" },
    { "<leader>sq",  function() builtin.quickfix() end,             desc = "Search Quickfix" },

    -- Symbol search
    { "<leader>ssa", function() builtin.lsp_document_symbols() end, desc = "Search Symbols All" },
    { "<leader>ssr", function() builtin.lsp_references() end,       desc = "Search Symbols References" },
    {
      "<leader>sss",
      function()
        builtin.lsp_document_symbols({ symbols = { "method", "function", "string" } })
      end,
      desc = "Search Symbols Select functions and methods"
    },
    {
      "<leader>ssv",
      function()
        builtin.lsp_document_symbols({ symbols = { "constant", "variable" } })
      end,
      desc = "Search Symbols Variable"
    },
    {
      "<leader>ssc",
      function()
        builtin.lsp_document_symbols({ symbols = { "class" } })
      end,
      desc = "Search Symbols Class"
    },
    {
      "<leader>ssp",
      function()
        builtin.lsp_document_symbols({ symbols = { "property" } })
      end,
      desc = "Search Symbols Property"
    },

    -- Word and selection search
    { "<leader>sw", function() builtin.grep_string() end, desc = "Search current Word" },
    {
      "<leader>sv",
      function()
        local text = vim.getVisualSelection()
        builtin.current_buffer_fuzzy_find({ default_text = text })
      end,
      mode = "v",
      desc = "Search current Selection in Buffer"
    },

    -- Diagnostics and resume
    { "<leader>sd", function() builtin.diagnostics() end, desc = "Search Diagnostics" },
    { "<leader>sr", function() builtin.resume() end,      desc = "Search Resume" },
  }
end

return M
