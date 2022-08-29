local n = require('keymap').nnoremap
local i = require('keymap').inoremap
local v = require('keymap').vnoremap

n('<leader>so', '<CMD>w<CR><CMD>luafile %<CR>')
n('<C-r', '<CMD>redo<CR>')
n('<C-h>', '<C-w>h')
n('<C-j>', '<C-w>j')
n('<C-k>', '<C-w>k')
n('<C-l>', '<C-w>l')

i('jk', '<ESC>')

v('jk', '<ESC>')
v('<', '<gv')
v('>', '>gv')
