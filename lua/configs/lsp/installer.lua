local lsp_installer = require 'nvim-lsp-installer'

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('configs.lsp.handlers').on_attach,
    capabilities = require('configs.lsp.handlers').capabilities,
  }

  local settings = string.format('configs.lsp.settings.%s', server.name)
  local found, srv_opts = pcall(require, settings)
  if found then
    opts = vim.tbl_deep_extend('force', opts, srv_opts)
  end

  server:setup(opts)
end)

