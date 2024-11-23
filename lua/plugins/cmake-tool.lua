local utils = require("config.utils")
local cmake_and_cpp_file_types = utils.array.union(utils.file_types.cmake_file_types, utils.file_types.cpp_file_types)

return {
  {
    "Civitasv/cmake-tools.nvim",
    ft = cmake_and_cpp_file_types,
    opts = function(_, opts)
      local cmake = require("cmake-tools")
      opts.cmake_build_directory = function()
        if vim.fn.has("win32") == 1 then
          return "build\\${variant:buildType}"
        end
        return "build/${variant:buildType}"
      end
    end,
  },
}
