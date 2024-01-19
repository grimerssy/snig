local servers = require("config.lsp.servers")
local lspconfig = require("lspconfig")

local opts = {}
local handlers = require("config.lsp.handlers")

for _, server in pairs(servers) do
  local settings = string.format("config.lsp.settings.%s", server)

  if server == "rust_analyzer" then
    local rust_opts = require(settings)
    local rust_tools = require("rust-tools")
    rust_tools.setup(rust_opts)
    goto continue
  end

  opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }
  local found, srv_opts = pcall(require, settings)
  if found then
    opts = vim.tbl_deep_extend("force", opts, srv_opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end

handlers.setup()
