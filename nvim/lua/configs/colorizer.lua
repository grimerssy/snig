local colorizer = require('colorizer')

colorizer.setup({
  '*',
  '!TelescopePrompt',
  '!NvimTree',
}, {
  RGB = true,
  RRGGBB = true,
  names = false,
  RRGGBBAA = true,
  rgb_fn = true,
  hsl_fn = true,
  css = false,
  css_fn = true,
  mode = 'background',
})
