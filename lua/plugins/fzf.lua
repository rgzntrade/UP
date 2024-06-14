return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    optional = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- 放在defaults中可以解决一些冲突问题
      defaults = {
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
            ["ctrl-n"] = "down", -- 绑定 ctrl-n 到移动到下一个结果
            ["ctrl-p"] = "up", -- 绑定 ctrl-p 到移动到上一个结果
          },
        },
      },
      git = {
        files = {
          fzf_opts = {
            ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-git-files-history",
          },
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
