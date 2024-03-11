local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

vim.keymap.set("n", "<leader>;", function()
  vim.lsp.buf.format({
    filter = function(client)
      return client.supports_method("textDocument/formatting")
    end,
  })
end)

null_ls.setup({
  sources = {
    code_actions.shellcheck,
    formatting.alejandra,
    formatting.stylua,
    formatting.prettier,
    formatting.rustfmt,
    formatting.goimports,
    formatting.gofumpt,
    formatting.jq,
    formatting.buf,
    formatting.mix,
    formatting.black,
    formatting.djhtml,
    formatting.rustywind.with({
      extra_filetypes = { "htmldjango" },
    }),
    diagnostics.staticcheck,
    diagnostics.buf,
    diagnostics.codespell.with({
      extra_args = {
        "--check-filenames",
        "--ignore-words-list",
        "crate",
      },
    }),
  },
})
