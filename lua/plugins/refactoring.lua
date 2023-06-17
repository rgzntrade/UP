return {
  {
    url = "https://github.com/ThePrimeagen/refactoring.nvim.git",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup({})
    end,
  },
}
