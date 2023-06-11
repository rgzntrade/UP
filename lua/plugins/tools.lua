return {
  {
    "voldikss/vim-translator",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "clang-format",
        "rust-analyzer",
        "rustfmt",
        "pylyzer",
        "bash-language-server",
        "yaml-language-server",
        "json-lsp",
        "taplo",
        "codelldb",
        "debugpy",
        "sonarlint-language-server",
        "blue",
        "prettier",
        "cmake-language-server",
        "cmakelang",
        "shellcheck",
      }, -- not an option from mason.nvim
    },
  },
}
