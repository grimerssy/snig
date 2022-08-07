local packer = require 'packer'

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
}

local function getConfig(name)
  require(string.format('configs.%s', name))
end

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use {
    'olimorris/onedarkpro.nvim',
    config = getConfig('onedarkpro'),
  }

  use 'neovim/nvim-lspconfig'
  use {
    'williamboman/nvim-lsp-installer',
    config = getConfig('lsp'),
  }

  use {
    'hrsh7th/nvim-cmp',
    config = getConfig('cmp'),
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use {
    'nvim-telescope/telescope.nvim',
    config = getConfig('telescope'),
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = getConfig('treesitter'),
    run = ':TSUpdate',
  }

  use {
    'windwp/nvim-autopairs',
    config = getConfig('autopairs'),
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = getConfig('gitsigns'),
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = getConfig('nvim-tree'),
  }
  use 'kyazdani42/nvim-web-devicons'

  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

end)

