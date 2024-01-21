local copilot = require("copilot")

local map = vim.keymap.set

map("n", "<leader>ce", function()
  vim.cmd("Copilot enable")
  vim.notify("Copilot enabled")
end)

map("n", "<leader>cd", function()
  vim.cmd("Copilot disable")
  vim.notify("Copilot disabled")
end)

copilot.setup({
  panel = { enabled = false },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<TAB>",
      dismiss = "<S-TAB>",
    },
  },
  filetypes = {
    toml = function()
      local filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
      return string.match(filename, "Cargo.toml") == nil
    end,
  },
})
