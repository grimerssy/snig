return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local ls = require('luasnip')
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    ls.add_snippets('rust', {
      s('tokio-main', {
        t('#[tokio::main]'),
        t({ '', 'async fn main() {', '    ' }),
        i(1, 'unimplemented!();'),
        t({ '', '}' }),
      }),
      s('tokio-test', {
        t('#[tokio::test]'),
        t({ '', 'async fn ' }),
        i(1, 'it_works'),
        t({ '() {', '    ' }),
        i(2, 'unimplemented!();'),
        t({ '', '}' }),
      }),
      s('sqlx-test', {
        t('#[sqlx::test]'),
        t({ '', 'async fn ' }),
        i(1, 'it_works'),
        t('('),
        i(2, 'param: Type'),
        t({ ') {', '    ' }),
        i(3, 'unimplemented!();'),
        t({ '', '}' }),
      }),
    })
  end,
}
