-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  -- group = augroup("load_breakpoints"),
  pattern = { "lua", "cpp", "rust", "python" },
  callback = function()
    require("config.debug-dap.dap-util").load_breakpoints()
  end,
})
