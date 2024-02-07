require("nvim-web-devicons").setup({
  strict = true,
  override_by_extension = {
    ["astro"] = {
      icon = "",
      color = "#ff5d01",
      name = "Astro",
    },
    ["tape"] = {
      icon = "󰨜",
      color = "#6948f6",
      name = "VHS",
    },
  },
})
