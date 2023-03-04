return {
  'petertriho/nvim-scrollbar',
  dependencies = {
    'catppuccin/nvim',
  },
  config = function()
    local colors = require('catppuccin.palettes.macchiato')

    require('scrollbar').setup({
      handle = {
        color = 'none',
      },
      marks = {
        Search = { color = colors.peach },
        Error = { color = colors.red },
        Warn = { color = colors.yellow },
        Info = { color = colors.blue },
        Hint = { color = colors.teal },
        Misc = { color = colors.lavender },
      },
    })
  end,
}
