local colors = require('configs.onedarkpro.colors')

require('scrollbar').setup({
  handle = {
    color = colors.gray,
  },
  marks = {
    Search = { color = colors.orange },
    Error = { color = colors.error },
    Warn = { color = colors.warning },
    Info = { color = colors.info },
    Hint = { color = colors.hint },
    Misc = { color = colors.purple },
  },
})
