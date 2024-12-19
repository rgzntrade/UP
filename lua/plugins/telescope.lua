return {
  {
    "telescope.nvim",
    dependencies = {

      -- 用lazyvim的配置
      -- {
      --   "nvim-telescope/telescope-fzf-native.nvim",
      --   build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      -- },
      -- "nvim-telescope/telescope-ui-select.nvim",
      -- "nvim-telescope/telescope-project.nvim",
      -- "nvim-telescope/telescope-file-browser.nvim",
      -- "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope-dap.nvim",
      -- "nvim-telescope/telescope-frecency.nvim",
      -- "kkharji/sqlite.lua",
      -- { "nvim-telescope/telescope-media-files.nvim" },
      -- { "nvim-telescope/telescope-live-grep-args.nvim" },
      "debugloop/telescope-undo.nvim",
    },
    -- opts = function(_, opts)
    --   -- local function flash(prompt_bufnr)
    --   --   require("flash").jump({
    --   --     pattern = "^",
    --   --     label = { after = { 0, 0 } },
    --   --     search = {
    --   --       mode = "search",
    --   --       exclude = {
    --   --         function(win)
    --   --           return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
    --   --         end,
    --   --       },
    --   --     },
    --   --     action = function(match)
    --   --       local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
    --   --       picker:set_selection(match.pos[1] - 1)
    --   --     end,
    --   --   })
    --   -- end
    --   opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
    --     layout_strategy = "vertical",
    --     -- layout_config = { prompt_position = "top" },
    --     sorting_strategy = "ascending",
    --     winblend = 10,
    --     media_files = {
    --       -- filetypes whitelist
    --       -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    --       filetypes = { "png", "webp", "jpg", "jpeg" },
    --       -- find command (defaults to `fd`)
    --       find_cmd = "rg",
    --     },
    --     mappings = {
    --       n = {
    --         s = flash,
    --         -- ["q"] = actions.close,
    --       },
    --       i = {
    --         ["<c-s>"] = flash,
    --         ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
    --         ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
    --       },
    --     },
    --   })
    -- end,
    config = function(_, opts)
      require("telescope").setup(opts)
      -- require("telescope").load_extension("fzf")
      -- require("telescope").load_extension("file_browser")
      -- require("telescope").load_extension("dap")
      -- -- require("telescope").load_extension("ui-select")
      -- require("telescope").load_extension("notify")
      -- require("telescope").load_extension("project")
      -- require("telescope").load_extension("frecency")
      -- require("telescope").load_extension("media_files")
      -- require("telescope").load_extension("live_grep_args")
      -- require("telescope").load_extension("macros")
      require("telescope").load_extension("find_template")
      require("telescope").load_extension("undo")
    end,
  },
}
