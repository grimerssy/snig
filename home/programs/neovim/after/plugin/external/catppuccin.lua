require("catppuccin").setup({
  flavour = "macchiato",
  transparent_background = true,
  term_colors = true,
  styles = {
    comments = { "italic" },
    functions = { "italic" },
    keywords = { "italic" },
  },
  custom_highlights = function(colors)
    return {
      CursorLine = { bg = colors.none },
      ColorColumn = { bg = colors.none },
      StorageClass = { fg = colors.mauve },
      CmpItemKindStruct = { fg = colors.yellow },
      CmpItemKindEnum = { fg = colors.yellow },
      CmpItemKindEnumMember = { fg = colors.peach },
      CmpItemKindInterface = { fg = colors.green },
      ["@function.builtin"] = { link = "Function" },
    }
  end,
  integrations = {
    notify = true,
    harpoon = true,
  },
})

vim.cmd.colorscheme("catppuccin")
