local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

local map = vim.keymap.set

map({ "i", "s" }, "<TAB>", function() luasnip.jump(1) end)
map({ "i", "s" }, "<S-TAB>", function() luasnip.jump(-1) end)

cmp.setup({
  preselect = cmp.PreselectMode.None,
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  window = {
    completion = {
      scrollbar = false,
      scrolloff = 4,
      col_offset = -2,
    },
    documentation = {
      max_height = 15,
      max_width = 60,
    },
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = lspkind.cmp_format({
      mode = "symbol",
      maxwidth = 30,
      ellipsis_char = "...",
      before = function(_, item)
        item.menu = ""
        return item
      end,
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
  }),
})

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("rust", {
  s("tests", {
    t({ "#[cfg(test)]", "mod tests {", "    use super::*;", "", "    " }),
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
