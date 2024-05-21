local lspzero = require("lsp-zero")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

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

local function format()
  vim.lsp.buf.format({
    filter = function(client)
      return client.supports_method("textDocument/formatting")
          and client.name ~= "tsserver"
    end,
  })
end

lspzero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  lspzero.default_keymaps(opts)
  map("n", "<leader>;", format, opts)
  map("n", "<leader>n", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "gr", telescope("references"), opts)
  map("n", "gi", telescope("implementations"), opts)
  map("n", "<C-h>", vim.lsp.buf.hover, opts)
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  if client.name == "texlab" then
    map("n", "<leader>b", vim.cmd.TexlabBuild, opts)
    map("n", "<leader>o", vim.cmd.TexlabForward, opts)
  end
end)

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
  },
})

lspconfig.jsonls.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.dockerls.setup({})
lspconfig.bashls.setup({})
lspconfig.ccls.setup({})
lspconfig.gopls.setup({})
lspconfig.tsserver.setup({})

lspconfig.nil_ls.setup({
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      completion = {
        postfix = {
          enable = false,
        },
      },
      checkOnSave = {
        command = "clippy",
      },
      files = {
        excludeDirs = {
          ".direnv",
        },
      },
    },
  },
})

lspconfig.texlab.setup({
  settings = {
    texlab = {
      build = {
        executable = "tectonic",
        args = { "%f" },
      },
      forwardSearch = {
        executable = "open",
        args = { "%p" },
      },
    },
  },
})
