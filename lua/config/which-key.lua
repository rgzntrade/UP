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
  { "<Space>mT", "<cmd>CMakeSelectBuildType<CR>", desc = "SelectBuildType", nowait = true, remap = false },
  { "<Space>mb", "<cmd>CMakeBuild<CR>", desc = "Build", nowait = true, remap = false },
  { "<Space>mc", "<cmd>CMakeClean<CR>", desc = "Clean cache", nowait = true, remap = false },
  { "<Space>md", "<cmd>CMakeDebug<CR>", desc = "DebugTarget", nowait = true, remap = false },
  { "<Space>mr", "<cmd>CMakeRun<CR>", desc = "RunTarget", nowait = true, remap = false },
  { "<Space>mg", "<cmd>CMakeGenerate<CR>", desc = "CMakeGenerate", nowait = true, remap = false },
  { "<Space>mr", "<cmd>CMakeRun<CR>", desc = "Run", nowait = true, remap = false },
  { "<Space>ms", group = "CMakeSelect", nowait = true, remap = false },
  { "<Space>msd", "<cmd>CMakeSelectBuildDir<CR>", desc = "SelectBuildDir", nowait = true, remap = false },
  { "<Space>mss", "<cmd>CMakeSettings<CR>", desc = "CmakeSettings", nowait = true, remap = false },
  { "<Space>mst", "<cmd>CMakeTargetSettings<CR>", desc = "TargetSettings", nowait = true, remap = false },
  { "<Space>mt", group = "CMakeType", nowait = true, remap = false },
  { "<Space>mtb", "<cmd>CMakeSelectBuildTarget<CR>", desc = "SelectBuildTarget", nowait = true, remap = false },
  { "<Space>mtl", "<cmd>CMakeSelectLaunchTarget<CR>", desc = "SelectLanuchTarget", nowait = true, remap = false },
  { "<Space>mq", group = "CMakeQuick", nowait = true, remap = false },
  { "<Space>mqb", "<cmd>CMakeQuickBuild<CR>", desc = "QuickBuild", nowait = true, remap = false },
  { "<Space>mqd", "<cmd>CMakeQuickDebug<CR>", desc = "QuickDebug", nowait = true, remap = false },
  { "<Space>mqr", "<cmd>CMakeQuickRun<CR>", desc = "QuickRun", nowait = true, remap = false },
  { "<Space>mqs", "<cmd>CMakeQuickStart<CR>", desc = "QuickStart", nowait = true, remap = false },
}

which_key.add(mappings)
