local M = {}

-- Function to find project root (where src/content/page exists)
local function find_project_root()
  local current = vim.fn.getcwd()
  local page_path = current .. "/src/content/blog"   -- FIXME: Make this configurable from cwd

  if vim.fn.isdirectory(page_path) == 1 then
    return page_path
  end
  return nil
end

-- Function to get all subdirectories in the page directory
local function get_page_directories()
  local page_root = find_project_root()
  if not page_root then
    return {}
  end

  local dirs = {}
  local handle = vim.loop.fs_scandir(page_root)
  if handle then
    while true do
      local name, type = vim.loop.fs_scandir_next(handle)
      if not name then break end
      if type == 'directory' then
        table.insert(dirs, page_root .. '/' .. name)
      end
    end
  end

  -- Add page root itself as an option
  table.insert(dirs, page_root)
  return dirs
end

-- Function to create new page entry
function M.create_page_entry()
  local dirs = get_page_directories()
  if #dirs == 0 then
    vim.notify("No valid page directory found", vim.log.levels.ERROR)
    return
  end

  -- Use telescope for directory selection
  require('telescope.pickers').new({}, {
    prompt_title = 'Select Directory for page Entry',
    finder = require('telescope.finders').new_table({
      results = dirs,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry:gsub(vim.fn.getcwd() .. "/", ""),
          ordinal = entry,
        }
      end,
    }),
    sorter = require('telescope.sorters').get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      local actions = require('telescope.actions')
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = require('telescope.actions.state').get_selected_entry()

        -- Create page entry using the Node.js script
        local cmd = string.format('node %s/create-page.js "%s"',
          vim.fn.getcwd(),
          selection.value)

        local output = vim.fn.system(cmd)
        -- Even if file exists, we'll open it
        if vim.v.shell_error == 0 then
          -- Notify if file already existed
          if output:match("File already exists") then
            vim.notify("Opening existing page entry", vim.log.levels.WARN)
          end
          -- Open the file
          local date = os.date("%Y_%m_%d")
          local file_path = selection.value .. "/" .. date .. ".md"
          vim.cmd('edit ' .. file_path)
        else
          vim.notify("Failed to create page entry: " .. output, vim.log.levels.ERROR)
        end
      end)
      return true
    end,
  }):find()
end

-- Command to create a new page entry
vim.api.nvim_create_user_command('PageNew', M.create_page_entry, {})

vim.keymap.set('n', '<leader>pn', M.create_page_entry, {
  desc = "Create new page entry",
  silent = true
})
-- Set up keybinding
function M.setup(opts)
  opts = opts or {}
  local keymap = opts.keymap or '<leader>pn'   -- default keymap

  vim.keymap.set('n', keymap, M.create_page_entry, {
    desc = "Create new page entry",
    silent = true
  })
  -- require('which-key').register({
  --     ['<leader>u'] = {
  --         p = { '<cmd>PageNew<CR>', 'Create new page' }
  --     }
  -- })
end

return M
