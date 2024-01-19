local map = require("config.keymap")
local dap, dapui = require("dap"), require("dapui")

map.n("<leader>dc", dap.continue)
map.n("<leader>ds", dap.step_over)
map.n("<leader>di", dap.step_into)
map.n("<leader>do", dap.step_out)
map.n("<leader>b", dap.toggle_breakpoint)
map.n("<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
map.n("<leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
map.n("<leader>dr", dap.repl.open)
map.n("<leader>dd", dap.disconnect)

require("dap-go").setup()

dapui.setup({
  icons = { expanded = "", collapsed = "" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.7 },
        { id = "console", size = 0.3 },
      },
      size = 0.25,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local icons = {
  breakpoint = {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
  },
  breakpoint_condition = {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
  },
  breakpoint_log = {
    text = "ﯽ",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
  },
  breakpoint_rejected = {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "",
    texthl = "TSOperator",
    linehl = "",
    numhl = "",
  },
}

vim.fn.sign_define("DapBreakpoint", icons.breakpoint)
vim.fn.sign_define("DapBreakpointCondition", icons.breakpoint_condition)
vim.fn.sign_define("DapLogPoint", icons.breakpoint_log)
vim.fn.sign_define("DapBreakpointRejected", icons.breakpoint_rejected)
vim.fn.sign_define("DapStopped", icons.stopped)
