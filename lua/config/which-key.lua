local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  -- mode = "n", -- NORMAL mode
  -- -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- -- the prefix is prepended to every mapping part of `mappings`
  -- prefix = "<Space>",
  -- buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  -- silent = true, -- use `silent` when creating keymaps
  -- noremap = true, -- use `noremap` when creating keymaps
  -- nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

  { "<Space>aw", "<cmd>Dashboard<cr>", desc = "Welcome", nowait = true, remap = false },
  { "<Space>m", group = "CMake", nowait = true, remap = false },
  { "<Space>mT", "<cmd>CMake select_build_type<CR>", desc = "SelectBuildType", nowait = true, remap = false },
  { "<Space>ma", "<cmd>CMake build_all<CR>", desc = "BuildAll", nowait = true, remap = false },
  { "<Space>mb", "<cmd>CMake build<CR>", desc = "BuildTarget", nowait = true, remap = false },
  { "<Space>mc", "<cmd>CMake clear_cache<CR>", desc = "SetArg", nowait = true, remap = false },
  { "<Space>md", "<cmd>CMake build_and_debug<CR>", desc = "DebugTarget", nowait = true, remap = false },
  { "<Space>mg", "<cmd>CMake configure<CR>", desc = "Configure", nowait = true, remap = false },
  { "<Space>mq", "<cmd>CMake cancel<CR>", desc = "Cancel", nowait = true, remap = false },
  { "<Space>mr", "<cmd>CMake build_and_run<CR>", desc = "Run", nowait = true, remap = false },
  { "<Space>ms", "<cmd>CMake set_target_args<CR>", desc = "SetArg", nowait = true, remap = false },
  { "<Space>mt", "<cmd>CMake select_target<CR>", desc = "SelectTarget", nowait = true, remap = false },
}

which_key.add(mappings)
