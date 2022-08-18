local n = require('keymap').nnoremap

n('sw', ':BufferClose!<CR>')
n('<S-h>', ':BufferPrevious<CR>')
n('<S-l>', ':BufferNext<CR>')

local barbar = require('bufferline')

barbar.setup({
  animation = true,
  auto_hide = false,
  tabpages = false,
  closable = true,
  clickable = true,
  exclude_ft = {},
  exclude_name = {},
  icons = true,
  icon_custom_colors = true,
  icon_separator_active = '▎',
  icon_separator_inactive = ' ',
  icon_close_tab = '',
  icon_close_tab_modified = '',
  icon_pinned = '車',
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
})
