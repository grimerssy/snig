local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local n = require("config.keymap").nnoremap
n("<leader>;", function()
  vim.lsp.buf.format({
    filter = function(client)
      return client.supports_method("textDocument/formatting")
    end,
  })
end)

null_ls.setup({
  sources = {
    code_actions.shellcheck,
    formatting.nixfmt,
    formatting.stylua,
    formatting.prettier,
    formatting.jq,
    formatting.goimports,
    formatting.gofumpt,
    formatting.buf,
    formatting.rustfmt,
    formatting.mix,
    formatting.black,
    diagnostics.codespell.with({
      extra_args = {
        "--check-filenames",
        "--ignore-words-list",
        "crate",
      },
    }),
    diagnostics.staticcheck,
    diagnostics.buf,
  },
})
