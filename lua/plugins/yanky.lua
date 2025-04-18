return {
  {
    'gbprod/yanky.nvim',
    -- enabled = false,
    dependencies = {
      { 'kkharji/sqlite.lua' },
    },
    opts = {
      -- ring = { storage = 'sqlite' },
    },
    keys = {
      {
        '<leader>pp',
        function()
          require('telescope').extensions.yank_history.yank_history {}
        end,
        desc = 'Open Yank History',
      },
      { 'y',     '<Plug>(YankyYank)',                      mode = { 'n', 'x' },                                desc = 'Yank text' },
      { 'p',     '<Plug>(YankyPutAfter)',                  mode = { 'n', 'x' },                                desc = 'Put yanked text after cursor' },
      { 'P',     '<Plug>(YankyPutBefore)',                 mode = { 'n', 'x' },                                desc = 'Put yanked text before cursor' },
      { '<M-p>', '<Plug>(YankyPutAfterCharwise)',          mode = { 'n', 'x' },                                desc = 'Put yanked text right after cursor charwise' },
      { '<M-P>', '<Plug>(YankyPutBeforeCharwise)',         mode = { 'n', 'x' },                                desc = 'Put yanked text right before cursor charwise' },
      { 'ø',     '<Plug>(YankyPutAfterCharwise)',          mode = { 'n', 'x' },                                desc = 'Charwise Put yanked text right after cursor' },
      { 'Ø',     '<Plug>(YankyPutBeforeCharwise)',         mode = { 'n', 'x' },                                desc = 'Charwise Put yanked text right before cursor' },
      { 'gp',    '<Plug>(YankyGPutAfter)',                 mode = { 'n', 'x' },                                desc = 'Put yanked text after selection' },
      { 'gP',    '<Plug>(YankyGPutBefore)',                mode = { 'n', 'x' },                                desc = 'Put yanked text before selection' },
      { '<c-p>', '<Plug>(YankyPreviousEntry)',             desc = 'Select previous entry through yank history' },
      { '<c-n>', '<Plug>(YankyNextEntry)',                 desc = 'Select next entry through yank history' },
      { ']p',    '<Plug>(YankyPutIndentAfterLinewise)',    desc = 'Put indented after cursor (linewise)' },
      { '[p',    '<Plug>(YankyPutIndentBeforeLinewise)',   desc = 'Put indented before cursor (linewise)' },
      { ']P',    '<Plug>(YankyPutIndentAfterLinewise)',    desc = 'Put indented after cursor (linewise)' },
      { '[P',    '<Plug>(YankyPutIndentBeforeLinewise)',   desc = 'Put indented before cursor (linewise)' },
      { '>p',    '<Plug>(YankyPutIndentAfterShiftRight)',  desc = 'Put and indent right' },
      { '<p',    '<Plug>(YankyPutIndentAfterShiftLeft)',   desc = 'Put and indent left' },
      { '>P',    '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
      { '<P',    '<Plug>(YankyPutIndentBeforeShiftLeft)',  desc = 'Put before and indent left' },
      { '=p',    '<Plug>(YankyPutAfterFilter)',            desc = 'Put after applying a filter' },
      { '=P',    '<Plug>(YankyPutBeforeFilter)',           desc = 'Put before applying a filter' },
    },
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 1500,
    },
    config = function()
      require("yanky").setup(
        {
          ring = {
            history_length = 100,
            storage = "shada",
            storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
            sync_with_numbered_registers = true,
            cancel_event = "update",
            ignore_registers = { "_" },
            update_register_on_cycle = true,
          }
        })
    end
  },
}
