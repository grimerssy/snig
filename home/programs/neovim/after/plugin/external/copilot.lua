local map = require("config.keymap")

map.n("<leader>ce", function()
  vim.cmd("Copilot enable")
  vim.notify("Copilot enabled")
end)

map.n("<leader>cd", function()
  vim.cmd("Copilot disable")
  vim.notify("Copilot disabled")
end)
