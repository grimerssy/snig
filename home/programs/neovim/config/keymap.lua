vim.g.mapleader = " "

local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true, silent = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local map = {
  n = bind("n"),
  i = bind("i"),
  v = bind("v"),
  t = bind("t"),
  x = bind("x"),
}

map.n("<leader>so", ":luafile %<CR>")
map.n("<C-r>", ":redo<CR>")
map.n("<C-d>", "<C-d>zzzv")
map.n("<C-u>", "<C-u>zzzv")
map.n("n", "nzzzv")
map.n("N", "Nzzzv")
map.n("<C-j>", "cnext<CR>zz")
map.n("<C-k>", "cprev<CR>zz")
-- TODO: remap to default lsp rename
map.n("<leader>n", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- to not overlap with lsp remaps
map.n("<leader>rn", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map.n("<leader>x", ":!chmod u+x %<CR>")
map.n("<leader>lk", ":!tectonic %<CR>")
map.n("<leader>lo", ":!open <C-r>=expand('%:r')<CR>.pdf &<CR>")

map.i("jk", "<ESC>")
map.i("<C-j>", "j")

map.v("jk", "<ESC>")
map.v("<C-j>", "j")
map.v("<C-k>", "k")
map.v("<", "<gv")
map.v(">", ">gv")

map.x("jk", "<ESC>")
map.x("<C-j>", "j")
map.x("<C-k>", "k")
map.x("<leader>p", '"_dP')

return map
