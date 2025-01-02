return {
  "codethread/qmk.nvim",
  ft = { "c" },
  config = function()
    ---@type qmk.UserConfig
    local conf = {
      name = "LAYOUT_ansi_82",
      layout = {
        "x x x x x x x x x x x x x x _ x",
        "x x x x x x x x x x x x x x _ x",
        "x x x x x x x x x x x x x x _ x",
        "x x x x x x x x x x x x xx^ _ x",
        "^xx x x x x x x x x x x xx^ x _",
        "x x x xxxxxx^xxxxxx x x x x x x",
      },
    }
    local corne = {
      name = "LAYOUT_split_3x6_3",
      layout = { -- create a visual representation of your final layout
        "x x x x x x _ _ _ _ x x x x x x", -- including keys that span multple rows (with alignment left, center or right)
        "x x x x x x _ _ _ _ x x x x x x", -- including keys that span multple rows (with alignment left, center or right)
        "x x x x x x _ _ _ _ x x x x x x", -- including keys that span multple rows (with alignment left, center or right)
        "_ _ _ _ x x x _ _ x x x _ _ _ _",
      },
    }
    require("qmk").setup(conf)
    require("qmk").setup(corne)
  end,
}
