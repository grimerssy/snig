local map = vim.keymap.set

map({ "i", "s", "v", "x" }, "jk", [[<ESC>]])
map({ "v", "s", "x" }, "<C-j>", [[j]])
map({ "v", "s", "x" }, "<C-k>", [[k]])

map("n", "<C-r>", [[:redo<CR>]])
map("n", "<C-d>", [[<C-d>zzzv]])
map("n", "<C-u>", [[<C-u>zzzv]])
map("n", "n", [[nzzzv]], { silent = true })
map("n", "N", [[Nzzzv]], { silent = true })
map("n", "<C-j>", [[cnext<CR>zz]])
map("n", "<C-k>", [[cprev<CR>zz]])
map("n", "<leader>rn", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
map("n", "<leader>x", [[:!chmod u+x %<CR>]])
map("n", "<leader>lk", [[:!tectonic %<CR>]])
map("n", "<leader>lo", [[:!open <C-r>=expand('%:r')<CR>.pdf &<CR>]])

map("v", "<", [[<gv]])
map("v", ">", [[>gv]])

map("x", "<leader>p", [["_dP]])
