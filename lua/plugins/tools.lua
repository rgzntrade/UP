return {
  {
    "voldikss/vim-translator",
    lazy = false,
  },
  {
    "potamides/pantran.nvim",
    lazy = false,
    config = function()
      require("pantran").setup({
        -- 设置默认翻译引擎，可选值: "apertium", "argos", "deepl", "google", "yandex"
        default_engine = "argos",
        -- 配置命令行为
        command = {
          default_mode = "hover",
        },
        -- 配置 curl 命令行为
        -- curl = {
        --   cmd = "curl",
        --   retry = 3,
        --   timeout = 15,
        --   user_args = {},
        -- },
        -- 配置帮助窗口外观
        -- help = {
        --   separator = " ► ",
        -- },
        -- -- 配置交互式用户界面外观
        -- ui = {
        --   width_percentage = 0.6,
        --   height_percentage = 0.3,
        -- },
        -- -- 配置选择模式
        -- select = {
        --   prompt_prefix = "> ",
        --   selection_caret = "► ",
        -- },
        -- -- 配置浮动窗口
        -- window = {
        --   title_border = { "┤ ", " ├" },
        --   window_config = {
        --     relative = "editor",
        --     border = "single",
        --   },
        --   options = {
        --     number = false,
        --     relativenumber = false,
        --     cursorline = false,
        --     cursorcolumn = false,
        --     linebreak = true,
        --     breakindent = true,
        --     wrap = true,
        --     foldcolumn = "0",
        --     signcolumn = "auto",
        --     colorcolumn = "",
        --     fillchars = "eob: ",
        --     winhighlight = "Normal:PantranNormal,SignColumn:PantranNormal,FloatBorder:PantranBorder",
        --     textwidth = 0,
        --   },
        -- },
        -- 配置各个翻译引擎
        -- test
        engines = {
          -- 配置 DeepL 引擎
          argos = {
            default_source = "auto",
            default_target = "zh",
          },
          -- 配置 Yandex 翻译引擎
          yandex = {
            default_source = vim.NIL,
            default_target = "zh",
            -- iam_token = vim.env.YANDEX_IAM_TOKEN,
            -- api_key = vim.env.YANDEX_API_KEY,
            -- folder_id = vim.env.YANDEX_FOLDER_ID,
            format = "PLAIN_TEXT",
            fallback = {
              default_source = "auto",
              default_target = "zh-CN",
            },
          },
          -- 配置 Google 翻译引擎
          google = {
            default_source = vim.NIL,
            default_target = "zh-CN",
            -- bearer_token = vim.env.GOOGLE_BEARER_TOKEN,
          },
        },
        -- 配置按键绑定和相关选项
        -- controls = {
        --   updatetime = 300,
        --   mappings = {
        --     edit = {
        --       i = {
        --         ["<C-c>"] = pantran.ui.actions.close,
        --         ["<C-_>"] = pantran.ui.actions.help,
        --         ["<C-y>"] = pantran.ui.actions.yank_close_translation,
        --         ["<M-y>"] = pantran.ui.actions.yank_close_input,
        --         ["<C-r>"] = pantran.ui.actions.replace_close_translation,
        --         ["<M-r>"] = pantran.ui.actions.replace_close_input,
        --         ["<C-a>"] = pantran.ui.actions.append_close_translation,
        --         ["<M-a>"] = pantran.ui.actions.append_close_input,
        --         ["<C-e>"] = pantran.ui.actions.select_engine,
        --         ["<C-s>"] = pantran.ui.actions.select_source,
        --         ["<C-t>"] = pantran.ui.actions.select_target,
        --         ["<M-s>"] = pantran.ui.actions.switch_languages,
        --         ["<M-t>"] = pantran.ui.actions.translate,
        --       },
        --       n = {
        --         ["q"] = pantran.ui.actions.close,
        --         ["<Esc>"] = pantran.ui.actions.close,
        --         ["g?"] = pantran.ui.actions.help,
        --         ["gy"] = pantran.ui.actions.yank_close_translation,
        --         ["gY"] = pantran.ui.actions.yank_close_input,
        --         ["gr"] = pantran.ui.actions.replace_close_translation,
        --         ["gR"] = pantran.ui.actions.replace_close_input,
        --         ["ga"] = pantran.ui.actions.append_close_translation,
        --         ["gA"] = pantran.ui.actions.append_close_input,
        --         ["ge"] = pantran.ui.actions.select_engine,
        --         ["gs"] = pantran.ui.actions.select_source,
        --         ["gt"] = pantran.ui.actions.select_target,
        --         ["gS"] = pantran.ui.actions.switch_languages,
        --         ["gT"] = pantran.ui.actions.translate,
        --       },
        --     },
        --   },
        -- },
      })
    end,
  },
  {
    "mason-org/mason.nvim",
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
        "xmlformatter",
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

  { "meznaric/key-analyzer.nvim", opts = {} },

  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      -- your config goes here
      -- or just leave it empty :)
      debounce_delay = 10000,
    },
  },
}
