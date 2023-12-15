return {
  {
    "LazyVim/LazyVim",
    dependencies = {
      { "olimorris/onedarkpro.nvim", priority = 1000},
      { "rebelot/kanagawa.nvim", priority = 998 },
      {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 999,
        config = function(_,opts)
          require("catppuccin").setup(opts)
          require("catppuccin").setup({
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
          })
        end,
      },
    },
    opts = {
      colorscheme = "onedark_vivid",
    },
  },
}
