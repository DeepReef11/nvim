local icons = EcoVim.icons

local git_icons = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  copied = ">",
  deleted = icons.gitRemove,
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}

-- Helper function to get visual selection
function vim.getVisualSelection()
  local current_clipboard_content = vim.fn.getreg('"')
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})
  vim.fn.setreg('"', current_clipboard_content)

  text = string.gsub(text, "\n", "")
  return #text > 0 and text or ''
end

-- Common exclusion patterns for normal searches
local grep_exclusions_normal = function()
  return {
    "--glob=!repomix-*.txt",
    "--glob=!*.min.js",
    "--glob=!node_modules/*"
  }
end

-- Common exclusion patterns for hidden searches (capital G bindings)
local grep_exclusions_hidden = function()
  return {
    "--hidden",
    "--glob=!repomix-*.txt",
    "--glob=!*.min.js",
    "--glob=!node_modules/*",
    "--glob=!.git/*" -- Also exclude .git directory for hidden searches
  }
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "cljoly/telescope-repo.nvim",
    },
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("repo")
      telescope.load_extension("git_worktree")

      -- Setup configuration
      telescope.setup({
        defaults = {
          border = true,
          hl_result_eol = true,
          multi_icon = "",
          vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case",
          },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { preview_cutoff = 120 },
            prompt_position = "top",
          },
          file_sorter = require("telescope.sorters").get_fzy_sorter,
          prompt_prefix = "  ",
          color_devicons = true,
          git_icons = git_icons,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          mappings = {
            i = {
              ["<C-x>"] = false,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-s>"] = actions.cycle_previewers_next,
              ["<C-a>"] = actions.cycle_previewers_prev,
              ["<ESC>"] = actions.close,
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["<C-s>"] = actions.cycle_previewers_next,
              ["<C-a>"] = actions.cycle_previewers_prev,
            },
          },
        },
        extensions = {
          fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
    end,
    keys = function()
      local builtin = require("telescope.builtin")

      return {
        -- Notify search
        { "<leader>ns",  "<CMD>Telescope notify<CR>",                   desc = "Search Notify" },

        -- Help and documentation
        { "<leader>sh",  function() builtin.help_tags() end,            desc = "Search Help" },
        { "<leader>sk",  function() builtin.keymaps() end,              desc = "Search Keymaps" },
        { "<leader>st",  function() builtin.builtin() end,              desc = "Search Telescope" },
        { "<leader>sq",  function() builtin.quickfix() end,             desc = "Search Quickfix" },

        -- Symbol search
        { "<leader>ssa", function() builtin.lsp_document_symbols() end, desc = "Search Symbols All" },
        { "<leader>ssr", function() builtin.lsp_references() end,       desc = "Search Symbols References" },
        {
          "<leader>sss",
          function()
            builtin.lsp_document_symbols({ symbols = { "method", "function", "string" } })
          end,
          desc = "Search Symbols Select functions and methods"
        },
        {
          "<leader>ssv",
          function()
            builtin.lsp_document_symbols({ symbols = { "constant", "variable" } })
          end,
          desc = "Search Symbols Variable"
        },
        {
          "<leader>ssc",
          function()
            builtin.lsp_document_symbols({ symbols = { "class" } })
          end,
          desc = "Search Symbols Class"
        },
        {
          "<leader>ssp",
          function()
            builtin.lsp_document_symbols({ symbols = { "property" } })
          end,
          desc = "Search Symbols Property"
        },

        -- Word and selection search
        { "<leader>sw", function() builtin.grep_string() end, desc = "Search current Word" },
        {
          "<leader>sv",
          function()
            local text = vim.getVisualSelection()
            builtin.current_buffer_fuzzy_find({ default_text = text })
          end,
          mode = "v",
          desc = "Search current Selection in Buffer"
        },

        -- Diagnostics and resume
        { "<leader>sd", function() builtin.diagnostics() end, desc = "Search Diagnostics" },
        { "<leader>sr", function() builtin.resume() end,      desc = "Search Resume" },

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
              additional_args = grep_exclusions_normal
            })
          end,
          desc = "Find by Grep in project files"
        },
        {
          "<leader>f.",
          function()
            local current_buffer_path = vim.fn.expand("%:p:h")
            builtin.live_grep({
              cwd = current_buffer_path,
              prompt_title = "Grep in Current Buffer's Directory",
              additional_args = grep_exclusions_normal
            })
          end,
          desc = "Find by Grep in current buffer's directory"
        },
        {
          "<leader>Fg",
          function()
            builtin.live_grep({
              cwd = "~",
              additional_args = grep_exclusions_normal
            })
          end,
          desc = "Find by Grep in Home"
        },
        {
          "<leader>FG",
          function()
            builtin.live_grep({
              cwd = "~",
              additional_args = grep_exclusions_hidden
            })
          end,
          desc = "Find by Grep in Home including hidden files"
        },
        {
          "<leader>fG",
          function()
            builtin.live_grep({
              grep_open_files = true,
              prompt_title = "Live Grep in Open Files including hidden files",
              hidden = true,
              additional_args = grep_exclusions_hidden
            })
          end,
          desc = "Find by grep in open files"
        },
        -- Recent files
        { "<leader>Fr", function() builtin.oldfiles() end, desc = 'Find Recent Files ("." for repeat)' },

        -- Neovim config files
        {
          "<leader>Fn",
          function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
          end,
          desc = "Find Neovim files"
        },
      }
    end,
  },
}
