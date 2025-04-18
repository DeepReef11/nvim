-- local utils = require("plugins.telescope.utils")
local M = {}

function M.get_keymaps()
  -- local builtin = require("telescope.builtin")

  return {

    -- Notify search
    { "<leader>ns",  "<CMD>Telescope notify<CR>",                   desc = "Search Notify" },
  }
end

return M
