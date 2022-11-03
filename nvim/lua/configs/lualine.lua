local theme = require('configs.onedarkpro.lualine')

local lualine = require('lualine')

lualine.setup({
  options = {
    theme = theme,
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },

    always_divide_middle = false,
    globalstatus = true,
    disabled_filetypes = { 'NvimTree' },
  },
  sections = {
    lualine_a = {
      {
        function()
          return ''
        end,
        padding = 0,
      },
    },
    lualine_b = {
      {
        'mode',
        padding = 0,
      },
    },
    lualine_c = {
      {
        function()
          return ''
        end,
        padding = 0,
      },
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
        padding = 2,
      },
    },
    lualine_x = {
      {
        function()
          return vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == '' and '' or ''
        end,
        padding = 0,
      },
    },
    lualine_y = {
      {
        'b:gitsigns_head',
        icon = {
          '',
          align = 'right',
        },
        padding = 0,
      },
    },
    lualine_z = {
      {
        function()
          return vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == '' and '' or ''
        end,
        padding = 0,
      },
    },
  },
  inactive_sections = {},
  tabline = {},
  extensions = {},
})
