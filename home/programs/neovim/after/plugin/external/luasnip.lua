require("luasnip.loaders.from_vscode").lazy_load()

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  ls.jump(1)
end)

ls.add_snippets("rust", {
  s("tests", {
    t({ "#[cfg(test)]", "mod tests {", "    " }),
    i(1),
    t({ "", "}" }),
  }),
  s("tokio-main", {
    t({ "#[tokio::main]", "async fn main() {", "    " }),
    i(1, "unimplemented!();"),
    t({ "", "}" }),
  }),
  s("tokio-test", {
    t({ "#[tokio::test]", "async fn " }),
    i(1, "it_works"),
    t({ "() {", "    " }),
    i(2, "unimplemented!();"),
    t({ "", "}" }),
  }),
  s("sqlx-test", {
    t({ "#[sqlx::test]", "async fn " }),
    i(1, "it_works"),
    t("("),
    i(2, "param: Type"),
    t({ ") {", "    " }),
    i(3, "unimplemented!();"),
    t({ "", "}" }),
  }),
})
