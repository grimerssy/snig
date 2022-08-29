local map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap

local colors = require('configs.onedarkpro.colors')

require('toggleterm').setup({
  open_mapping = '<C-n>',
  hide_numbers = true,
  highlights = {
    NormalFloat = {
      guifg = colors.fg,
      guibg = colors.black,
    },
    FloatBorder = {
      guifg = colors.blue,
      guibg = colors.none,
    },
  },
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  auto_scroll = true,
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    width = 140,
    height = 40,
  },
})
map('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })

local set_terminal_keymaps = function()
  local opts = { noremap = true }
  buf_map(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  buf_map(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  buf_map(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  buf_map(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  buf_map(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*',
  callback = function()
    set_terminal_keymaps()
  end,
  desc = 'Mappings for navigation with a terminal',
})
