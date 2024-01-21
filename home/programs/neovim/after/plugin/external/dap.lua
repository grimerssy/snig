local dap = require("dap")
local dapui = require("dapui")

local map = vim.keymap.set

map("n", "<leader>dc", dap.continue)
map("n", "<leader>ds", dap.step_over)
map("n", "<leader>di", dap.step_into)
map("n", "<leader>do", dap.step_out)
map("n", "<leader>b", dap.toggle_breakpoint)
map("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
map("n", "<leader>dl", function()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
map("n", "<leader>dr", dap.repl.open)
map("n", "<leader>dd", dap.disconnect)

dapui.setup({})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

require("dap-go").setup()
