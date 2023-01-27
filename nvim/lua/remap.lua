local n = require('keymap').nnoremap
local i = require('keymap').inoremap
local v = require('keymap').vnoremap
local x = require('keymap').xnoremap

n('<leader>so', '<CMD>luafile %<CR>')
n('<C-r>', '<CMD>redo<CR>')
n('<C-d>', '<C-d>zzzv')
n('<C-u>', '<C-u>zzzv')
n('n', 'nzzzv')
n('N', 'Nzzzv')
n('<C-j>', 'cnext<CR>zz')
n('<C-k>', 'cprev<CR>zz')
n('<leader>n', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
-- to not overlap with lsp remaps
n('<leader>rn', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
n('<leader>x', '<CMD>!chmod +x %<CR>')

i('jk', '<ESC>')

v('jk', '<ESC>')
v('<', '<gv')
v('>', '>gv')

x('jk', '<ESC>')
x('<leader>p', '"_dP')
