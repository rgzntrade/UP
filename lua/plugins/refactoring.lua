return {
  {
    url = "https://github.com/ThePrimeagen/refactoring.nvim.git",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    key = {
      {
        "v",
        "<leader>re",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
        { desc = "提取函数", noremap = true, silent = true, expr = false },
      },
      {
        "v",
        "<leader>rf",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
        { desc = "提取函数到文件", noremap = true, silent = true, expr = false },
      },
      {
        "v",
        "<leader>rv",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
        { desc = "提取变量", noremap = true, silent = true, expr = false },
      },
      {
        "v",
        "<leader>ri",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
        { desc = "内联变量", noremap = true, silent = true, expr = false },
      },
      {
        "n",
        "<leader>rb",
        [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
        { desc = "提取块", noremap = true, silent = true, expr = false },
      },
      {
        "n",
        "<leader>rbf",
        [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
        { desc = "提取块到文件", noremap = true, silent = true, expr = false },
      },
      {
        "n",
        "<leader>ri",
        [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
        { desc = "内敛变量", noremap = true, silent = true, expr = false },
      },
      {
        "v",
        "<leader>rr",
        ":lua require('refactoring').select_refactor()<CR>",
        { desc = "重构方法", noremap = true, silent = true, expr = false },
      },
    },
    config = function()
      require("refactoring").setup({})
    end,
  },
}