return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- keys = { "<leader>", " " },
    opts = { preset = "modern" },
    config = function(_, opts)
      require("which-key").setup(opts)
      require("config.which-key")
    end,
  },
}
