local colors = require('colorscheme.colors')

return {
  normal = {
    a = { bg = colors.none, fg = colors.green },
    b = { bg = colors.green, fg = colors.black },
    c = { bg = colors.none, fg = colors.green },
  },

  insert = {
    a = { bg = colors.none, fg = colors.blue },
    b = { bg = colors.blue, fg = colors.black },
    c = { bg = colors.none, fg = colors.blue },
  },

  command = {
    a = { bg = colors.none, fg = colors.purple },
    b = { bg = colors.purple, fg = colors.black },
    c = { bg = colors.none, fg = colors.purple },
  },

  visual = {
    a = { bg = colors.none, fg = colors.orange },
    b = { bg = colors.orange, fg = colors.black },
    c = { bg = colors.none, fg = colors.orange },
  },

  replace = {
    a = { bg = colors.none, fg = colors.red },
    b = { bg = colors.red, fg = colors.black },
    c = { bg = colors.none, fg = colors.red },
  },

  inactive = {
    a = { bg = colors.none, fg = colors.none },
    b = { bg = colors.none, fg = colors.none },
    c = { bg = colors.none, fg = colors.none },
  },
}
