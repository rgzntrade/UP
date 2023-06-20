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
        "pylyzer",
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
        "shellcheck",
        "stylua",
        "shfmt",
      }, -- not an option from mason.nvim
    },
  },
  {
    "ecthelionvi/NeoComposer.nvim",
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
}
