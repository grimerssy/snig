local configs = {
  "loader",
  "options",
  "notify",

  "cmp",
  "lsp",
  "dap",
  "null_ls",
  "luasnip",
  "copilot",

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
  "yank_highlight",
}

for _, name in ipairs(configs) do
  require("configs." .. name)
end
