local packer = require('packer')

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

local function loadConfigs()
  local configs = {
    'autopairs',
    'barbar',
    'cmp',
    'colorizer',
    'comment',
    'gitsigns',
    'lsp',
    'lualine',
    'null-ls',
    'nvim-tree',
    'onedarkpro',
    'telescope',
    'toggleterm',
    'treesitter',
  }
  for _, cfg in ipairs(configs) do
    require(string.format('configs.%s', cfg))
  end
end

return packer.startup(function(use)
  use('wbthomason/packer.nvim')

  use('nvim-lua/plenary.nvim')

  use('olimorris/onedarkpro.nvim')
  use('NvChad/nvim-colorizer.lua')

  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')

  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  use('neovim/nvim-lspconfig')
  use('williamboman/nvim-lsp-installer')
  use('jose-elias-alvarez/null-ls.nvim')

  use('nvim-telescope/telescope.nvim')
  use({
    'ahmedkhalf/project.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-tree.lua',
    },
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('numToStr/Comment.nvim')

  use('windwp/nvim-autopairs')

  use('lewis6991/gitsigns.nvim')

  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  use({
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'SmiteshP/nvim-navic',
    },
  })

  use({
    'romgrk/barbar.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  use('akinsho/toggleterm.nvim')

  loadConfigs()
end)
