---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = require("config.nvim-lspconfig").config,
}
