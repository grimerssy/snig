local onedarkpro = require 'onedarkpro'

local colors = {
  bg = '#272C35',
  fg = '#A9B2C0',
  red = '#F16372',
  orange = '#DB975C',
  yellow = '#DAB067',
  green = '#8CC570',
  blue = '#40B0F5',
  cyan = '#00AEBA',
  purple = '#E36FEA',
  white = '#A9B2C0',
  black = '#272C35',
  gray = '#576270',
  highlight = '#2B323D',
  none = 'NONE',
}

onedarkpro.setup({
  theme = function()
    if vim.o.background == 'dark' then
      return 'onedark'
    else
      return 'onelight'
    end
  end,
  colors = {
    bg = colors.bg,
    fg = colors.fg,
    red = colors.red,
    orange = colors.orange,
    yellow = colors.yellow,
    green = colors.green,
    cyan = colors.cyan,
    blue = colors.blue,
    purple = colors.purple,
    white = colors.white,
    black = colors.black,
    gray = colors.gray,
    highlight = colors.highlight,
    none = colors.none,
  },
  hlgroups = {
    TSPunctBracket = { fg = colors.fg },
    TSOperator = { fg = colors.blue },
    TSFuncBuiltin = { fg = colors.blue },
    TSNamespace = { fg = colors.cyan },
    TSTypeBuiltin = { fg = colors.purple },
    TSType = { fg = colors.yellow },
    TSField = { fg = colors.orange },
    TSProperty = { fg = colors.orange },
    TSVariable = { fg = colors.orange },
    TSVariableBuiltin = { fg = colors.orange },
    TSParameter = { fg = colors.orange },
    TSParameterReference = { fg = colors.orange },
  },
  filetype_hlgroups = {},
  plugins = {
    all = false,
    packer = true,
    telescope = true,
    treesitter = true,
  },
  styles = {
    strings = 'NONE',
    comments = 'NONE',
    keywords = 'italic',
    functions = 'italic',
    variables = 'NONE',
    virtual_text = 'NONE',
  },
  options = {
    bold = false,
    italic = false,
    underline = false,
    undercurl = false,
    cursorline = true,
    transparency = false,
    terminal_colors = false,
    window_unfocussed_color = false,
  }
})

