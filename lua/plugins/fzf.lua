return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    optional = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      winopts = {
        -- split = "belowright new",
        fullscreen = true, -- start fullscreen?
        preview = {
          vertical = "up:60%", -- up|down|left|right|top|bottom
          horizontal = "right:60%", -- up|down|left|right|top|bottom
          layout = "vertical", -- horizontal|vertical
        },
      },
      grep = {
        actions = {
          ["alt-g"] = { require("fzf-lua.actions").grep_lgrep },
        },
      },
    },
  },
}
