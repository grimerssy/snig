local icons = require('nvim-web-devicons')
local colors = require('configs.onedarkpro.colors')

icons.set_icon({
  override = {
    lua = {
      icon = '',
      color = colors.purple,
      name = 'lua',
    },
  },
})
