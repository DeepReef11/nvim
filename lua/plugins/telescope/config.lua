local utils = require("plugins.telescope.utils")

local M = {}

function M.setup()
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
      path_display = { "truncate" },
      dynamic_preview_title = true,
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
        horizontal = {
          preview_cutoff = 120,
          width = 0.99,        -- Width of the entire telescope window
          height = 0.99,       -- Height of the entire telescope window
          preview_width = 0.6, -- Width of the preview window (0.5 = 50%)
        },
      },
      file_sorter = require("telescope.sorters").get_fzy_sorter,
      prompt_prefix = "  ",
      color_devicons = true,
      git_icons = utils.git_icons,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      mappings = {
        i = {
          ["<C-c>"] = { "<esc>", type = "command" }, -- normal mode
          -- ["<C-x>"] = false, -- prevent open in split horizontal
          -- ["<C-v>"] = false, -- prevent open in split vertical
          -- ["<C-j>"] = actions.move_selection_next,
          -- ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          ["<C-s>"] = actions.cycle_previewers_next,
          ["<C-a>"] = actions.cycle_previewers_prev,
          -- ["<C-l>"] = actions.cycle_layout,
          ["<ESC>"] = actions.close,
          ["<C-d>"] = actions.delete_buffer, -- normally down
          -- ["<C-d>"] = actions.delete_buffer, -- normally down
          ['<C-Up>'] = require('telescope.actions').preview_scrolling_up,
          ['<C-Down>'] = require('telescope.actions').preview_scrolling_down,
          ['<C-Left>'] = require('telescope.actions').preview_scrolling_left,
          ['<C-Right>'] = require('telescope.actions').preview_scrolling_right,
          ["<C-p>"] = require('telescope.actions.layout').toggle_preview,
        },
        n = {
          ["<C-s>"] = actions.cycle_previewers_next,
          ["<C-a>"] = actions.cycle_previewers_prev,
          ["<C-p>"] = require('telescope.actions.layout').toggle_preview,
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
end

return M
