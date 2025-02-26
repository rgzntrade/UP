return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
        other_win_hl_color = "#3f3f3f",
        current_win_hl_color = "#3b4261",
        -- 有很多动态的小窗口，太小的就过滤了
        filter_func = function(window_ids, filters)
          local valid_windows = {}
          for _, win_id in ipairs(window_ids) do
            local width = vim.api.nvim_win_get_width(win_id)
            local height = vim.api.nvim_win_get_height(win_id)
            if width >= 3 and height >= 3 then
              table.insert(valid_windows, win_id)
            end
          end
          return valid_windows
        end,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "notify" },

            -- if the file type is one of following, the window will be ignored
            buftype = { "terminal", "none-ls", "colorful-winsep" },
          },
        },
      })
    end,
  },
  -- {
  --   "folke/drop.nvim",
  --   event = "VimEnter",
  --   opts = {
  --     ---@type DropTheme|string
  --     theme = "spring", -- can be one of rhe "leaves", "snow", "stars", "xmas", "spring", "summer" themes, or a custom theme
  --     max = 40, -- maximum number of drops on the screen
  --     interval = 150, -- every 150ms we update the drops
  --     screensaver = 1000 * 60 * 60, -- show after 5 minutes. Set to false, to disable
  --     filetypes = { "starter" }, -- will enable/disable automatically for the following filetypes
  --   },
  -- },
  -- 用新的甜甜圈
  -- {
  --   "NStefan002/donut.nvim",
  --   version = "*",
  --   lazy = false,
  --   opts = {
  --     timeout = 1500, sync_donuts = false,
  --   },
  -- },
  -- Lua
  {
    "petertriho/nvim-scrollbar",
    opts = {},
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      -- require('hlslens').setup() is not required
      require("scrollbar.handlers.search").setup({
        -- hlslens config overrides
      })
    end,
  },
  {
    "anuvyklack/windows.nvim",
    -- 自动调整大小作用不明显
    enabled = false,
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require("windows").setup({
        autowidth = { --		       |windows.autowidth|
          enable = true,
          winwidth = 3, --		        |windows.winwidth|
          filetype = { --	      |windows.autowidth.filetype|
            help = 2,
          },
        },
        ignore = { --			  |windows.ignore|
          buftype = { "quickfix" },
          filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
        },
        animation = {
          enable = true,
          duration = 300,
          fps = 30,
          easing = "in_out_sine",
        },
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup()
    end,
  },
  -- {
  --   "nvimdev/dashboard-nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     local logo = [[
  --  ██╗    ███╗    ██╗   ██╗██████╗     ███╗    ██╗ 
  -- ██╔╝    ██╔╝    ██║   ██║██╔══██╗    ╚██║    ╚██╗
  -- ██║     ██║     ██║   ██║██████╔╝     ██║     ██║
  -- ██║     ██║     ██║   ██║██╔═══╝      ██║     ██║
  -- ╚██╗    ███╗    ╚██████╔╝██║         ███║    ██╔╝
  --  ╚═╝    ╚══╝     ╚═════╝ ╚═╝         ╚══╝    ╚═╝ 
  --     ]]
  --
  --     logo = string.rep("\n", 8) .. logo .. "\n\n"
  --     opts.config.header = vim.split(logo, "\n")
  --   end,
  -- },
  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, opts)
  --     local dashboard = require("alpha.themes.dashboard")
  --     local logo = [[
  --
  --     ██╗    ███╗    ██╗   ██╗██████╗     ███╗    ██╗
  --    ██╔╝    ██╔╝    ██║   ██║██╔══██╗    ╚██║    ╚██╗
  --   ██╔╝     ██║     ██║   ██║██████╔╝     ██║     ╚██╗
  --   ╚██╗     ██║     ██║   ██║██╔═══╝      ██║     ██╔╝
  --    ╚██╗    ███╗    ╚██████╔╝██║         ███║    ██╔╝
  --     ╚═╝    ╚══╝     ╚═════╝ ╚═╝         ╚══╝    ╚═╝
  --
  --     ]]
  --     dashboard.section.header.val = vim.split(logo, "\n")
  --   end,
  -- },
  -- {
  --   "mawkler/modicator.nvim",
  --   evnet = "VeryLazy",
  --   init = function()
  --     -- These are required for Modicator to work
  --     vim.o.cursorline = true
  --     vim.o.number = true
  --     vim.o.termguicolors = true
  --   end,
  --   config = function()
  --     require("modicator").setup()
  --   end,
  -- },
  {
    "gen740/SmoothCursor.nvim",
    -- enabled = false,
    opts = {
      fancy = {
        enable = true,
      },
    },
  },
  { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },

  {
  "sphamba/smear-cursor.nvim",
  opts = {
  }
  }
}
