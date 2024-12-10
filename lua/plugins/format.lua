return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      default_format_opts = {
        timeout_ms = 1000,
      },
      formatters_by_ft = {
        cpp = { "clang-format" },
        cmake = {
          "cmakelang",
        },
        lua = { "stylua" },
      },
      formatters = {
        clang_format = { prepend_args = { "--style=file" } },
      },
    },
  },
}
