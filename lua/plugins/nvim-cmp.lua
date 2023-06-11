return {
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        event = "InsertEnter",
        config = function()
          local tabnine = require("cmp_tabnine.config")
          tabnine:setup({}) -- put your options here
        end,
      },
      {
        "jcdickinson/codeium.nvim",
        event = "InsertEnter",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        config = function()
          require("codeium").setup({})
        end,
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources =
        cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" }, { name = "cmp-tabnine" } }))
    end,
  },
  {
    "stevearc/dressing.nvim",
  },
}
