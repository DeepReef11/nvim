local utils = require("plugins.telescope.utils")
local M = {}
-- Find is for files
function M.get_keymaps()
  local builtin = require("telescope.builtin")

  return {

    -- Buffer management
    {
      "<leader><leader>",
      function()
        builtin.buffers({ sort_lastused = true, sort_mru = true })
      end,
      desc = "  Find existing buffers"
    },

    -- Current buffer search
    {
      "<leader>/",
      function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      desc = "Fuzzily search in current buffer"
    },

    -- File search
    {
      "<leader>ff",
      function()
        builtin.find_files({ no_ignore = false

        })
      end,
      desc = "Search Files"
    },
    {
      "<leader>Ff",
      function()
        builtin.find_files({ cwd = "~" })
      end,
      desc = "Search Files in Home"
    },
    {
      "<leader>fF",
      function()
        builtin.find_files({ hidden = true })
      end,
      desc = "Find . files (including hidden)"
    },
    {
      "<leader>f+",
      function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end,
      desc = "Find . files (including hidden and git ignore)"
    },
    {
      "<leader>FF",
      function()
        builtin.find_files({ cwd = "~", hidden = true })
      end,
      desc = "Find . files in Home (including hidden)"
    },
    {
      "<leader>fg",
      function()
        builtin.live_grep({
          additional_args = utils.grep_exclusions_normal
        })
      end,
      desc = "Find by Grep in project files"
    },
    {
      "<leader>f.g",
      function()
        local oil = require('oil')
        local dir = oil.get_current_dir()

        if dir then
          builtin.live_grep({ no_ignore = false, cwd = dir })
        else
          local current_buffer_path = vim.fn.expand("%:p:h")
          builtin.live_grep({
            no_ignore = false,
            cwd = current_buffer_path,
            prompt_title = "Grep in Current Buffer's Directory",
          })
        end
      end,
      desc = "Find by Grep in current buffer's directory"
    },

    {
      "<leader>f.f",
      function()
        local oil = require('oil')
        local dir = oil.get_current_dir()

        if dir then
          builtin.find_files({ no_ignore = false, cwd = dir })
        else
          local current_buffer_path = vim.fn.expand("%:p:h")
          builtin.find_files({ no_ignore = false, cwd = current_buffer_path,
          })
        end
      end,
      desc = "Find file in current buffer's directory"
    },
    {
      "<leader>Fg",
      function()
        builtin.live_grep({
          cwd = "~",
          additional_args = utils.grep_exclusions_normal
        })
      end,
      desc = "Find by Grep in Home"
    },
    {
      "<leader>FG",
      function()
        builtin.live_grep({
          cwd = "~",
          additional_args = utils.grep_exclusions_hidden
        })
      end,
      desc = "Find by Grep in Home including hidden files"
    },
    {
      "<leader>fG",
      function()
        builtin.live_grep({
          -- grep_open_files = true,
          prompt_title = "Live Grep in project Files including hidden files",
          hidden = true,
          additional_args = utils.grep_exclusions_hidden
        })
      end,
      desc = "Find by grep in open files"
    },
    {
      "<leader>fo",
      function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files including hidden files",
          hidden = true,
          additional_args = utils.grep_exclusions_hidden
        })
      end,
      desc = "Find by grep in open files"
    },
    -- Recent files
    { "<leader>Fr", function() builtin.oldfiles() end, desc = 'Find Recent Files ("." for repeat)' },

    -- Neovim config files
    {
      "<leader>FN",
      function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Neovim files"
    },


    -- Fast file search variants (no preview)
    {
      "<leader>fnf",
      function()
        builtin.find_files(vim.tbl_extend("force", utils.dropdown_theme, { no_ignore = false }))
      end,
      desc = "Search Files (fast, no preview)"
    },
    {
      "<leader>Fnf",
      function()
        builtin.find_files(vim.tbl_extend("force", utils.dropdown_theme, { cwd = "~" }))
      end,
      desc = "Search Files in Home (fast, no preview)"
    },
    {
      "<leader>fnF",
      function()
        builtin.find_files(vim.tbl_extend("force", utils.dropdown_theme, { hidden = true }))
      end,
      desc = "Find . files including hidden (fast, no preview)"
    },
    {
      "<leader>fn+",
      function()
        builtin.find_files(vim.tbl_extend("force", utils.dropdown_theme, { hidden = true, no_ignore = true }))
      end,
      desc = "Find . files including hidden and git ignore (fast, no preview)"
    },
    {
      "<leader>FnF",
      function()
        builtin.find_files(vim.tbl_extend("force", utils.dropdown_theme, { cwd = "~", hidden = true }))
      end,
      desc = "Find . files in Home including hidden (fast, no preview)"
    },

    -- Fast grep search variants (no preview)
    {
      "<leader>fng",
      function()
        builtin.live_grep(vim.tbl_extend("force", utils.dropdown_theme, {
          additional_args = utils.grep_exclusions_normal
        }))
      end,
      desc = "Find by Grep in project files (fast, no preview)"
    },
    {
      "<leader>fn.",
      function()
        local current_buffer_path = vim.fn.expand("%:p:h")
        builtin.live_grep(vim.tbl_extend("force", utils.dropdown_theme, {
          cwd = current_buffer_path,
          prompt_title = "Grep in Current Buffer's Directory",
          additional_args = utils.grep_exclusions_normal
        }))
      end,
      desc = "Find by Grep in current buffer's directory (fast, no preview)"
    },
    {
      "<leader>Fng",
      function()
        builtin.live_grep(vim.tbl_extend("force", utils.dropdown_theme, {
          cwd = "~",
          additional_args = utils.grep_exclusions_normal
        }))
      end,
      desc = "Find by Grep in Home (fast, no preview)"
    },
    {
      "<leader>FnG",
      function()
        builtin.live_grep(vim.tbl_extend("force", utils.dropdown_theme, {
          cwd = "~",
          additional_args = utils.grep_exclusions_hidden
        }))
      end,
      desc = "Find by Grep in Home including hidden files (fast, no preview)"
    },
    {
      "<leader>fnG",
      function()
        builtin.live_grep(vim.tbl_extend("force", utils.dropdown_theme, {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files including hidden files",
          additional_args = utils.grep_exclusions_hidden
        }))
      end,
      desc = "Find by grep in open files (fast, no preview)"
    },

    -- Fast recent files (no preview)
    {
      "<leader>Fnr",
      function()
        builtin.oldfiles(utils.dropdown_theme)
      end,
      desc = 'Find Recent Files (fast, no preview)'
    },
    -- Fast Neovim config files (no preview)
    {
      "<leader>Fnn",
      function()
        builtin.find_files(vim.tbl_extend("force", utils.dropdown_theme, {
          cwd = vim.fn.stdpath("config")
        }))
      end,
      desc = "Find Neovim files (fast, no preview)"
    },
  }
end

return M
