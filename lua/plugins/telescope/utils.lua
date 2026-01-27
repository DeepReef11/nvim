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
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1  -- 1-indexed for string operations

  -- Find backtick-quoted content at cursor position
  local function find_backtick_path()
    local i = 1
    while i <= #line do
      local start_tick = line:find("`", i)
      if not start_tick then break end
      local end_tick = line:find("`", start_tick + 1)
      if not end_tick then break end
      if col >= start_tick and col <= end_tick then
        return line:sub(start_tick + 1, end_tick - 1)
      end
      i = end_tick + 1
    end
    return nil
  end

  -- Try to get path from backticks first
  local path = find_backtick_path()

  -- If not in backticks, try to get word under cursor that looks like a path
  if not path then
    local word = vim.fn.expand("<cfile>")
    if word and word:match("%.[%w]+") then
      path = word
    end
  end

  if not path or path == "" then
    return false
  end

  -- Remove anchor (e.g., #team-decisions)
  path = path:gsub("#.*$", "")

  -- Try different path resolutions
  local cwd = vim.fn.getcwd()
  local buf_dir = vim.fn.expand("%:p:h")

  local paths_to_try = {
    path,                           -- as-is (relative to cwd)
    cwd .. "/" .. path,             -- relative to cwd (absolute)
    buf_dir .. "/" .. path,         -- relative to current buffer
    path:gsub("^%./", ""),          -- remove leading ./
  }

  for _, try_path in ipairs(paths_to_try) do
    if vim.fn.filereadable(try_path) == 1 then
      vim.cmd("edit " .. vim.fn.fnameescape(try_path))
      return true
    end
  end

  vim.notify("File not found: " .. path, vim.log.levels.WARN)
  return false
end

-- Smart gd: follow markdown paths or use LSP definitions
function M.smart_gd()
  local ft = vim.bo.filetype
  if ft == "markdown" then
    if not M.follow_markdown_path() then
      -- Fallback: no path found, don't call LSP (markdown typically has no LSP definitions)
      vim.notify("No path found under cursor", vim.log.levels.INFO)
    end
  else
    vim.cmd("Telescope lsp_definitions")
  end
end

return M
