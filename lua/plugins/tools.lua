return {
  {
    "voldikss/vim-translator",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "clang-format",
        "rust-analyzer",
        "rustfmt",
        "bash-language-server",
        "yaml-language-server",
        "json-lsp",
        "taplo",
        "codelldb",
        "debugpy",
        "sonarlint-language-server",
        "blue",
        "prettier",
        "cmake-language-server",
        "cmakelang",
        "cmakelint",
        "shellcheck",
        "stylua",
        "shfmt",
        "tailwindcss-language-server",
        "css-lsp",
        "html-lsp",
      }, -- not an option from mason.nvim
    },
  },
  {
    "ecthelionvi/NeoComposer.nvim",
    enabled = false,
    dependencies = { "kkharji/sqlite.lua" },
    opts = {},
  },
  {
    "smjonas/live-command.nvim",
    -- live-command supports semantic versioning via tags
    -- tag = "1.*",
    config = function()
      require("live-command").setup({
        commands = {
          Norm = { cmd = "norm" },
        },
      })
    end,
  },
  {
    "glepnir/template.nvim",
    cmd = { "Template", "TemProject" },
    config = function()
      require("template").setup({
        -- config in there
        temp_dir = "~/.config/nvim_up/lua/config/template",
        author = "rgzntrade",
      })
    end,
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>cj", "<cmd>TSJJoin<cr>", desc = "代码压缩" },
      { "<leader>cs", "<cmd>TSJSplit<cr>", desc = "代码展开" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({--[[ your config ]]
      })
    end,
  },
  -- NOTE: 与anvate插件兼容，暂时注释
  -- {
  --   "MeanderingProgrammer/markdown.nvim",
  --   name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   config = function()
  --     require("render-markdown").setup({})
  --   end,
  -- },
  {
    "quentingruber/pomodoro.nvim",
    lazy = false, -- needed so the pomodoro can start at launch
    opts = {
      start_at_launch = true,
      work_duration = 25,
      break_duration = 5,
      snooze_duration = 1, -- The additionnal work time you get when you delay a break
    },
  },
}
