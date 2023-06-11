local status, dap = pcall(require, "dap")
if not status then
  vim.notify("dap not found!")
  return
end
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    -- command = vim.env.HOME .. '/.config/nvim/debug/mac/' .. 'extension/adapter/codelldb',
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    detached = false,
  },
}

-- vim.notify("dap-config")

dap.configurations.cpp = {
  -- launch exe
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
  -- attach server
}

-- setup other language
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
