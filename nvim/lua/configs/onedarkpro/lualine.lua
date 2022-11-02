local colors = require('configs.onedarkpro.colors')

return {
  normal = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.none, fg = colors.green },
    c = { bg = colors.none, fg = colors.fg },
  },

  insert = {
    a = { bg = colors.blue, fg = colors.black },
    b = { bg = colors.none, fg = colors.blue },
  },

  command = {
    a = { bg = colors.purple, fg = colors.black },
    b = { bg = colors.none, fg = colors.purple },
  },

  visual = {
    a = { bg = colors.yellow, fg = colors.black },
    b = { bg = colors.none, fg = colors.yellow },
  },

  replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.none, fg = colors.red },
  },

  inactive = {
    a = { bg = colors.none, fg = colors.blue },
    b = { bg = colors.none, fg = colors.black },
    c = { bg = colors.none, fg = colors.black },
  },
}
