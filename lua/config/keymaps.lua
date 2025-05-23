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
  "<leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint(); require'config.debug-dap.dap-util'.store_breakpoints(true) <cr>",
  { desc = "断点" }
)
keymap(
  "n",
  "<F9>",
  "<cmd>lua require'dap'.toggle_breakpoint(); require'config.debug-dap.dap-util'.store_breakpoints(true) <cr>",
  { desc = "断点" }
)
-- keymap(
--   "n",
--   "<leader>dc",
--   "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
--   { desc = "条件断点" }
-- )
keymap(
  "n",
  "<leader>dm",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "日志断点" }
)
keymap("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", { desc = "断开连接" })
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", { desc = "打开交互" })
-- keymap("n", "<Leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "运行最后一个" })
-- keymap("n", "<C-F5>", '<cmd>lua require"debug-dap.dap-util".reload_continue()<CR>', { desc = "重新开始" })
-- keymap("n", "<S-F5>", "<cmd>lua require'dap'.terminate()<cr>", { desc = "终止调试" })
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { desc = "继续运行" })
keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "跳过" })
keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", { desc = "进入" })
keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", { desc = "跳出" })
-- keymap("n", "<leader>K", "<cmd>lua require'dapui'.eval()<cr>", { desc = "求值" })
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", {desc = ""})

-- buffers
keymap("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "关闭其它Buffers" })
keymap("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "关闭右边Buffers" })
keymap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "关闭左边Buffers" })
keymap("n", "<leader>bs", "<cmd>BufferLinePick<cr>", { desc = "选择Buffers" })
keymap("n", "<leader>bt", "<cmd>terminal<cr> :startinsert<cr>", { desc = "Buffer中打开terminal" })
keymap("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "切换到下一个Buffers" })
keymap("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "切换到上一个Buffers" })

-- windows
keymap("n", "<leader>wo", "<C-w>o", { desc = "关闭其它窗口" })
keymap("n", "<leader>w=", "<cmd>WindowsEqualize<cr>", { desc = "窗口等距" })
keymap("n", "<leader>wp", "<C-w>p<cr>", { desc = "跳转至上个窗口" })
keymap("n", "<leader>ws", '<cmd>lua require("config.utils").window.pick_window()<cr>', { desc = "选择一个窗口" })

-- clangd
keymap("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "切换h/cpp" })

local function handleToggleTermWithNumber(cmd)
  local new_cmd = cmd
  local count = vim.v.count
  local number = count or 2
  if number then
    new_cmd = number .. new_cmd
  end
  vim.cmd(new_cmd)
end

-- toggleterm
keymap({ "n", "t" }, "<A-d>", function()
  handleToggleTermWithNumber("ToggleTerm size=20 direction=horizontal")
end, { desc = "横向终端" })
keymap({ "n", "t" }, "<A-s>", function()
  handleToggleTermWithNumber("ToggleTerm size=60 direction=vertical")
end, { desc = "纵向终端" })
keymap({ "n", "t" }, "<A-t>", "<cmd>ToggleTerm size=40 direction=tab<cr>", { desc = "tab终端" })
keymap({ "n", "t" }, "<A-f>", "<cmd>ToggleTerm size=40 direction=float<cr>", { desc = "浮动终端" })

-- symbol-outline
keymap("n", "<leader>gf", "<cmd>SymbolsOutline<cr>", { desc = "符号大纲" })
-- gitui
-- keymap("n", "<leader>gg", "<cmd>lua require'gitui'.open()<cr>", { desc = "打开gitui" })

-- Telescope
-- keymap(
--   "n",
--   "<leader>fg",
--   ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
--   { desc = "带参数内容搜索" }
-- )
-- keymap("n", "<leader>fM", "<cmd>Telescope media_files<cr>", { desc = "媒体浏览" })
-- keymap("n", "<leader>fm", "<cmd>Telescope macros<cr>", { desc = "宏管理" })
keymap("n", "<leader>tt", "<cmd>Telescope find_template<cr>", { desc = "模版管理" })

-- refactoring
keymap(
  "v",
  "<leader>re",
  "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
  { desc = "提取函数", noremap = true, silent = true, expr = false }
)
keymap(
  "v",
  "<leader>rf",
  "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
  { desc = "提取函数到文件", noremap = true, silent = true, expr = false }
)
keymap(
  "v",
  "<leader>rv",
  "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
  { desc = "提取变量", noremap = true, silent = true, expr = false }
)
keymap(
  "v",
  "<leader>ri",
  "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
  { desc = "内联变量", noremap = true, silent = true, expr = false }
)
keymap(
  "n",
  "<leader>rbb",
  "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
  { desc = "提取块", noremap = true, silent = true, expr = false }
)
keymap(
  "n",
  "<leader>rbf",
  "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
  { desc = "提取块到文件", noremap = true, silent = true, expr = false }
)
keymap(
  "n",
  "<leader>ri",
  "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
  { desc = "内敛变量", noremap = true, silent = true, expr = false }
)
keymap(
  "v",
  "<leader>rr",
  "lua require('refactoring').select_refactor()<CR",
  { desc = "重构方法", noremap = true, silent = true, expr = false }
)

-- search-replace
keymap("n", "<leader>rsw", "<cmd>SearchReplaceSingleBufferCWord<cr>", { desc = "快捷替换当前Buffer单词" })
keymap(
  "n",
  "<leader>rss",
  "<cmd>SearchReplaceSingleBufferSelections<cr>",
  { desc = "快捷选择替换当前Buffer内容" }
)
keymap("n", "<leader>rmw", "<cmd>SearchReplaceMultiBufferCWord<cr>", { desc = "快捷替换多个Buffer单词" })
keymap(
  "n",
  "<leader>rms",
  "<cmd>SearchReplaceMultiBufferSelections<cr>",
  { desc = "快捷选择替换多个Buffer内容" }
)

keymap("n", "<leader>rg", "<cmd>GrugFar<cr>", { desc = "全局搜索替换" })

-- undo
keymap("n", "<leader>su", "<cmd>Telescope undo<cr>", { desc = "查看撤销修改内容" })

-- translate
-- keymap({ "n", "v" }, "<leader>tm", "<cmd>Translate<cr>", { desc = "翻译并在消息显示" })
-- keymap({ "n", "v" }, "<leader>tw", "<cmd>TranslateW<cr>", { desc = "翻译并在窗口显示" })
-- keymap({ "n", "v" }, "<leader>tr", "<cmd>TranslateR<cr>", { desc = "翻译并替换" })

keymap({ "n", "v" }, "<leader>tt", "<cmd>Pantran<cr>", { desc = "翻译并在周围显示" })
keymap({ "n", "v" }, "<leader>tw", "<cmd>Pantran mode=interactive<cr>", { desc = "翻译并在窗口显示" })

-- File
keymap(
  { "n", "v" },
  "<leader>cn",
  [[<cmd>let @+ = expand('%:t')<cr><cmd>let @* = expand('%:t')<cr><cmd>let @" = expand('%:t')<cr>:echom expand('%:t')<cr>]],
  { desc = "复制文件名" }
)
keymap(
  { "n", "v" },
  "<leader>cp",
  [[<cmd>let @+ = expand('%:p')<cr><cmd>let @* = expand('%:p')<cr><cmd>let @" = expand('%:p')<cr>:echom expand('%:p')<cr>]],
  { desc = "复制文件路径" }
)

-- tools
keymap(
  { "n", "v" },
  "<leader>gt",
  "<cmd>luafile ~/.config/nvim_up/lua/config/tools/cpp/gtest.lua<cr>",
  { desc = "批量添加函数" }
)
keymap({ "n" }, "<leader>rp", '<cmd>normal "_ce<C-r>0<cr>', { desc = "不复制替换", silent = true })
keymap({ "v" }, "<leader>rp", '<cmd>normal "_c<C-r>0<cr>', { desc = "不复制替换", silent = true })

-- go to
keymap(
  { "n" },
  "gF",
  '<cmd>lua require("config.utils").path.open_file_in_last_window()<cr>',
  { desc = "打开文件并跳转" }
)

-- command
keymap(
  { "n" },
  "<leader>;",
  '<cmd>lua require("config.utils").command.execute_last_command()<cr>',
  { desc = "执行上次command" }
)

-- content
keymap(
  { "v" },
  "<leader>y",
  '<cmd>lua require("config.utils").content.copy_selection_to_clipboard()<cr>',
  { desc = "复制到系统剪切板" }
)

--help
-- keymap({ "n" }, "<leader>?", "<cmd>Cheatsheet<cr>", { desc = "查看备忘录" })

--in and out
keymap({ "i" }, "<A-CR>", "<cmd>lua require('in-and-out').in_and_out()<cr>", { desc = "查看备忘录" })

-- neogen
keymap(
  { "n" },
  "<leader>nc",
  "<cmd>lua require('neogen').generate({ type = 'class' })<CR>",
  { desc = "生成类注释" }
)
keymap(
  { "n" },
  "<leader>nf",
  "<cmd>lua require('neogen').generate({ type = 'func' })<CR>",
  { desc = "生成函数注释" }
)
keymap(
  { "n" },
  "<leader>nd",
  "<cmd>lua require('neogen').generate({ type = 'file' })<CR>",
  { desc = "生成文件注释" }
)

-- code runner
keymap({ "n" }, "<leader>rr", "<cmd>RunCode<CR>", { desc = "运行代码" })

keymap({ "n" }, "<leader>rf", "<cmd>RunFile<CR>", { desc = "运行文件" })

keymap(
  { "n" },
  "<leader>rc",
  "<cmd>RunClose<CR>",
  { desc = "结束运行" }
)
