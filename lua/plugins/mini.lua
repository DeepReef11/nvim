return {
  {
    "echasnovski/mini.align",
    lazy = false,
    version = "*",
    opts = {},
  },
  {
    "echasnovski/mini.ai",
    lazy = false,
    version = "*",
    config = function()
      require("mini.ai").setup()
    end,
  },

  {
    -- various neovim plugins project
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      -- local starter = require 'mini.starter'
      -- Management
      require("mini.files").setup({

        -- mappings = {
        --   -- Here 'L' will also close explorer after opening file.
        --   -- Switch to `go_in` if you want to not close explorer.
        --   go_in = '',
        --   go_in_plus = '<Right>,l',
        --   go_out = '<Left>',
        --   go_out_plus = '',
        --   -- Will be overriden by manual `<BS>`, which seems wasteful
        --   reset = '',
        --   -- Overrides built-in `?` for backward search
        --   show_help = '?',
        -- },
      })
      vim.keymap.set(
        "n",
        "<leader>.",
        "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>",
        { desc = "Open minifiles at buffer location" }
      )
      vim.keymap.set(
        "n",
        "<C-e>",
        "<cmd>lua MiniFiles.open()<cr>",
        { desc = "Open minifiles at cwd" }
      )
      local go_in_plus = function()
        for _ = 1, vim.v.count1 do
          MiniFiles.go_in({ close_on_file = true })
        end
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local map_buf = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { buffer = args.data.buf_id })
          end

          map_buf("<CR>", go_in_plus)
          map_buf("<Right>", go_in_plus)

          map_buf("<BS>", MiniFiles.go_out)
          map_buf("<Left>", MiniFiles.go_out)

          map_buf("<Esc>", MiniFiles.close)

          -- Add extra mappings from *MiniFiles-examples*
        end,
      })
      -- require('mini.tabline').setup() -- Using bufferline instead

      -- local sdir = "$NVIM_APPNAME/sessions"
      -- require("mini.sessions").setup({
      -- 	autowrite = true,
      -- 	directory = sdir,
      -- 	vim.api.nvim_create_user_command("MKS", function(args)
      -- 		local vimCmd = "mksession " .. sdir
      -- 		-- if (args['fargs'][0]) then
      -- 		--   vimCmd = vimCmd .. ' ' .. args['fargs'][0]
      -- 		-- end
      -- 		if args["args"] then
      -- 			vimCmd = vimCmd .. "/" .. args["args"] .. ".vim"
      -- 		end
      -- 		vim.cmd(vimCmd)
      -- 		-- vim.cmd "echo 'ok'"
      -- 	end, { desc = "Save session to global folder", nargs = "*" }),
      -- })
      --
      -- Editing
      -- require("mini.jump").setup({
      -- 	mappings = {
      -- 		forward = "f",
      -- 		backward = "F",
      -- 		forward_till = "t",
      -- 		backward_till = "T",
      -- 		repeat_jump = "",
      -- 	},
      --
      -- 	-- Delay values (in ms) for different functionalities. Set any of them to
      -- 	-- a very big number (like 10^7) to virtually disable.
      -- 	delay = {
      -- 		-- Delay between jump and highlighting all possible jumps
      -- 		highlight = 250,
      --
      -- 		-- Delay between jump and automatic stop if idle (no jump is done)
      -- 		idle_stop = 10000000,
      -- 	},
      -- })

      require("mini.move").setup()
      vim.keymap.set("x", "<M-Up>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "MiniMove selection" })
      vim.keymap.set(
        "x",
        "<M-Down>",
        '<cmd>lua MiniMove.move_selection("down")<cr>',
        { desc = "MiniMove selection" }
      )
      vim.keymap.set(
        "x",
        "<M-Left>",
        '<cmd>lua MiniMove.move_selection("left")<cr>',
        { desc = "MiniMove selection" }
      )
      vim.keymap.set(
        "x",
        "<M-Right>",
        '<cmd>lua MiniMove.move_selection("right")<cr>',
        { desc = "MiniMove selection" }
      )
      vim.keymap.set("n", "<M-Up>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "MiniMove line" })
      vim.keymap.set("n", "<M-Down>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "MiniMove line" })
      vim.keymap.set("n", "<M-Left>", '<cmd>lua MiniMove.move_line("left")<cr>', { desc = "MiniMove line" })
      vim.keymap.set("n", "<M-Right>", '<cmd>lua MiniMove.move_line("right")<cr>', { desc = "MiniMove line" })
      require("mini.splitjoin").setup() -- use gS to split/join arguments
      require("mini.surround").setup(
        {
          mappings = {
            add = "gsa",            -- Add surrounding in Normal and Visual modes
            delete = "gsd",         -- Delete surrounding
            find = "gsf",           -- Find surrounding (to the right)
            find_left = "gsF",      -- Find surrounding (to the left)
            highlight = "gsh",      -- Highlight surrounding
            replace = "gsr",        -- Replace surrounding. Type gsr <existing surround> <new surround> to replace current surrouinding instead of [N]ext, [L]ast surrounding
            update_n_lines = "gsn", -- Update `n_lines`
          },
        }

      )
      require("mini.misc").setup({
        require("mini.misc").setup_restore_cursor(),
      })
      require("mini.indentscope").setup({
        -- Draw options
        draw = {
          -- Delay (in ms) between event and start of drawing scope indicator
          delay = 0,

          -- Animation rule for scope's first drawing. A function which, given
          -- next and total step numbers, returns wait time (in ms). See
          -- |MiniIndentscope.gen_animation| for builtin options. To disable
          -- animation, use `require('mini.indentscope').gen_animation.none()`.
          animation = require("mini.indentscope").gen_animation.none(), --<function: implements constant 20ms between steps>,

          -- Symbol priority. Increase to display on top of more symbols.
          priority = 2,
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Textobjects
          object_scope = "ii",
          object_scope_with_border = "ai",

          -- Motions (jump to respective border line; if not present - body line)
          goto_top = "[i",
          goto_bottom = "]i",
        },

        -- Options which control scope computation
        options = {
          -- Type of scope's border: which line(s) with smaller indent to
          -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
          border = "both",

          -- Whether to use cursor column when computing reference indent.
          -- Useful to see incremental scopes with horizontal cursor movements.
          indent_at_cursor = false,

          -- Whether to first check input line to be a border of adjacent scope.
          -- Use it if you want to place cursor on function header to get scope of
          -- its body.
          try_as_border = false,
        },

        -- Which character to use for drawing scope indicator
        symbol = "╎",
      })
      -- UI
      local animate = require('mini.animate')
      require("mini.animate").setup({

        scroll = {
          -- Whether to enable this animation
          enable = false,

          -- Timing of animation (how steps will progress in time)
          -- timing = animate.gen_timing.cubic(), --<function: implements linear total 250ms animation duration>,

          -- Subscroll generator based on total scroll
          -- subscroll = --<function: implements equal scroll with at most 60 steps>,
        },
        cursor = {
          -- Whether to enable this animation
          enable = true,

          -- Timing of animation (how steps will progress in time)
          timing = animate.gen_timing.cubic(
          {
              easing = "out",
              duration = 400,
              unit = "total"

            }
          )
          -- Path generator for visualized cursor movement
          -- path = --<function: implements shortest line path>,
        },
      })
      -- require('mini.cursorword').setup()
      --   require('mini.starter').setup {
      --     evaluate_single = true,
      --     items = {
      --       starter.sections.sessions(20, true),
      --       -- starter.sections.builtin_actions(),
      --       starter.sections.recent_files(10, false),
      --       starter.sections.recent_files(10, true),
      --       starter.sections.telescope(),
      --       -- Use this if you set up 'mini.sessions'
      --     },
      --     content_hooks = {
      --       starter.gen_hook.adding_bullet ' • ',
      --       starter.gen_hook.indexing('all', { 'Builtin actions' }),
      --       starter.gen_hook.aligning('center', 'center'),
      --     },
      --
      --     header = [[
      --
      --
      -- ███╗   ██╗███████╗ ██████╗  ██╗   ██╗██╗███╗   ███╗
      -- ████╗  ██║██╔════╝██╔═══██╗ ██║   ██║██║████╗ ████║
      -- ██╔██╗ ██║█████╗  ██║   ██║ ██║   ██║██║██╔████╔██║
      -- ██║╚██╗██║██╔══╝  ██║   ██║ ╚██╗ ██╔╝██║██║╚██╔╝██║
      -- ██║ ╚████║███████╗╚██████╔╝  ╚████╔╝ ██║██║ ╚═╝ ██║
      -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═══╝  ╚═╝╚═╝     ╚═╝
      --
      --
      --      ]],
      --   }
    end,
  },
}
