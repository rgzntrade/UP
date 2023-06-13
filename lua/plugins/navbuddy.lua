local utils = require("config.utils")

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      ft = utils.file_types.cpp_file_types,
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
    },
  },
  -- your lsp config or other stuff
}
