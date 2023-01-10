vim.g.mapleader = ' '

local options = {
  nu = true,
  relativenumber = true,

  termguicolors = true,

  cmdheight = 1,
  swapfile = false,
  wrap = false,
  undofile = true,
  scrolloff = 8,
  sidescrolloff = 5,

  fileencoding = 'utf-8',
  clipboard = 'unnamedplus',
  colorcolumn = '80',
  cursorline = true,
  conceallevel = 0,

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  hlsearch = false,
  incsearch = true,
  smartindent = true,
  smartcase = true,

  splitbelow = true,
  splitright = true,

  timeoutlen = 250,
  updatetime = 250,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
