local M = {}

-- Function to find project root (where src/content/page exists)
local function find_project_root()
  local current = vim.fn.getcwd()
  local page_path = current .. "/src/content/posts" -- FIXME: Make this configurable from cwd

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

        vim.cmd('startinsert') -- FIXME: Should make prompt go in insert mode
        -- Prompt for title

        vim.ui.input({ prompt = "Enter blog post title: " }, function(title)
          if not title or title == "" then
            vim.notify("Blog post creation cancelled", vim.log.levels.WARN)
            return
          end

          -- Prompt for categories
          -- vim.ui.input({ prompt = "Enter categories (comma separated): ", default = "community" }, function(categories)
          --   if not categories then categories = "community" end

          -- Prompt for tags
          -- vim.ui.input({ prompt = "Enter tags (comma separated): ", default = "technology,community,homestead" }, function(tags)
          --   if not tags then tags = "technology,community,homestead" end

          -- Prompt for author
          vim.ui.input({ prompt = "Enter author name: ", default = "Jonathan" }, function(author)
            if not author then author = "Jonathan" end

            -- Create page entry using the Node.js script
            local cmd = string.format('node %s/create-page.js "%s" "%s" "%s"',
              vim.fn.getcwd(),
              selection.value,
              title,
              -- categories,
              -- tags,
              author)

            local output = vim.fn.system(cmd)

            if vim.v.shell_error == 0 then
              vim.notify("Blog post created successfully", vim.log.levels.INFO)

              -- Extract file path from output
              local file_path = output:match("Files created: ([^,]+)")
              if file_path then
                vim.cmd('edit ' .. file_path)
              else
                -- Fallback to a guessed path based on title
                local slug = title:lower():gsub(" ", "-"):gsub("[^%w-]", "")
                local guessed_path = selection.value .. "/" .. slug .. "/" .. slug .. "-en.md"
                vim.cmd('edit ' .. guessed_path)
              end
            else
              vim.notify("Failed to create page entry: " .. output, vim.log.levels.ERROR)
            end
          end)
        end)
      end)
      --   end)
      -- end)
      return true
    end,
  }):find()
end

-- Command to create a new page entry
vim.api.nvim_create_user_command('PageNew', M.create_page_entry, {})

vim.keymap.set('n', '<leader>pn', M.create_page_entry, {
  desc = "Create new blog post",
  silent = true
})

function M.setup(opts)
  opts = opts or {}
  local keymap = opts.keymap or '<leader>pn' -- default keymap

  vim.keymap.set('n', keymap, M.create_page_entry, {
    desc = "Create new blog post",
    silent = true
  })
end

return M
