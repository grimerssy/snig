local M = {}

function M.toggle()
  local view = require('nvim-tree.view')
  if view.is_visible() then
    view.close()
  else
    require('nvim-tree').open_replacing_current_buffer(vim.fn.getcwd())
  end
end

return M
