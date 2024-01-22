local notify = require("notify")

notify.setup({
  background_colour = "#000000",
  render = "minimal",
  timeout = 0,
})

vim.notify = notify
