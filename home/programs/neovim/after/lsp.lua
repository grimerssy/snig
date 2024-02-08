local lsp_zero = require("lsp-zero")
local lsp_config = require("lspconfig")

local map = vim.keymap.set

require("crates").setup()

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})

local function telescope(command)
  return function()
    vim.cmd.Telescope("lsp_" .. command)
  end
end

lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp_zero.default_keymaps(opts)
  map("n", "<C-h>", vim.lsp.buf.hover, opts)
  map("n", "<leader>n", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "gr", telescope("references"), opts)
  map("n", "gi", telescope("implementations"), opts)
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

local servers = {
  ltex = {},
  nil_ls = {},
  gopls = {},
  tsserver = {},
  tailwindcss = {},
  clangd = {},
  bashls = {},
  jsonls = {
    init_options = {
      provideFormatter = false,
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        format = {
          enable = false,
        },
      },
    },
  },
  rust_analyzer = {
    on_init = function(client, _)
      client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}

local function read_local_settings()
  local path = vim.fn.getcwd() .. "/.lsp-settings.json"
  local file = io.open(path, "r")
  if not file then
    return nil
  end
  local content = file:read("*all")
  file:close()
  local success, settings = pcall(vim.fn.json_decode, content)
  if not success or type(settings) ~= "table" then
    vim.notify("Failed to parse local settings", vim.log.levels.WARN)
    return nil
  end
  return settings
end

local local_settings = read_local_settings() or {}

for server, config in pairs(servers) do
  config.settings =
    vim.tbl_extend("force", config.settings or {}, local_settings)
  if server == "rust_analyzer" then
    RAC = config
  end
  lsp_config[server].setup(config)
end
