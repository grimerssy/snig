return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup({
      override = {
        astro = {
          icon = '',
          color = '#ff5d01',
          cterm_color = '202',
          name = 'Astro',
        },
      },
    })
  end,
}
