require("catppuccin").setup({
  transparent_background = true,
  custom_highlights = function(colors)
    return {
      Macro = { fg = colors.sky },
      StorageClass = { fg = colors.mauve },
      CmpItemKindStruct = { fg = colors.yellow },
      CmpItemKindEnum = { fg = colors.yellow },
      CmpItemKindEnumMember = { fg = colors.peach },
      CmpItemKindInterface = { fg = colors.green },
      ["@function.builtin"] = { link = "Function" },
      ["@function.macro"] = { link = "Macro" },
      ["@lsp.typemod.macro.defaultLibrary"] = { link = "Macro" },
    }
  end,
  integrations = {
    notify = true,
    harpoon = true,
  },
})
