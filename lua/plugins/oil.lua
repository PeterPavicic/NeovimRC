---@type LazySpec
return {
  "stevearc/oil.nvim",
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = require("config.oil").opts,
  -- Optional dependencies
  dependencies = {
    -- {"nvim-mini/mini.icons", opts = {}},
    { "nvim-tree/nvim-web-devicons" },
  },
}
