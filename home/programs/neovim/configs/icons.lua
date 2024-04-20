require("nvim-web-devicons").setup({
  strict = true,
  override_by_extension = {
    astro = {
      icon = "",
      color = "#ff5d01",
      name = "Astro",
    },
    gleam = {
      icon = "",
      color = "#f3b2ef",
      name = "Gleam",
    },
    hcl = {
      icon = "󱁢",
      color = "#7345b6",
      name = "Terraform",
    },
    tape = {
      icon = "󰨜",
      color = "#6948f6",
      name = "VHS",
    },
  },
})
