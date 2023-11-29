local webdev = require("nvim-web-devicons")

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

if webdev.has_loaded then
  webdev.set_icon(icons)
else
  webdev.setup({ strict = true, override_by_extension = icons })
end
