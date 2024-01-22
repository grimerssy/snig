for k, v in pairs({
  nu = true,
  relativenumber = true,
  signcolumn = "yes",

  termguicolors = true,

  cmdheight = 1,
  swapfile = false,
  wrap = false,
  undofile = true,
  scrolloff = 8,
  sidescrolloff = 5,

  fileencoding = "utf-8",
  clipboard = "unnamedplus",
  colorcolumn = "80",
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

  timeoutlen = 500,
  updatetime = 1000,
}) do
  vim.opt[k] = v
end
