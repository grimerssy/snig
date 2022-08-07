local configs = require 'nvim-treesitter.configs'

configs.setup {
  ensure_installed = { 'go', 'gomod', 'lua', 'json' },
  sync_install = false,
  ignore_install = { '' },
  highlight = {
    enable = true,
    disable = { '' },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { 'yaml' } },
}
