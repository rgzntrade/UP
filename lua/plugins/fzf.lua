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
      keymap = {
        fzf = {
          ["down"] = "next-history", -- 下一个历史记录
          ["up"] = "previous-history", -- 上一个历史记录
        },
      },
      git = {
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-git-files-history",
        },
      },
      oldfiles = {
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-old-files-history",
        },
      },
      files = {
        default = "fd",
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
        },
      },
      grep = {
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
        },
        actions = {
          ["alt-g"] = { require("fzf-lua.actions").grep_lgrep },
        },
      },
    },
  },
}
