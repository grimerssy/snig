local crates = require("crates")

local map = vim.keymap.set

local function double(f)
  return function()
    f()
    f()
  end
end

local opts = { buffer = true }

map("n", "<leader>rs", [[:s/{.*version.*=.*\("[0-9\.]\+"\).*}/\1<CR>]], opts)

map("n", "<leader>rt", crates.toggle, opts)
map("n", "<leader>rr", crates.reload, opts)

map("n", "<leader>rv", double(crates.show_versions_popup), opts)
map("n", "<leader>rf", double(crates.show_features_popup), opts)
map("n", "<leader>rd", double(crates.show_dependencies_popup), opts)

map("n", "<leader>ru", crates.update_crate, opts)
map("n", "<leader>ra", crates.update_all_crates, opts)
map("n", "<leader>rU", crates.upgrade_crate, opts)
map("n", "<leader>rA", crates.upgrade_all_crates, opts)

map("v", "<leader>ru", crates.update_crates, opts)
map("v", "<leader>rU", crates.upgrade_crates, opts)

map("n", "<leader>rx", crates.expand_plain_crate_to_inline_table, opts)
map("n", "<leader>rX", crates.extract_crate_into_table, opts)

map("n", "<leader>rH", crates.open_homepage, opts)
map("n", "<leader>rR", crates.open_repository, opts)
map("n", "<leader>rD", crates.open_documentation, opts)
map("n", "<leader>rC", crates.open_crates_io, opts)
