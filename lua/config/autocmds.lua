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

local keymap_exists = function(mode, lhs)
  local exists = false
  for _, map in ipairs(vim.api.nvim_get_keymap(mode)) do
    if map.lhs == lhs then
      exists = true
      break
    end
  end
  return exists
end

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  if not keymap_exists("n", "<Esc>") then
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  end
  vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>w]], opts)
  vim.keymap.set("n", "q", [[<C-w>w]], opts)
end

-- 创建移除终端快捷键的函数
function _G.unset_terminal_keymaps()
  local opts = { buffer = 0 } -- if not keymap_exists('n', '<Esc>')  then vim.keymap.del('t', '<Esc>', opts) end
end

-- 在 TermOpen 事件中设置快捷键
vim.cmd("autocmd! TermEnter term://*toggleterm#* lua set_terminal_keymaps()")
-- 在 TermClose 事件中移除快捷键
vim.cmd("autocmd! TermLeave term://*toggleterm#* lua unset_terminal_keymaps()")

-- terminal color
-- TODO: wait plugin fix
vim.cmd("highlight TermWin guibg=#282c34")
vim.cmd("autocmd TermOpen * setlocal winhighlight=Normal:TermWin")
vim.cmd("autocmd TermEnter * setlocal winhighlight=Normal:TermWin")
