local lsp_zero = require("lsp-zero")
local lsp_config = require("lspconfig")

local map = vim.keymap.set

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

lsp_zero.setup_servers({
  "ltex",
  "nil_ls",
  "gopls",
  "tsserver",
  "tailwindcss",
  "clangd",
  "bashls",
  "jsonls",
})

lsp_config.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      format = {
        enable = false,
      },
    },
  },
})

lsp_config.rust_analyzer.setup({
  on_init = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})
require("crates").setup()
