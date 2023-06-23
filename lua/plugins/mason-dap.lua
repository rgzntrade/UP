return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = function(_, opts)
    opts.handlers = {
      function(config)
        -- all sources with no handler get passed here

        -- Keep original functionality
        require("mason-nvim-dap").default_setup(config)
      end,
      codelldb = function(config)
        config.configurations = require("config.debug-dap.codelldb")
        require("mason-nvim-dap").default_setup(config) -- don't forget this!
      end,
    }
  end,
}
