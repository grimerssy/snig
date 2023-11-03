local n = require("config.keymap").nnoremap

n("<leader>ce", function()
  vim.cmd("Copilot enable")
  vim.notify("Copilot enabled")
end)

n("<leader>cd", function()
  vim.cmd("Copilot disable")
  vim.notify("Copilot disabled")
end)
