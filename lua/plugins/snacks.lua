return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
   ██╗    ███╗    ██╗   ██╗██████╗     ███╗    ██╗ 
  ██╔╝    ██╔╝    ██║   ██║██╔══██╗    ╚██║    ╚██╗
  ██║     ██║     ██║   ██║██████╔╝     ██║     ██║
  ██║     ██║     ██║   ██║██╔═══╝      ██║     ██║
  ╚██╗    ███╗    ╚██████╔╝██║         ███║    ██╔╝
   ╚═╝    ╚══╝     ╚═════╝ ╚═╝         ╚══╝    ╚═╝ 
    ]],
        },
        enabled = true,
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            -- cmd = "colorscript -e square",
            cmd = "",
            height = 10,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            height = 10,
            padding = 1,
          },
          {
            pane = 2,
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            height = 10,
            padding = 1,
          },
          -- {
          --   pane = 2,
          --   icon = " ",
          --   title = "Git Status",
          --   section = "terminal",
          --   enabled = Snacks.git.get_root() ~= nil,
          --   cmd = "git status --short --branch --renames",
          --   -- cmd = "",
          --   height = 5,
          --   padding = 1,
          --   ttl = 5 * 60,
          --   indent = 3,
          -- },
          { section = "startup" },
        },
      },
    },
  },
}
