require("copilot").setup({
  panel = { enabled = false },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<TAB>",
      dismiss = "<S-TAB>",
    },
  },
  filetypes = {
    toml = function()
      local filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
      return string.match(filename, "Cargo.toml") == nil
    end,
  },
})
