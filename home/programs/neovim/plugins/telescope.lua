local n = require("config.keymap").nnoremap
n("<leader>f", ":Telescope find_files<CR>")
n("<leader>g", ":Telescope live_grep<CR>")
n("<leader>h", ":Telescope diagnostics<CR>")

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_ignore_patterns = {
      ".git/",
      "target/",
      "vendor/*",
      "%.lock",
      "%.sqlite3",
      "node_modules/*",
      "%.svg",
      "%.otf",
      "%.ttf",
      "%.webp",
      ".dart_tool/",
      ".gradle/",
      ".idea/",
      ".vscode/",
      "build/",
      "env/",
      "gradle/",
      "node_modules/",
      "%.pdb",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "smalljre_*/*",
      ".vale/",
      "%.burp",
      "%.mp4",
      "%.mkv",
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.epub",
      "%.flac",
      "%.tar.gz",
    },

    mappings = {
      n = {
        ["jk"] = actions.close,
      },
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-s>"] = actions.select_horizontal,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,
      no_ignore = true,
      no_ignore_parent = true,
      previewer = false,
    },
    live_grep = {
      theme = "dropdown",
    },
    diagnostics = {
      theme = "dropdown",
    },
  },
  extensions = {},
})

telescope.load_extension("notify")
