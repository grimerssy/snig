return {
  tools = {
    auto = false,
    inlay_hints = {
      only_current_line = false,
      auto = false,
      only_current_line_autocmd = 'CursorHold',
      show_parameter_hints = false,
      show_variable_name = false,
      parameter_hints_prefix = ' ',
      other_hints_prefix = ' ',
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = 'Comment',
    },
  },
  server = {
    cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
    on_attach = require('configs.lsp.handlers').on_attach,
    capabilities = require('configs.lsp.handlers').capabilities,

    settings = {
      ['rust-analyzer'] = {
        lens = {
          enable = false,
        },
        checkOnSave = {
          command = 'clippy',
        },
      },
    },
  },
}
