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
        horizontal = { preview_cutoff = 120 },
        prompt_position = "top",
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
end

return M
