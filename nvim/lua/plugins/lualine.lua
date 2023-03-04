return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'catppuccin/nvim',
    'nvim-tree/nvim-web-devicons',
    'SmiteshP/nvim-navic',
  },
  config = function()
    local lualine = require('lualine')

    local colors = require('catppuccin.palettes.macchiato')
    local theme = {
      normal = {
        a = { bg = colors.none, fg = colors.green },
        b = { bg = colors.green, fg = colors.mantle },
        c = { bg = colors.none, fg = colors.green },
      },
      insert = {
        a = { bg = colors.none, fg = colors.blue },
        b = { bg = colors.blue, fg = colors.mantle },
        c = { bg = colors.none, fg = colors.blue },
      },
      command = {
        a = { bg = colors.none, fg = colors.mauve },
        b = { bg = colors.mauve, fg = colors.mantle },
        c = { bg = colors.none, fg = colors.mauve },
      },
      visual = {
        a = { bg = colors.none, fg = colors.peach },
        b = { bg = colors.peach, fg = colors.mantle },
        c = { bg = colors.none, fg = colors.peach },
      },
      replace = {
        a = { bg = colors.none, fg = colors.red },
        b = { bg = colors.red, fg = colors.mantle },
        c = { bg = colors.none, fg = colors.red },
      },
      inactive = {
        a = { bg = colors.none, fg = colors.none },
        b = { bg = colors.none, fg = colors.none },
        c = { bg = colors.none, fg = colors.none },
      },
    }

    local x_icon = vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == '' and '' or ''
    local z_icon = vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == '' and '' or ''

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
              return x_icon
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
              return z_icon
            end,
            padding = 0,
          },
        },
      },
      inactive_sections = {},
      tabline = {},
      extensions = {},
    })
  end,
}
