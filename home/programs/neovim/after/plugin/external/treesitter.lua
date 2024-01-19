require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

require("ts_context_commentstring").setup({})

vim.g.skip_ts_context_commentstring_module = true
