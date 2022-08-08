local barbar = require 'bufferline'

barbar.setup {
  animation = true,
  auto_hide = false,
  tabpages = false,
  closable = true,
  clickable = true,
  exclude_ft = {},
  exclude_name = {},
  icons = true,
  icon_custom_colors = false,
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
}

local nvim_tree_events = require('nvim-tree.events')
local barbar_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function()
  barbar_state.set_offset(35)
end)

nvim_tree_events.on_tree_resize(function()
  barbar_state.set_offset(36)
end)

nvim_tree_events.on_tree_close(function()
  barbar_state.set_offset(0)
end)

