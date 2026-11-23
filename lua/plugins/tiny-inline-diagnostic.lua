---@type LazySpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  -- default config
  config = require("config.tiny-inline-diagnostic").config,
}
