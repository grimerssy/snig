vim.g.copilot_enabled = false
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

local n = require("config.keymap").nnoremap

n("<leader>ce", function()
  vim.cmd("Copilot enable")
  vim.notify("Copilot enabled")
end)

n("<leader>cd", function()
  vim.cmd("Copilot disable")
  vim.notify("Copilot disabled")
end)
