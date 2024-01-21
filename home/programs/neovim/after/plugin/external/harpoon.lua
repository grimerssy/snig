local harpoon, harpoon_ui = require("harpoon.mark"), require("harpoon.ui")

local map = vim.keymap.set

map("n", "<leader>m", harpoon.add_file)
map("n", "<leader>e", harpoon_ui.toggle_quick_menu)

local function nav_file(file)
  return function()
    harpoon_ui.nav_file(file)
  end
end

map("n", "<S-h>", nav_file(1))
map("n", "<S-j>", nav_file(2))
map("n", "<S-k>", nav_file(3))
map("n", "<S-l>", nav_file(4))
