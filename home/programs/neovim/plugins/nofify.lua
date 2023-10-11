local notify = require("notify")
vim.notify = notify

require("notify").setup({
  background_colour = "#000000",
  fps = 60,
  minimum_width = 0,
  render = "minimal",
  stages = "fade_in_slide_out",
  timeout = 0,
})
