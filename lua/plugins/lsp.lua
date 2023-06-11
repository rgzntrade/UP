return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "cpp", "bash", "python", "lua", "rust", "yaml", "json", "toml", "cmake" },
    },
    dependencies = {
      "romgrk/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
}
