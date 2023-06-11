return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("config.debug-dap.dap-config")
      require("config.debug-dap.dap-ui")
      require("config.debug-dap.dap-virtual-text")
      require("config.debug-dap.dap-util")
    end,
  },
}
