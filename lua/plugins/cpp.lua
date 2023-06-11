local utils = require("config.utils")

return {
  {
    "d86leader/vim-cpp-helper",
    ft = utils.cpp_file_types,
  },

  {
    "p00f/clangd_extensions.nvim",
    ft = utils.cpp_file_types,
    config = function()
      require("config.lsp.clangd-extension")
    end,
  },
}
