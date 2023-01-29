return {
  'ThePrimeagen/harpoon',
  config = function()
    local n = require('keymap').nnoremap

    n('<leader>m', '<CMD>:lua require("harpoon.mark").add_file()<CR>')
    n('<leader>mm', '<CMD>:lua require("harpoon.ui").toggle_quick_menu()<CR>')

    n('<S-h>', '<CMD>:lua require("harpoon.ui").nav_file(1)<CR>')
    n('<S-j>', '<CMD>:lua require("harpoon.ui").nav_file(2)<CR>')
    n('<S-k>', '<CMD>:lua require("harpoon.ui").nav_file(3)<CR>')
    n('<S-l>', '<CMD>:lua require("harpoon.ui").nav_file(4)<CR>')
  end,
}
