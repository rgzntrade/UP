---@module "lazy"
---@type LazySpec
return {
  "saghen/blink.cmp",
  dependencies = {
    "mikavilpas/blink-ripgrep.nvim",
    -- 👆🏻👆🏻 add the dependency here
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      completion = {
        enabled_providers = {
          -- NOTE: blink >v0.7.6 moved `sources.completion.enabled_providers` to `sources.default`
          "lsp",
          "path",
          "snippets",
          "buffer",
          "ripgrep", -- 👈🏻 add "ripgrep" here
        },
      },
      providers = {
        -- 👇🏻👇🏻 add the ripgrep provider config below
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          -- the options below are optional, some default values are shown
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {
            -- For many options, see `rg --help` for an exact description of
            -- the values that ripgrep expects.

            -- the minimum length of the current word to start searching
            -- (if the word is shorter than this, the search will not start)
            prefix_min_len = 3,

            -- The number of lines to show around each match in the preview window.
            -- For example, 5 means to show 5 lines before, then the match, and
            -- another 5 lines after the match.
            context_size = 5,

            -- The maximum file size that ripgrep should include in its search.
            -- Useful when your project contains large files that might cause
            -- performance issues.
            -- Examples: "1024" (bytes by default), "200K", "1M", "1G"
            max_filesize = "1M",

            -- (advanced) Any additional options you want to give to ripgrep.
            -- See `rg -h` for a list of all available options. Might be
            -- helpful in adjusting performance in specific situations.
            -- If you have an idea for a default, please open an issue!
            --
            -- Not everything will work (obviously).
            additional_rg_options = {}
          },
        },
      },
    },
  },
}
