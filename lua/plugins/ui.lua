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
  {
    "gen740/SmoothCursor.nvim",
    config = function()
  require("smoothcursor").setup({
    cursorID = 1,
    type = "exp", -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

    cursor = "", -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
    texthl = "SmoothCursor", -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
    linehl = nil, -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

    fancy = {
      enable = true, -- enable fancy mode
      head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
      body = {
        { cursor = "", texthl = "SmoothCursorRed" },
        { cursor = "", texthl = "SmoothCursorOrange" },
        { cursor = "●", texthl = "SmoothCursorYellow" },
        { cursor = "●", texthl = "SmoothCursorGreen" },
        { cursor = "•", texthl = "SmoothCursorAqua" },
        { cursor = ".", texthl = "SmoothCursorBlue" },
        { cursor = ".", texthl = "SmoothCursorPurple" },
      },
      tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
    },

    matrix = { -- Loaded when 'type' is set to "matrix"
      head = {
        -- Picks a random character from this list for the cursor text
        cursor = require("smoothcursor.matrix_chars"),
        -- Picks a random highlight from this list for the cursor text
        texthl = {
          "SmoothCursor",
        },
        linehl = nil, -- No line highlight for the head
      },
      body = {
        length = 6, -- Specifies the length of the cursor body
        -- Picks a random character from this list for the cursor body text
        cursor = require("smoothcursor.matrix_chars"),
        -- Picks a random highlight from this list for each segment of the cursor body
        texthl = {
          "SmoothCursorGreen",
        },
      },
      tail = {
        -- Picks a random character from this list for the cursor tail (if any)
        cursor = nil,
        -- Picks a random highlight from this list for the cursor tail
        texthl = {
          "SmoothCursor",
        },
      },
      unstop = false, -- Determines if the cursor should stop or not (false means it will stop)
    },

    autostart = true, -- Automatically start SmoothCursor
    always_redraw = true, -- Redraw the screen on each update
    flyin_effect = nil, -- Choose "bottom" or "top" for flying effect
    speed = 25, -- Max speed is 100 to stick with your current position
    intervals = 35, -- Update intervals in milliseconds
    priority = 10, -- Set marker priority
    timeout = 3000, -- Timeout for animations in milliseconds
    threshold = 3, -- Animate only if cursor moves more than this many lines
    disable_float_win = false, -- Disable in floating windows
    enabled_filetypes = nil, -- Enable only for specific file types, e.g., { "lua", "vim" }
    disabled_filetypes = nil, -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
  })
    end,
  },
  {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
}
