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

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
  },
})

lspzero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  lspzero.default_keymaps(opts)
  map("n", "<C-h>", vim.lsp.buf.hover, opts)
  map("n", "<leader>n", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "gr", telescope("references"), opts)
  map("n", "gi", telescope("implementations"), opts)
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  map("n", "<leader>;", function()
    vim.lsp.buf.format({
      filter = function(client)
        return client.supports_method("textDocument/formatting")
      end,
    })
  end, opts)
  map("n", "<leader>b", vim.cmd.TexlabBuild, opts)
end)

local servers = {
  ltex = {},
  jsonls = {},
  tailwindcss = {},
  dockerls = {},
  bashls = {},
  ccls = {},
  gopls = {},
  tsserver = {},
  nil_ls = {
    settings = {
      ["nil"] = {
        formatting = {
          command = {
            "nixpkgs-fmt"
          }
        }
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  rust_analyzer = {
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
  },
  texlab = {
    settings = {
      texlab = {
        build = {
          executable = "tectonic",
          args = { "%f" },
          forwardSearchAfter = true,
        },
        forwardSearch = {
          executable = "open",
          args = { "%p" },
        },
      },
    },
  },
}

for server, config in pairs(servers) do
  lspconfig[server].setup(config)
end
