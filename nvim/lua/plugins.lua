local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
---@diagnostic disable-next-line: missing-parameter
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

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
    'autotag',
    'bacon',
    'cmp',
    'colorizer',
    'comment',
    'dap',
    'gitsigns',
    'harpoon',
    'impatient',
    'lsp',
    'lualine',
    'luasnip',
    'null-ls',
    'nvim-tree',
    'scrollbar',
    'onedarkpro',
    'telescope',
    'treesitter',
  }
  for _, cfg in ipairs(configs) do
    require(string.format('configs.%s', cfg))
  end
end

return packer.startup(function(use)
  use('wbthomason/packer.nvim')

  use('nvim-lua/plenary.nvim')

  use('lewis6991/impatient.nvim')

  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')

  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')

  use('mfussenegger/nvim-dap')
  use('rcarriga/nvim-dap-ui')
  use('leoluz/nvim-dap-go')

  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'ThePrimeagen/harpoon',
    },
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0',
    requires = {
      'nvim-treesitter/nvim-treesitter-context',
    },
  })
  use('nvim-treesitter/playground')

  use('windwp/nvim-ts-autotag')

  use({ 'lewis6991/gitsigns.nvim', commit = 'd3a8ba0b0d34bbac482b963e52b346065169fa20' })

  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('numToStr/Comment.nvim')

  use({
    'olimorris/onedarkpro.nvim',
    commit = 'ad9fca686aa96650e11ca9c1b4601195c7869086',
  })
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
  use('petertriho/nvim-scrollbar')
  use('norcalli/nvim-colorizer.lua')

  use({
    'christianchiarulli/rust-tools.nvim',
    branch = 'modularize_and_inlay_rewrite',
  })
  use('Canop/nvim-bacon')

  loadConfigs()
end)
