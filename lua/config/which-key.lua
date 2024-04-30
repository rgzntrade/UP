local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<Space>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  a = { a = { "<cmd>Dashboard<cr>", "Welcome" } },
  m = {
    name = "CMake",
    g = { "<cmd>CMake configure<CR>", "Configure" },
    t = { "<cmd>CMake select_target<CR>", "SelectTarget" },
    T = { "<cmd>CMake select_build_type<CR>", "SelectBuildType" },
    b = { "<cmd>CMake build<CR>", "BuildTarget" },
    a = { "<cmd>CMake build_all<CR>", "BuildAll" },
    r = { "<cmd>CMake build_and_run<CR>", "Run" },
    d = { "<cmd>CMake build_and_debug<CR>", "DebugTarget" },
    q = { "<cmd>CMake cancel<CR>", "Cancel" },
    s = { "<cmd>CMake set_target_args<CR>", "SetArg" },
    c = { "<cmd>CMake clear_cache<CR>", "SetArg" },
    -- TODO: 增加 +code
  },
}

which_key.register(mappings, opts)
