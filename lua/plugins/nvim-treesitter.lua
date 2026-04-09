---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- specify correct module to call .setup(opts) on
  main = "nvim-treesitter.configs",
  opts = require "config.nvim-treesitter",
  lazy = false,
  -- TODO: remove this after updating to 0.12
  branch = "master",
}
