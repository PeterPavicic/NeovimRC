---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  -- specify correct module to call .setup(opts) on
  main = "nvim-treesitter",
  init = require("config.nvim-treesitter").init,
}
