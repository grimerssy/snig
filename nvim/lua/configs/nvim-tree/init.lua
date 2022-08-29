local n = require('keymap').nnoremap

n('<leader>e', '<CMD>lua require("configs.nvim-tree.handlers").toggle()<CR>')

local nvim_tree = require('nvim-tree')

nvim_tree.setup({
  sync_root_with_cwd = true,
  auto_reload_on_write = true,
  create_in_closed_folder = true,
  disable_netrw = true,
  hijack_netrw = true,
  sort_by = 'name',
  view = {
    hide_root_folder = true,
    side = 'left',
    signcolumn = 'yes',
    mappings = {
      list = {
        {
          key = '<C-h>',
          action = 'toggle_dotfiles',
        },
        {
          key = 'H',
          action = 'harpoon_first_mark',
          action_cb = function(_)
            local ok, harpoon = pcall(require, 'harpoon.ui')
            if not ok then
              return
            end
            harpoon.nav_file(1)
          end,
        },
        {
          key = 'J',
          action = 'harpoon_second_mark',
          action_cb = function(_)
            local ok, harpoon = pcall(require, 'harpoon.ui')
            if not ok then
              return
            end
            harpoon.nav_file(2)
          end,
        },
        {
          key = 'K',
          action = 'harpoon_third_mark',
          action_cb = function(_)
            local ok, harpoon = pcall(require, 'harpoon.ui')
            if not ok then
              return
            end
            harpoon.nav_file(3)
          end,
        },
        {
          key = 'L',
          action = 'harpoon_fourth_mark',
          action_cb = function(_)
            local ok, harpoon = pcall(require, 'harpoon.ui')
            if not ok then
              return
            end
            harpoon.nav_file(4)
          end,
        },
      },
    },
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = 'none',
    root_folder_modifier = ':~',
    icons = {
      webdev_colors = true,
      git_placement = 'signcolumn',
      padding = ' ',
      symlink_arrow = '  ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '',
          staged = 'S',
          unmerged = '',
          renamed = '➜',
          deleted = '',
          untracked = 'U',
          ignored = '◌',
        },
      },
    },
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = false,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        exclude = {
          filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
  live_filter = {
    prefix = '[FILTER]: ',
    always_show_folders = true,
  },
})
