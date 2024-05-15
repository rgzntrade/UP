-- 获取当前选中的文本
local function get_selected_text()
  -- local _, start_line, start_col, _ = unpack(vim.fn.getpos("'<"))
  -- local _, end_line, end_col, _ = unpack(vim.fn.getpos("'>"))
  -- local lines = vim.fn.getline(start_line, end_line)
  -- if #lines == 0 then return nil end
  -- lines[1] = string.sub(lines[1], start_col)
  -- lines[#lines] = string.sub(lines[#lines], 1, end_col)
  -- return table.concat(lines, "\n")
    -- 模拟按下 y 键
    vim.cmd("normal! y")
    -- 获取复制的内容并存储到其他寄存器中
    return vim.fn.getreg("")
end

-- 将选中的文本分割成多行
local function split_lines(text)
  local lines = {}
  for line in text:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end
  return lines
end

-- 生成测试调用
local function generate_test_calls(test_type, test_suite, test_cases)
  local result = {}
  for _, test_case in ipairs(test_cases) do
    table.insert(result, test_type .. "(" .. test_suite .. ", " .. test_case .. ") {}")
    table.insert(result, "")
  end
  return result
end

-- 获取选中文本的范围
local function get_selected_range()
  local _, start_line, _, _ = unpack(vim.fn.getpos("'<"))
  local _, end_line, _, _ = unpack(vim.fn.getpos("'>"))
  return start_line, end_line
end

-- 获取选中的文本
local selected_text = get_selected_text()
print(selected_text)
if selected_text then
  -- 将选中的文本分割成多行
  local lines = split_lines(selected_text)
  -- 获取固定的字符串test_type和test_suite
  local test_type = table.remove(lines, 1)
  local test_suite = table.remove(lines, 1)
  -- 生成测试调用
  local calls = generate_test_calls(test_type, test_suite, lines)
  -- 获取选中的文本的范围
  local start_line, end_line = get_selected_range()
  -- 将生成的内容插入到选中的位置
  vim.api.nvim_buf_set_lines(0, end_line, end_line, false, calls)
end
