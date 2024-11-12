return {
  {
    "akinsho/toggleterm.nvim",
    version = "2.*",
    opts = {
      --[[ things you want to change go here]]
      shade_terminals = false,
      float_opts = {
        border = 'curved',
      },
      -- winbar = {
      --   enabled = true,
      --   name_formatter = function(term) --  term: Terminal
      --     return term.name
      --   end,
      -- },
    },
  },
}
