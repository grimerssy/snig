local colors = require("catppuccin.palettes.macchiato")

require("scrollbar").setup({
  handlers = {
    handle = false,
  },
  marks = {
    Search = { color = colors.peach },
    Error = { color = colors.red },
    Warn = { color = colors.yellow },
    Info = { color = colors.blue },
    Hint = { color = colors.teal },
    Misc = { color = colors.lavender },
  },
})
