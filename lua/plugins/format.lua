return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      format = {
        timeout_ms = 1000,
      },
      formatters_by_ft = {
        cpp = { "clang-format" },
      },
      formatters = {
        clang_format = { prepend_args = { "--style=file" } },
      },
    },
  },
}
