-- To launch scratch buffer, use:
-- alias nvscratch='nvim -c "Scratch"'
return {
  "LintaoAmons/scratch.nvim",
  event = "VeryLazy",
  lazy = false,
  dependencies = {
    { "stevearc/dressing.nvim" },      -- optional: to have the same UI shown in the GIF
    { "ibhagwan/fzf-lua" },            --optional: if you want to use fzf-lua to pick scratch file. Recommanded, since it will order the files by modification datetime desc. (require rg)
    { "nvim-telescope/telescope.nvim" }, -- optional: if you want to pick scratch file by telescope
  },
  config = function()
    require("scratch").setup({
      scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim", -- where your scratch files will be put
      -- window_cmd = "rightbelow vsplit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
      use_telescope = true,
      -- fzf-lua is recommanded, since it will order the files by modification datetime desc. (require rg)
      file_picker = "fzflua",                        -- "fzflua" | "telescope" | nil
      filetypes = { "md", "ts", "js", "lua", "sh" }, -- you can simply put filetype here
      filetype_details = {                           -- or, you can have more control here
        json = {},                                   -- empty table is fine
        ["project-name.md"] = {
          subdir = "project-name"                    -- group scratch files under specific sub folder
        },
        ["yaml"] = {},
        go = {
          requireDir = true, -- true if each scratch file requires a new directory
          filename = "main", -- the filename of the scratch file in the new directory
          content = { "package main", "", "func main() {", "  ", "}" },
          cursor = {
            location = { 4, 2 },
            insert_mode = true,
          },
        },
      },
      localKeys = {
        {
          filenameContains = { "sh" },
          LocalKeys = {
            {
              cmd = "<CMD>RunShellCurrentLine<CR>",
              key = "<C-r>",
              modes = { "n", "i", "v" },
            },
          },
        },
      },
      -- hooks = {
      --   {
      -- -- Example to create buffer with 2 lines containing hello, world
      -- callback = function()
      --   vim.api.nvim_buf_set_lines(0, 0, -1, false, { "hello", "world" })
      -- end,
      --   },
      -- },
    })
  end,

      keys = {
        -- { "<C-p>", "<CMD>lua require('plugins.telescope.pickers').project_files()<CR>" },
        { "<leader>wo", "<CMD>ScratchOpen<CR>", {desc = "Open scratch"} },
        { "<leader>wn", "<CMD>Scratch<CR>", {desc = "New scratch"} },
        { "<leader>wN", "<CMD>ScratchWithName<CR>", {desc = "New scratch with name"} },
      }
}
