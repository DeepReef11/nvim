local M = {}

-- Git icons
M.git_icons = {
  added = EcoVim.icons.gitAdd,
  changed = EcoVim.icons.gitChange,
  copied = ">",
  deleted = EcoVim.icons.gitRemove,
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}

-- Helper function to get visual selection
function M.get_visual_selection()
  local current_clipboard_content = vim.fn.getreg('"')
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})
  vim.fn.setreg('"', current_clipboard_content)

  text = string.gsub(text, "\n", "")
  return #text > 0 and text or ''
end

-- Common exclusion patterns for normal searches
M.grep_exclusions_normal = function()
  return {
    "--glob=!repomix-*.txt",
    "--glob=!*.min.js",
    "--glob=!node_modules/*",
    "--glob=!pnpm-lock.yaml",
    "--glob=!*.lock",
    "--glob=!package-lock.json",

  }
end

-- Common exclusion patterns for hidden searches (capital G bindings)
M.grep_exclusions_hidden = function()
  return {
    table.unpack(M.grep_exclusions_normal()),
    "--hidden",
    "--glob=!.git/*"
  }
end

-- No preview theme for faster searches
M.dropdown_theme = require("telescope.themes").get_dropdown({
  winblend = 10,
  previewer = false,
  results_height = 25,
  width = 0.8,
})

return M
