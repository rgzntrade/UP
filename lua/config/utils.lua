local M = {}

M.path = {
  create_directory = function(path)
    local success, error_msg = io.open(path, "r")
    if not success then
      local mkdir_cmd = string.format("mkdir -p %s", path)
      os.execute(mkdir_cmd)
      success, error_msg = io.open(path, "r")
      if not success then
        vim.notify("Failed to create directory:", path, error_msg)
        return false
      end
    end
    success:close()
    return true
  end,

  -- 跳转到上个窗口
  open_file_in_last_window = function()
    local open_window = function(path, line_number)
      vim.cmd("wincmd p")
      -- 使用 :sfind 命令来在所有窗口中查找并打开文件
      vim.cmd("edit " .. path)
      -- 尝试跳转到指定行数
      if line_number ~= nil then
        vim.cmd("normal! " .. line_number .. "G")
      end
    end
    local function clean_word(word)
      return word:gsub("^['\"](.-)['\"]$", "%1"):gsub("%s+", "")
    end

    local patterns = {
      "^(.-)|(%d+)|$", -- 匹配格式 "path/to/file.ext|line|"
      "^(.-)|(%d+) $", -- 匹配格式 "path/to/file.ext|line "
      "^(.-)|(%d+)$", -- 匹配格式 "path/to/file.ext|line"
      "^(.-):(%d+):%d+:$", -- 匹配格式 "path/to/file.ext:line:col:"
      "^(.-):(%d+):%d+$", -- 匹配格式 "path/to/file.ext:line:col"
      "^(.-):(%d+):$", -- 匹配格式 "path/to/file.ext:line: "
    }

    local function match_patterns(word)
      for _, pattern in ipairs(patterns) do
        local file_path, line_number = word:match(pattern)
        if file_path and line_number then
          return clean_word(file_path), line_number
        end
      end
      return nil, nil
    end

    -- 获取光标下的单词
    local word = vim.fn.expand("<cWORD>")
    -- print("Original word:", word)

    -- 匹配并提取文件路径和行号
    local file_path, line_number = match_patterns(word)

    if file_path and line_number then
      open_window(file_path, line_number)
    else
      print("No match found")
    end
  end,
}

M.command = {
  -- 定义一个函数，用于执行上一次的 Ex 命令
  execute_last_command = function()
    local last_command = vim.api.nvim_eval("@:") -- 获取寄存器 ':' 的内容，即上一次的 Ex 命令
    print(last_command)
    if last_command ~= "" then
      vim.cmd(last_command) -- 执行上一次的命令
    else
      print("No previous command found")
    end
  end,
}

M.content = {
  copy_selection_to_clipboard = function()
    -- 模拟按下 y 键
    vim.cmd("normal! y")

    -- 获取复制的内容并存储到其他寄存器中
    local selected_text = vim.fn.getreg("")

    -- 设置选中内容到 +、* 和 " 寄存器中
    vim.fn.setreg("+", selected_text)
    vim.fn.setreg("*", selected_text)
    vim.fn.setreg('"', selected_text)
  end,
}

M.system = {
  is_windows = function()
    local result = vim.api.nvim_eval("has('win32') || has('win64')")
    return result == 1
  end,

  is_linux = function()
    local result = vim.api.nvim_eval("has('unix') && !has('mac') && !has('win32') && !has('win64')")
    return result == 1
  end,

  is_mac = function()
    local result = vim.api.nvim_eval("has('mac')")
    return result == 1
  end,
}

local contains = function(array, value)
  for _, v in ipairs(array) do
    if v == value then
      return true
    end
  end
  return false
end

M.file_types = {
  cpp_file_types = { "cpp", "cxx", "h", "hpp", "hxx" },
  cmake_file_types = { "cmake", "txt" },
}

M.array = {
  -- 数组求交集
  intersection = function(...)
    local arrays = { ... }
    local result = {}
    local count = #arrays

    for _, value in ipairs(arrays[1]) do
      local isCommon = true

      for i = 2, count do
        if not contains(arrays[i], value) then
          isCommon = false
          break
        end
      end

      if isCommon then
        table.insert(result, value)
      end
    end

    return result
  end,

  -- 数组求并集
  union = function(...)
    local arrays = { ... }
    local result = {}

    for _, array in ipairs(arrays) do
      for _, value in ipairs(array) do
        if not contains(result, value) then
          table.insert(result, value)
        end
      end
    end

    return result
  end,

  -- 数组求补集
  complement = function(a, ...)
    local arrays = { ... }
    local result = {}

    for _, value in ipairs(a) do
      local isInOthers = false

      for _, array in ipairs(arrays) do
        if contains(array, value) then
          isInOthers = true
          break
        end
      end

      if not isInOthers then
        table.insert(result, value)
      end
    end

    return result
  end,
}
return M
