local theme = require('configs.onedarkpro.lualine')

local lualine = require('lualine')

lualine.setup({
  options = {
    theme = theme,
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },

    always_divide_middle = false,
    globalstatus = true,
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {},
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'b:gitsigns_head',
        icon = '',
      },
    },
  },
  inactive_sections = {},
  tabline = {},
  extensions = { 'nvim-tree' },
})
