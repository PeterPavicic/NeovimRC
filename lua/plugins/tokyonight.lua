---@type LazySpec
return {
  "folke/tokyonight.nvim",
  lazy = false, -- load on startup
  priority = 1000, -- load this before all other start plugins
  config = require("config.tokyonight").config,
  opts = require("config.tokyonight").opts,
}
