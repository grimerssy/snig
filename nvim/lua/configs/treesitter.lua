local n = require('keymap').nnoremap

n('<leader>cf', function()
  ContextSetup(true)
end)
n('<leader>cp', function()
  ContextSetup(false)
end)

local configs = require('nvim-treesitter.configs')

configs.setup({
  ensure_installed = {
    'go',
    'gomod',
    'rust',
    'elixir',
    'lua',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'json',
    'proto',
    'sql',
    'c_sharp',
  },
  sync_install = false,
  ignore_install = { '' },
  highlight = {
    enable = true,
    disable = { '' },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { 'yaml' } },
})

function ContextSetup(show_all_context)
  require('treesitter-context').setup({
    enable = true,
    throttle = true,
    max_lines = 0,
    show_all_context = show_all_context,
    patterns = {
      default = {
        'function',
        'method',
        'for',
        'while',
        'if',
        'switch',
        'case',
      },
    },
  })
end

ContextSetup(false)
