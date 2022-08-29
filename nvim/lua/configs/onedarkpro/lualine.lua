local colors = require('configs.onedarkpro.colors')

return {
  normal = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.black, fg = colors.green },
    c = { bg = colors.black, fg = colors.fg },
  },

  insert = {
    a = { bg = colors.blue, fg = colors.black },
    b = { bg = colors.black, fg = colors.blue },
  },

  command = {
    a = { bg = colors.purple, fg = colors.black },
    b = { bg = colors.black, fg = colors.purple },
  },

  visual = {
    a = { bg = colors.yellow, fg = colors.black },
    b = { bg = colors.black, fg = colors.yellow },
  },

  replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.black, fg = colors.red },
  },

  inactive = {
    a = { bg = colors.gray, fg = colors.blue },
    b = { bg = colors.gray, fg = colors.black },
    c = { bg = colors.gray, fg = colors.black },
  },
}
