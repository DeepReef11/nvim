return {
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
      {
        "<Leader>rp",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "Refactor Project with spectre Search and replace",
      },
      {
        "<Leader>rp",
        "<cmd>lua require('spectre').open_visual()<CR>",
        mode = "v",
        desc = "Refactor Project with spectre Search and replace",
      }
    }
  },
}
