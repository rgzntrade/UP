return {
  {
    "CRAG666/code_runner.nvim",
    config = true,
    opts = {
    filetype = {
    --     java = {
    --       "cd $dir &&",
    --       "javac $fileName &&",
    --       "java $fileNameWithoutExt",
    --     },
    --     python = "python3 -u",
    --     typescript = "deno run",
    --     rust = {
    --       "cd $dir &&",
    --       "rustc $fileName &&",
    --       "$dir/$fileNameWithoutExt",
    --     },
    cpp = {
      "cd $dir &&",
      "g++ -std=c++17 -pthread $fileName",
      "-o $fileNameWithoutExt &&",
      "$dir/$fileNameWithoutExt"
    },
       },
       -- 可以根据需要添加更多语言的配置
     },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    config = function()
      require("ts_context_commentstring").setup({
        config = { cpp = { __default = "// %s", __multiline = "// %s" } },
      })
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
      ---@type string
      arg = "leetcode.nvim",

      ---@type lc.lang
      lang = "cpp",

      cn = { -- leetcode.cn
        enabled = true, ---@type boolean
        translator = true, ---@type boolean
        translate_problems = true, ---@type boolean
      },
    },
  },
}
