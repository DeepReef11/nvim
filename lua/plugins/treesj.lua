return {
  {
    "Wansmer/treesj",
    enabled = false, -- Using mini splitjoin
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "gJ", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join" },
    },
    opts = {
      use_default_keymaps = false
    },
  },
}
