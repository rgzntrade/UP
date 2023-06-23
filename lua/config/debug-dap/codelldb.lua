local M = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    -- args = function()
    --  local input = vim.fn.input("Input args: ")
    --  return require("debug-dap.dap-util").str2argtable(input)
    -- end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    stopOnThrow = false,
    setupCommands = {
      {
        description = "enable pretty printing",
        text = "-enable-pretty-printing",
        ignoreFailures = false,
      },
    },
  },
  -- attach process
  {
    name = "Attach process",
    type = "codelldb",
    request = "attach",
    stopOnThrow = false,
    processId = require("dap.utils").pick_process,
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    setupCommands = {
      {
        description = "enable pretty printing",
        text = "-enable-pretty-printing",
        ignoreFailures = false,
      },
    },
  },
}

return M
