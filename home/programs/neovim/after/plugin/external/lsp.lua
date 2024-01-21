local lsp_zero = require("lsp-zero")

local map = vim.keymap.set

local function telescope(command)
  return function()
    vim.cmd.Telescope("lsp_" .. command)
  end
end

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  lsp_zero.default_keymaps(opts)
  map("n", "<C-h>", vim.lsp.buf.hover, opts)
  map("n", "<leader>n", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "gr", telescope("references"), opts)
  map("n", "gi", telescope("implementations"), opts)
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
