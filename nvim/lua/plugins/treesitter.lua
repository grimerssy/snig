return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/playground',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'go',
        'gomod',
        'rust',
        'elixir',
        'lua',
        'python',
        'html',
        'css',
        'javascript',
        'typescript',
        'tsx',
        'json',
        'proto',
        'sql',
        'c_sharp',
        'svelte',
      },
      sync_install = false,
      ignore_install = { '' },
      highlight = {
        enable = true,
        disable = { '' },
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { 'yaml' } },
      context_commentstring = {
        enable = true,
      },
    })
  end,
}
