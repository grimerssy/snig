local keymap = require("config.keymap")
local n = keymap.nnoremap
local i = keymap.inoremap
local v = keymap.vnoremap
local x = keymap.xnoremap

n("<leader>so", ":luafile %<CR>")
n("<C-r>", ":redo<CR>")
n("<C-d>", "<C-d>zzzv")
n("<C-u>", "<C-u>zzzv")
n("n", "nzzzv")
n("N", "Nzzzv")
n("<C-j>", "cnext<CR>zz")
n("<C-k>", "cprev<CR>zz")
n("<leader>n", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- to not overlap with lsp remaps
n("<leader>rn", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
n("<leader>x", ":!chmod u+x %<CR>")
n("<leader>lk", ":!tectonic %<CR>")
n("<leader>lo", ":!open <C-r>=expand('%:r')<CR>.pdf &<CR>")

i("jk", "<ESC>")
i("<C-j>", "j")

v("jk", "<ESC>")
v("<C-j>", "j")
v("<C-k>", "k")
v("<", "<gv")
v(">", ">gv")

x("jk", "<ESC>")
x("<C-j>", "j")
x("<C-k>", "k")
x("<leader>p", '"_dP')
