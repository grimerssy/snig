return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup({
      override = {
        ['astro'] = {
          icon = '',
          color = '#ff5d01',
          cterm_color = '202',
          name = 'Astro',
        },
        ['mjs'] = {
          icon = '',
          color = '#cbcb41',
          cterm_color = '185',
          name = 'Js',
        },
        ['cjs'] = {
          icon = '',
          color = '#cbcb41',
          cterm_color = '185',
          name = 'Js',
        },
      },
    })
  end,
}
