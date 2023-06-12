return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- keys = { "<leader>", " " },
    config = function()
      require("config.which-key")
    end,
  },
}
