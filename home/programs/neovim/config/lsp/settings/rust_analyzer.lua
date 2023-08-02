local extension_path = vim.env.HOME
  .. "/.vscode/extensions/vadimcn.vscode-lldb-1.8.1"
local codelldb_path = extension_path .. "/adapter/codelldb"
local liblldb_path = extension_path .. "/lldb/lib/liblldb.dylib"
local lsp_handlers = require("config.lsp.handlers")

return {
  tools = {
    auto = false,
    inlay_hints = {
      only_current_line = false,
      auto = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = false,
      show_variable_name = false,
      parameter_hints_prefix = " ",
      other_hints_prefix = " ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
  },
  server = {
    on_attach = function(client, bufnr)
      vim.api.nvim_set_hl(0, "@lsp.type.function", {})
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end

      local n = require("config.keymap").nnoremap
      local rt = require("rust-tools")
      n("<C-h>", rt.hover_actions.hover_actions, { buffer = bufnr })
      lsp_handlers.on_attach(client, bufnr)
    end,
    capabilities = lsp_handlers.capabilities,

    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = false,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb_path,
      liblldb_path
    ),
  },
}
