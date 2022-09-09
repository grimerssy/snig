local mason = require('mason')

local mason_lspconfig = require('mason-lspconfig')

local servers = {
  'gopls',
  'rust_analyzer',
  'jsonls',
  'sumneko_lua',
}

local mason_settings = {
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '◍',
      package_pending = '◍',
      package_uninstalled = '◍',
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(mason_settings)
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig = require('lspconfig')

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require('configs.lsp.handlers').on_attach,
    capabilities = require('configs.lsp.handlers').capabilities,
  }

  local settings = string.format('configs.lsp.settings.%s', server)

  if server == 'rust_analyzer' then
    local rust_opts = require(settings)
    local rust_tools = require('rust-tools')
    rust_tools.setup(rust_opts)
    goto continue
  end

  local found, srv_opts = pcall(require, settings)
  if found then
    opts = vim.tbl_deep_extend('force', opts, srv_opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end
