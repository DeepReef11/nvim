return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require("smart-splits").setup({

      default_amount = 7,
        swap = {
          -- this will create the mapping like
          -- <leader><C-h>
          -- <leader><C-j>
          -- <leader><C-k>
          -- <leader><C-l>
          mod = '<C>',
          prefix = '<leader>',
        },
      })
      -- resizing splits
      -- these keymaps will also accept a range,
      -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
      local smartsplits = require('smart-splits')
      
      vim.keymap.set('n', '<M-S-Left>', smartsplits.resize_left, {desc = "Resize pane <-left"})
      vim.keymap.set('n', '<M-S-Right>', smartsplits.resize_right, {desc = "Resize pane ->right"})
      vim.keymap.set('n', '<M-S-Up>', smartsplits.resize_up, {desc = "Resize pane to up"})
      vim.keymap.set('n', '<M-S-Down>', smartsplits.resize_down, {desc = "Resize pane down"})
      -- moving between splits
      vim.keymap.set('n', '<C-w><left>', smartsplits.move_cursor_left) -- These can more from left to right even when outbound
      vim.keymap.set('n', '<C-w><down>', smartsplits.move_cursor_down)
      vim.keymap.set('n', '<C-w><up>', smartsplits.move_cursor_up)
      vim.keymap.set('n', '<C-w><right>', smartsplits.move_cursor_right)
      vim.keymap.set('n', '<C-\\>', smartsplits.move_cursor_previous)
      -- swapping buffers between windows
      vim.keymap.set('n', '<leader><C-h>', require('smart-splits').swap_buf_left)
      vim.keymap.set('n', '<leader><C-j>', require('smart-splits').swap_buf_down)
      vim.keymap.set('n', '<leader><C-k>', require('smart-splits').swap_buf_up)
      vim.keymap.set('n', '<leader><C-l>', require('smart-splits').swap_buf_right)
    end
  },
}
