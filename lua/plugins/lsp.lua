return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "bash",
        "python",
        "lua",
        "rust",
        "yaml",
        "json",
        "toml",
        "cmake",
        "html",
        "javascript",
        "typescript",
        "css",
      },
    },
    dependencies = {
      "romgrk/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- TODO: 添加快捷键
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
}
