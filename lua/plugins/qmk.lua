return {
  'codethread/qmk.nvim',
  ft = { "c" },
  config = function()
    ---@type qmk.UserConfig
    local conf = {
      name = 'LAYOUT_ansi_82',
      layout = {
        'x x x x x x x x x x x x x x _ x',
        'x x x x x x x x x x x x x x _ x',
        'x x x x x x x x x x x x x x _ x',
        'x x x x x x x x x x x x xx^ _ x',
        '^xx x x x x x x x x x x xx^ x _',
        'x x x xxxxxx^xxxxxx x x x x x x',
      }
    }
    require('qmk').setup(conf)
  end
}
