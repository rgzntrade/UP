return {
  { "CRAG666/code_runner.nvim", config = true },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    config = function()
      require("ts_context_commentstring").setup({
        config = { cpp = { __default = "// %s", __multiline = "// %s" } },
      })
    end,
  },
}
