local n = require('keymap').nnoremap
local i = require('keymap').inoremap
local v = require('keymap').vnoremap

n('<C-r', '<CMD>redo<CR>')
n('<C-h>', '<C-w>h')
n('<C-j>', '<C-w>j')
n('<C-k>', '<C-w>k')
n('<C-l>', '<C-w>l')

i('jk', '<ESC>')

v('jk', '<ESC>')
v('<', '<gv')
v('>', '>gv')

n('<leader>f', '<CMD>lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({ previewer = false }))<CR>')
n('<leader>t', '<CMD>Telescope live_grep theme=dropdown<CR>')

n('<leader>e', ':NvimTreeFocus<CR>')
n('<leader>h', ':NvimTreeToggle<CR>')

n('<leader>c', ':BufferClose!<CR>')
n('<S-h>', ':BufferPrevious<CR>')
n('<S-l>', ':BufferNext<CR>')

