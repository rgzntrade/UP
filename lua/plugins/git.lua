return {
  -- TODO: 这样会覆盖配置，需要追加配置
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   config = function()
  --     require("scrollbar.handlers.gitsigns").setup()
  --   end,
  -- },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  -- TODO: 添加快捷键
  { "sindrets/diffview.nvim", version = "*", config = true },
}
