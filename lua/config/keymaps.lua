-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function keymap(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- debug
keymap(
  "n",
  "<F9>",
  "<cmd>lua require'dap'.toggle_breakpoint(); require'config.debug-dap.dap-util'.store_breakpoints(true) <cr>",
  { desc = "断点" }
)
keymap(
  "n",
  "<leader>dc",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
  { desc = "条件断点" }
)
keymap(
  "n",
  "<leader>dm",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "日志断点" }
)
keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", { desc = "打开交互" })
keymap("n", "<Leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "运行最后一个" })
keymap("n", "<C-F5>", '<cmd>lua require"debug-dap.dap-util".reload_continue()<CR>', { desc = "重新开始" })
keymap("n", "<S-F5>", "<cmd>lua require'dap'.terminate()<cr>", { desc = "终止调试" })
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { desc = "继续运行" })
keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "跳过" })
keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", { desc = "进入" })
keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", { desc = "跳出" })
keymap("n", "<leader>K", "<cmd>lua require'dapui'.eval()<cr>", { desc = "求值" })
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", {desc = ""})

-- windows
keymap("n", "<leader>wo", "<C-w>o", { desc = "关闭其它窗口" })
keymap("n", "<leader>wz", "<cmd>WindowsMaximize<cr>", { desc = "窗口最大化" })
keymap("n", "<leader>w=", "<cmd>WindowsEqualize<cr>", { desc = "窗口等距" })

-- clangd
keymap("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "切换h/cpp" })

-- toggleterm
keymap({ "n", "t" }, "<A-h>", "<cmd>ToggleTerm size=20 direction=horizontal<cr>", { desc = "横向终端" })
keymap({ "n", "t" }, "<A-v>", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "纵向终端" })
keymap({ "n", "t" }, "<A-t>", "<cmd>ToggleTerm size=40 direction=tab<cr>", { desc = "tab终端" })
keymap({ "n", "t" }, "<A-f>", "<cmd>ToggleTerm size=40 direction=float<cr>", { desc = "浮动终端" })
keymap({ "n", "t" }, "<A-n>", "<cmd>ToggleTerm<cr>", { desc = "终端开关" })

-- symbol-outline
keymap("n", "<leader>gf", "<cmd>SymbolsOutline<cr>", { desc = "符号大纲" })
