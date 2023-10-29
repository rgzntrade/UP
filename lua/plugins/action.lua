return {
  {
    "AllenDang/nvim-expand-expr",
    keys = {
      { "<leader>ae", "<cmd>require('expand_expr').expand()<cr>", desc = "扩展表达式" },
    },
  },
  { "RutaTang/compter.nvim", config = function()
        require("compter").setup({ fallback = true,})
    end,
  }
}
