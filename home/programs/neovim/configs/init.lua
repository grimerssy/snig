local configs = {
  "loader",
  "options",
  "notify",

  "cmp",
  "lsp",
  "dap",
  "luasnip",

  "telescope",
  "treesitter",
  "comment",
  "harpoon",

  "icons",
  "catppuccin",
  "oil",
  "lualine",
  "gitsigns",
  "dressing",
  "scrollbar",

  "remap",
  "yankhl",
}

for _, name in ipairs(configs) do
  require("configs." .. name)
end
