return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        other_win_hl_color = "#3f3f3f",
        current_win_hl_color = "#3b4261",
      })
    end,
  },
  {
    "folke/drop.nvim",
    event = "VimEnter",
    opts = {
      ---@type DropTheme|string
      theme = "spring", -- can be one of rhe "leaves", "snow", "stars", "xmas", "spring", "summer" themes, or a custom theme
      max = 40, -- maximum number of drops on the screen
      interval = 150, -- every 150ms we update the drops
      screensaver = 1000 * 60 * 60, -- show after 5 minutes. Set to false, to disable
      filetypes = { "dashboard", "starter", "dashboard-nvim" }, -- will enable/disable automatically for the following filetypes
    },
  },
  -- Lua
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      window = {
        width = 0.9,
      },
      plugins = {
        tmux = { enable = false },
      },
    },
  },
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
  {
  "nvimdev/dashboard-nvim",
  optional = true,
  opts = function(_, opts)
  local logo = [[
      ██╗    ███╗    ██╗   ██╗██████╗     ███╗    ██╗
     ██╔╝    ██╔╝    ██║   ██║██╔══██╗    ╚██║    ╚██╗
     ██╔╝     ██║     ██║   ██║██████╔╝     ██║     ╚██╗
     ╚██╗     ██║     ██║   ██║██╔═══╝      ██║     ██╔╝
     ╚██╗    ███╗    ╚██████╔╝██║         ███║    ██╔╝
      ╚═╝    ╚══╝     ╚═════╝ ╚═╝         ╚══╝    ╚═╝
      ]]
  logo = string.rep("\n", 8) .. logo .. "\n\n"
  opts.config.header = vim.split(logo, "\n")
  end,
},
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
}
