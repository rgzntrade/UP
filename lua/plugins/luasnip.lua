return {
  {
    -- 不添加会出现一个奇怪的错误
    "L3MON4D3/LuaSnip",
    -- build = "",
    -- 这样tab才有效
    keys = function()
      return {}
    end,
    -- 新增自定义的代码片段
    config = function(_, opts)
      -- require("luasnip").setup(opts)
      require("config/snip/cpp/gtest")
    end,
  },
}
