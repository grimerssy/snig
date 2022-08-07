vim.g.mapleader = ' '

local options = {
  nu = true,
  relativenumber = true,

  cmdheight = 2,
  swapfile = false,
  wrap = false,
  undofile = true,
  scrolloff = 15,
  sidescrolloff = 10,

  fileencoding = 'utf-8',
  clipboard = 'unnamedplus',
  mouse = 'a',
  colorcolumn = '80',
  cursorline = true,
  conceallevel = 0,

  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  hlsearch = false,
  incsearch = true,
  smartindent = true,
  smartcase = true,

  splitbelow = true,
  splitright = true,

  timeoutlen = 300,
  updatetime = 300,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

