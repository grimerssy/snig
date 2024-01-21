-- TODO: jsonls

require("lsp-zero").setup_servers({
  "nil_ls",
  "ltex",
  "rust_analyzer", -- TODO: probably custom config
  -- "gopls",
  "sourcekit",
  "elixirls",
  -- "pyright",
  "clangd",
  -- "lua_ls",
  "jdtls",
  "omnisharp",
  "bashls",
  "svelte",
  "tsserver",
  "tailwindcss",
})
