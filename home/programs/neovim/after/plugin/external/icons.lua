local devicons = require("nvim-web-devicons")

local icons = {
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
}

if devicons.has_loaded then
  devicons.set_icon(icons)
else
  devicons.setup({ strict = true, override_by_extension = icons })
end
