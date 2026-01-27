-- Markdown-specific gd keybinding to follow file paths
local function follow_markdown_path()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- 1-indexed

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

  -- Try backticks first
  local path = find_backtick_path()

  -- Fallback to <cfile> (vim's built-in file path detection)
  if not path then
    path = vim.fn.expand("<cfile>")
  end

  if not path or path == "" then
    vim.notify("No path found under cursor", vim.log.levels.INFO)
    return
  end

  -- Remove anchor (e.g., #team-decisions)
  path = path:gsub("#.*$", "")

  -- Try different path resolutions
  local cwd = vim.fn.getcwd()
  local buf_dir = vim.fn.expand("%:p:h")

  local paths_to_try = {
    cwd .. "/" .. path,             -- relative to cwd
    buf_dir .. "/" .. path,         -- relative to current buffer
    path,                           -- as-is
    path:gsub("^%./", ""),          -- remove leading ./
  }

  for _, try_path in ipairs(paths_to_try) do
    if vim.fn.filereadable(try_path) == 1 then
      vim.cmd("edit " .. vim.fn.fnameescape(try_path))
      return
    end
  end

  vim.notify("File not found: " .. path, vim.log.levels.WARN)
end

-- Override gd for markdown files
vim.keymap.set("n", "gd", follow_markdown_path, {
  buffer = true,
  desc = "Go to file path under cursor"
})
