local M = {}

local keymap = require('keymap')
local n = keymap.nnoremap
local i = keymap.inoremap

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  vim.diagnostic.config({
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

local function lsp_highlight_document(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps()
  i('<C-h>', vim.lsp.buf.signature_help)
  n('<C-h>', vim.lsp.buf.hover)
  n('<leader>d', vim.lsp.buf.definition)
  n('<leader>r', '<CMD>Telescope lsp_references theme=dropdown<CR>')
  n('<leader>ca', vim.lsp.buf.code_action)
  n('<leader>n', vim.lsp.buf.rename)
  n('<leader>vws', vim.lsp.buf.workspace_symbol)
  n('<leader>vd', vim.diagnostic.open_float)
  n('[d', vim.diagnostic.goto_next)
  n(']d', vim.diagnostic.goto_prev)
  n('<leader>co', function()
    vim.lsp.buf.code_action({
      filter = function(code_action)
        if not code_action or not code_action.data then
          return false
        end

        local data = code_action.data.id
        return string.sub(data, #data - 1, #data) == ':0'
      end,
      apply = true,
    })
  end)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, _)
  local ignore = require('lsp.servers')
  for _, srv in ipairs(ignore) do
    if srv == client.name then
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
    end
  end
  lsp_keymaps()
  lsp_highlight_document(client)
  vim.notify_once(string.format('%s is attached', client.name))
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require('cmp_nvim_lsp')

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
