local n = require("config.keymap").nnoremap

local function open()
  require("nvim-tree").open_replacing_current_buffer(vim.fn.getcwd())
end

n("<leader>e", open)

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = true,
  sort_by = "name",
  view = {
    hide_root_folder = false,
    side = "left",
    signcolumn = "yes",
    mappings = {
      list = {
        {
          key = "<CR>",
          action = "edit_in_place",
        },
        {
          key = "<C-h>",
          action = "toggle_dotfiles",
        },
        {
          key = "d",
          action = "trash",
        },
        {
          key = "D",
          action = "remove",
        },
      },
    },
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    icons = {
      webdev_colors = true,
      git_placement = "signcolumn",
      padding = " ",
      symlink_arrow = "  ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
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
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = {
            "notify",
            "packer",
            "qf",
            "diff",
            "fugitive",
            "fugitiveblame",
          },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
})
