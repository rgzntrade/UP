local M = {}

M.python = {
  type = "executable",
  command = "python",
  -- args = { "-m", vim.fn.stdpath "data" .. "/mason/packages/debugpy/debugpy" },
  args = { "-m", "debugpy.adapter" },
}

M.python = {
  -- launch exe
  {
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",
    program = "${file}", -- This configuration will launch the current file if used.
    cwd = vim.fn.getcwd(),
    args = function()
      local input = vim.fn.input("Input args: ")
      return require("config.debug-dap.dap-util").str2argtable(input)
    end,
    pythonPath = function()
      local venv_path = os.getenv("VIRTUAL_ENV")
      if venv_path then
        return venv_path .. "/bin/python"
      end
      return "/usr/bin/python"
    end,
  },
}

return M
