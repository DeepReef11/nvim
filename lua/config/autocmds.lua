-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 1000 }) end })
-- Disable diagnostics in node_modules (0 is current buffer only)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })
-- Show `` in specific files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.json" },
  command = "setlocal conceallevel=0" })

-- Attach specific keybindings in which-key for specific filetypes
local present, _ = pcall(require, "which-key")
if not present then return end
local _, pwk = pcall(require, "plugins.which-key.setup")

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md",
  callback = function() pwk.attach_markdown(0) end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "package.json" },
  callback = function() pwk.attach_npm(0) end })
-- vim.api.nvim_create_autocmd("FileType",
--   { pattern = "*",
--     callback = function()
--       if EcoVim.plugins.zen.enabled and vim.bo.filetype ~= "alpha" then
--         pwk.attach_zen(0)
--       end
--     end
--   })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*test.js", "*test.ts", "*test.tsx", "*spec.ts", "*spec.tsx" },
  callback = function() pwk.attach_jest(0) end })
vim.api.nvim_create_autocmd("FileType", { pattern = "spectre_panel",
  callback = function() pwk.attach_spectre(0) end })
-- vim.api.nvim_create_autocmd("FileType", { pattern = "NvimTree",
--   callback = function() pwk.attach_nvim_tree(0) end })

vim.filetype.add({
    extension = {
        mdx = "markdown.mdx"  -- or just "markdown"
    }
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"markdown", "markdown.mdx"},
  callback = function()
    -- Enable line wrap
    vim.wo.wrap = true
    -- Soft wrap at words rather than characters
    vim.wo.linebreak = true
    -- Don't count wrapped lines when moving vertically
    vim.wo.breakindent = true
    -- Optional: Add some indentation to wrapped lines
    vim.wo.breakindentopt = "shift:2"
  end
})



vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*/scroll/*.conf", "*/scroll/config*"},
  callback = function()
    vim.bo.filetype = "i3config"
  end
})



-- Configuration: Set your specific virtual environment path here
local specific_venv_path = "/home/jo/venvs/ocp-vscode"

local function is_python_buffer()
  return vim.bo.filetype == "python"
end

local function is_target_venv_active()
  local venv = os.getenv("VIRTUAL_ENV")
  return venv == specific_venv_path
end

local function get_output_path()
  return vim.fn.stdpath("state") .. "/.python_output.txt"
end

local function run_current_script()
  local buf_path = vim.api.nvim_buf_get_name(0)
  if buf_path == "" then
    vim.notify("Save buffer first!", vim.log.levels.WARN)
    return
  end

  -- Ensure state directory exists
  vim.fn.mkdir(vim.fn.stdpath("state"), "p")

  local output_file = get_output_path()
  local python_exec = specific_venv_path .. "/bin/python"
  local start_time = os.time()

  -- Create header with file path and timestamp
  local header = string.format("=== Executed: %s at %s ===\n", 
    buf_path, os.date("%Y-%m-%d %H:%M:%S"))

  -- Write header first
  local file = io.open(output_file, "w")
  if file then
    file:write(header)
    file:close()
  end

  local cmd = string.format(
    "%s %s >> %s 2>&1",
    vim.fn.shellescape(python_exec),
    vim.fn.shellescape(buf_path),
    vim.fn.shellescape(output_file)
  )

  vim.fn.jobstart({"/bin/sh", "-c", cmd}, {
    on_exit = function(_, exit_code)
      local end_time = os.time()
      local duration = end_time - start_time

      -- Append execution info
      local footer = string.format("\n=== Execution time: %ds | Exit code: %d ===\n", 
        duration, exit_code)

      local file = io.open(output_file, "a")
      if file then
        file:write(footer)
        file:close()
      end

      if exit_code ~= 0 then
        vim.notify("Script failed with exit code " .. exit_code, vim.log.levels.ERROR)
      end
    end,
  })
end

-- Setup file watcher for Python buffers
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    if is_python_buffer() and is_target_venv_active() then
      run_current_script()
    end
  end,
  desc = "Auto-run Python script on save within target venv",
})

-- Add both execution and output viewing keybindings
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  pattern = "*.py",
  callback = function()
    if is_python_buffer() and is_target_venv_active() then
      -- Execution binding
      -- vim.keymap.set("n", "<leader>rr", run_current_script, {
      --   buffer = true,
      --   desc = "Run current Python script",
      -- })

      -- Output viewer binding
      vim.keymap.set("n", "<leader>bo", function()
        vim.cmd("edit " .. vim.fn.fnameescape(get_output_path()))
      end, {
        buffer = true,
        desc = "Open Python output buffer",
      })
    end
  end,
})
