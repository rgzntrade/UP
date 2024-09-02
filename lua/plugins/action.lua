return {
  {
    "AllenDang/nvim-expand-expr",
    keys = {
      { "<leader>ce", "<cmd>require('expand_expr').expand()<cr>", desc = "扩展表达式" },
    },
  },
  {
    "RutaTang/compter.nvim",
    config = function()
      require("compter").setup({ fallback = true })
    end,
  },
  {
    "mawkler/refjump.nvim",
    -- keys = { ']r', '[r' }, -- Uncomment to lazy load
    opts = {},
  },
}
