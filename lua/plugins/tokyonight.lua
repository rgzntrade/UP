return {
  {
    "folke/tokyonight.nvim",
    opts = {
      -- on_colors = function(colors)
      --   colors.hint = colors.orange
      --   colors.error = "#ff0000"
      -- end,
      on_highlights = function(highlights, colors)
        highlights.ColorColumn = { bg = "#1f2f2f" }
        highlights.WinSeparator = { fg = colors.fg_gutter, bold = true } -- the column separating vertically split windowsp
      end,
    },
  },
}
