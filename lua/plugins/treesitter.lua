return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "tsx",
          "typescript",
          "javascript",
          "html",
          "css",
          "vue",
          "astro",
          "svelte",
          "gitcommit",
          "graphql",
          "json",
          "json5",
          "lua",
          "markdown",
          "prisma",
          "vim",
          "go",
        "powershell",
        },                              -- one of "all", or a list of languages
        sync_install = false,           -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = { "haskell" }, -- list of parsers to ignore installing
        highlight = {
          enable = true,
          -- disable = { "c", "rust" },  -- list of language that will be disabled
          -- additional_vim_regex_highlighting = false,
        },

        incremental_selection = {
          enable = false,
          keymaps = {
            init_selection = "<leader>gnn",
            node_incremental = "<leader>gnr",
            scope_incremental = "<leader>gne",
            node_decremental = "<leader>gnt",
          },
        },

        indent = {
          enable = true,
        },

        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]["] = "@block.outer",
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_next_end = {
              ["]]"] = "@block.outer",
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["[["] = "@block.outer",
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
            goto_previous_end = {
              ["[]"] = "@block.outer",
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
            },
          },
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["~"] = "@parameter.inner",
            },
          },
        },

        textsubjects = {
          enable = true,
          prev_selection = "<BS>",
          keymaps = {
            ["<CR>"] = "textsubjects-smart", -- works in visual mode
          },
        },
      })
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      -- Language, filetype extension attach
      vim.filetype.add({ extension = {webc = 'webc'} })
      vim.treesitter.language.register('html', 'webc')
    end,
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
    },
  },

  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPre",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,         -- Auto close tags
          enable_rename = true,         -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        --[[ per_filetype = {
            ["html"] = {
              enable_close = false
            }
          } ]]
      })
    end,
  },
}
