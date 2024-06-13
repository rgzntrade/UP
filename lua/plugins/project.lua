return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = { ".git" },
      exclude_dirs = { "~/" },
    },
    config = function()
      require("project_nvim").setup()
    end,
  },
}
