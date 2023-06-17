return {
  {
    "LazyVim/LazyVim",
    dependencies = {
      { "olimorris/onedarkpro.nvim", priority = 999 },
      { "rebelot/kanagawa.nvim", priority = 999 },
      {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
          require("catppuccin").setup({
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
          })
        end,
      },
    },
    opts = {
      -- colorscheme = "catppuccin",
    },
  },
}
