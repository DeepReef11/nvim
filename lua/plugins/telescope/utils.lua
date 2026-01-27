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

-- Follow path under cursor in markdown files
-- Handles paths like `docs/explanation/synchronization.md#team-decisions`
function M.follow_markdown_path()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  -- Pattern to match paths in backticks or bare paths ending with common extensions
  -- Match: `path/to/file.ext` or `path/to/file.ext#anchor`
  local patterns = {
    "`([^`]+)`",                                    -- backtick-quoted paths
    "%(([^%)]+%.[%w]+)%)",                          -- (path.ext) markdown links
    "([%w_%-./]+%.[%w]+[#%w%-_]*)",                 -- bare paths with extensions
  }

  for _, pattern in ipairs(patterns) do
    for match in line:gmatch(pattern) do
      local start_pos, end_pos = line:find(pattern)
      while start_pos do
        if col >= start_pos - 1 and col <= end_pos - 1 then
          -- Extract path without anchor
          local path = match:gsub("#.*$", "")

          -- Check if file exists relative to current buffer's directory
          local buf_dir = vim.fn.expand("%:p:h")
          local full_path = buf_dir .. "/" .. path

          if vim.fn.filereadable(full_path) == 1 then
            vim.cmd("edit " .. vim.fn.fnameescape(full_path))
            return true
          end

          -- Try relative to cwd
          if vim.fn.filereadable(path) == 1 then
            vim.cmd("edit " .. vim.fn.fnameescape(path))
            return true
          end

          -- Try with ./ prefix removed
          local clean_path = path:gsub("^%./", "")
          if vim.fn.filereadable(clean_path) == 1 then
            vim.cmd("edit " .. vim.fn.fnameescape(clean_path))
            return true
          end

          vim.notify("File not found: " .. path, vim.log.levels.WARN)
          return false
        end
        start_pos, end_pos = line:find(pattern, end_pos + 1)
      end
    end
  end

  return false
end

-- Smart gd: follow markdown paths or use LSP definitions
function M.smart_gd()
  local ft = vim.bo.filetype
  if ft == "markdown" then
    if not M.follow_markdown_path() then
      -- Fallback to LSP if no path found
      vim.cmd("Telescope lsp_definitions")
    end
  else
    vim.cmd("Telescope lsp_definitions")
  end
end

return M
