return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local icons = require("utils.icons")
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    -- Create a global variable to store the pending keys
    vim.g.pending_keys = ""

    -- Set up autocmd to capture keypresses
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.g.pending_keys = ""
        vim.cmd("redrawstatus")
      end
    })

    -- Create mapping to track number prefixes
    for i = 0, 9 do
      vim.keymap.set("n", tostring(i), function()
        vim.g.pending_keys = vim.g.pending_keys .. tostring(i)
        vim.cmd("redrawstatus")
        return tostring(i)
      end, { expr = true })
    end

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.errorOutline,
              warn = icons.warningTriangle,
              info = icons.infoOutline,
              hint = icons.lightbulbOutline,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1 },
        },
        lualine_x = {
          -- Display pending key sequence
          '%S',
          {
            function()
              local recording_register = vim.fn.reg_recording()
              if recording_register ~= "" then
                return icons.circle .. "Recording @" .. recording_register
              end
              return ""
            end,
            color = { fg = "red" },
          },
          {
            "diff",
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    return opts
  end,
}
