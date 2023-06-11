local utils = require("config.utils")
local cmake_and_cpp_file_types = utils.array.union(utils.file_types.cmake_file_types, utils.file_types.cpp_file_types)

return {
  {
    "Shatur/neovim-cmake",
    ft = cmake_and_cpp_file_types,
    config = function()
      require("config.build.nvim-cmake")
    end,
  },
}
