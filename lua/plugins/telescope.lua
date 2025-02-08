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

function vim.getVisualSelection()
  local current_clipboard_content = vim.fn.getreg('"')

  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  vim.fn.setreg('"', current_clipboard_content)

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("repo")
      require("telescope").load_extension("git_worktree")
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          border = true,
          hl_result_eol = true,
          multi_icon = "",
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              preview_cutoff = 120,
            },
            prompt_position = "top",
          },
          file_sorter = require("telescope.sorters").get_fzy_sorter,
          prompt_prefix = "  ",
          color_devicons = true,
          git_icons = git_icons,
          -- sorting_strategy = "ascending",
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
              -- ["<C-h>"] = "which_key",
              ["<ESC>"] = actions.close,
              ["<C-d>"] = require("telescope.actions").delete_buffer,
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


      vim.keymap.set("n", "<leader>ns", "<CMD>Telescope notify<CR>", { desc = "Search Notify" })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
      vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "Search Telescope" })
      vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "Search Quickfix" })
      vim.keymap.set("n", "<leader>ssa", builtin.lsp_document_symbols, { desc = "Search Symbols All" })
      vim.keymap.set("n", "<leader>ssr", builtin.lsp_references, { desc = "Search Symbols References" })
      vim.keymap.set("n", "<leader>sss", function()
        builtin.lsp_document_symbols({ symbols = { "method", "function", "string" } })
      end, { desc = "Search Symbols Select functions and methods" })

      vim.keymap.set("n", "<leader>ssv", function()
        builtin.lsp_document_symbols({ symbols = { "constant", "variable" } })
      end, { desc = "Search Symbols Variable" })
      vim.keymap.set("n", "<leader>ssc", function()
        builtin.lsp_document_symbols({ symbols = { "class" } })
      end, { desc = "Search Symbols Class" })
      vim.keymap.set("n", "<leader>ssp", function()
        builtin.lsp_document_symbols({ symbols = { "property" } })
      end, { desc = "Search Symbols Property" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })


      vim.keymap.set("v", "<leader>sv", function()
        local text = vim.getVisualSelection()
        builtin.current_buffer_fuzzy_find({ default_text = text })
        -- local selected_text = vim.fn.getreg('"'):gsub("[%-%.%+%*%?%^%$%(%)%[%]%{%}%|%\\]", "\\%1"):gsub("\n", "")
        -- require('telescope.builtin').current_buffer_fuzzy_find({ default_text = selected_text })
      end, { desc = "Search current Selection in Buffer" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
      vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })

      vim.keymap.set("n", "<leader><leader>", function()
        builtin.buffers({ sort_lastused = true, sort_mru = true })
      end, { desc = "  Find existing buffers" })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "/ Fuzzily search in current buffer" })

      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ no_ignore = false })
      end, { desc = "Search Files" })
      vim.keymap.set("n", "<leader>Ff", function()
        builtin.find_files({ cwd = "~" })
      end, { desc = "Search Files" })
      vim.keymap.set("n", "<leader>f.", function()
        builtin.find_files({ hidden = true })
      end, { desc = "Find . files (including hidden)" })
      vim.keymap.set("n", "<leader>f+", function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end, { desc = "Find . files (including hidden and git ignore)" })
      vim.keymap.set("n", "<leader>F.", function()
        builtin.find_files({ cwd = "~", hidden = true })
      end, { desc = "Find . files (including hidden)" })
      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep({
          hidden = true,
          additional_args = function()
            return { "--hidden" }
          end
        })
      end, { desc = "Find by Grep in project files" })
      vim.keymap.set("n", "<leader>Fg", function()
        builtin.live_grep({
          cwd = "~",
        })
      end, { desc = "Find by Grep" })
      vim.keymap.set("n", "<leader>FG", function()
        builtin.live_grep({
          cwd = "~",
          hidden = true, -- Not working in live_grep
        })
      end, { desc = "Find by Grep including hidden files" })
      vim.keymap.set("n", "<leader>fG", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files including hidden files",
          hidden = true, -- Not working in live_grep
        })
      end, { desc = "Find by grep in open files" })
      vim.keymap.set("n", "<leader>Fr", builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set("n", "<leader>Fn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "Find Neovim files" })
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "cljoly/telescope-repo.nvim" },
    },
    cmd = "Telescope",
    keys = {
      -- { "<C-p>", "<CMD>lua require('plugins.telescope.pickers').project_files()<CR>" },
      -- { "<S-p>", "<CMD>()<CR>" },
      -- {
      -- 	"<Leader>pf",
      -- 	"<CMD>lua require('plugins.telescope.pickers').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>",
      -- },
      -- { "<Leader>pw", "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>" },
      -- {
      -- 	"<Leader>sb",
      -- 	"<CMD>lua require('plugins.telescope.pickers').buffer_search()<CR>",
      -- 	{ desc = "Buffer Search" },
      -- },
    },
  },
}
