local utils = require("config.utils")

return {
  {
    "d86leader/vim-cpp-helper",
    ft = utils.file_types.cpp_file_types,
  },
  -- 使用lazyvim的配置
  -- {
  --   "p00f/clangd_extensions.nvim",
  --   ft = utils.file_types.cpp_file_types,
  --   config = function()
  --     require("config.lsp.clangd-extension")
  --   end,
  -- },
}
