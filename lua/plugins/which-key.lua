return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- keys = { "<leader>", " " },
    config = function(_,opts)
      require("which-key").setup(opts)
      require("config.which-key")
    end,
  },
}
