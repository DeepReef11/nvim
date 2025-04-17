return {
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = { "w", "e", "b", "ge" },
    config = function()
      -- Keep normal w mapping
      vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Normal w" })

      -- Use specific key codes for AltGr combinations
      -- Replace <M-w> with the actual key code
      vim.keymap.set({ "n", "o", "x" }, "<M-w>", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "<M-e>", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "<M-b>", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      -- vim.keymap.set({ "n", "o", "x" }, "<A-˘>", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({ "n", "o", "x" }, "ß", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({ "n", "o", "x" }, "å", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "é", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })

      -- Keep the ge mapping as is
      vim.keymap.set(
        { "n", "o", "x" },
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        { desc = "Spider-ge" }
      )
    end,
  },
}
