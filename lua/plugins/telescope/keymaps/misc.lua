-- local utils = require("plugins.telescope.utils")
local M = {}

function M.get_keymaps()
  -- local builtin = require("telescope.builtin")

  return {

    -- Notify search
    { "<leader>ns", "<CMD>Telescope notify<CR>", desc = "Search Notify" },
    -- Text case telescope (normal mode)
    {
      "<leader>rc",
      "<cmd>TextCaseOpenTelescope<CR>",
      desc = "Refactor case telescope"
    },

    -- Text case telescope (visual mode)
    {
      "<leader>rc",
      "<cmd>TextCaseOpenTelescope<CR>",
      mode = "v",
      desc = "Refactor case telescope"
    },
    {
      "gd",
      -- "<cmd>Telescope lsp_references<CR>",
      "<cmd>Telescope lsp_definitions<CR>",
      desc = "Telescope lsp definitions"
    }
  }
end

return M
