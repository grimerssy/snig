local n = require('keymap').nnoremap
local i = require('keymap').inoremap
local v = require('keymap').vnoremap

n('sw', '<CMD>Ex<CR>')
n('<C-r', '<CMD>redo<CR>')
n('<C-h>', '<C-w>h')
n('<C-j>', '<C-w>j')
n('<C-k>', '<C-w>k')
n('<C-l>', '<C-w>l')
n('<C-j>', ':m .+1<CR>==')
n('<S-j>', ':m .-2<CR>==')

i('jk', '<ESC>')

v('jk', '<ESC>')
v('<', '<gv')
v('>', '>gv')

n('<leader>f', '<CMD>lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({ previewer = false }))<CR>')
n('<leader>t', '<CMD>Telescope live_grep theme=dropdown<CR>')

