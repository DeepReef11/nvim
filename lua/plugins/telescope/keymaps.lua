local M = {}

function M.get_all_keymaps()
  local files = require("plugins.telescope.keymaps.find").get_keymaps()
  local search = require("plugins.telescope.keymaps.search").get_keymaps()
  local misc = require("plugins.telescope.keymaps.misc").get_keymaps()

  -- Combine all keymaps
  local all_keymaps = {}

  for _, keymap_table in ipairs({misc, files, search}) do
    for _, keymap in ipairs(keymap_table) do
      table.insert(all_keymaps, keymap)
    end
  end

  return all_keymaps
end

return M
