---@type LazySpec
return {
  "chomosuke/typst-preview.nvim",
  version = "1.*",
  opts = require("config.typst-preview").opts, -- default options
  ft = "typst", -- lazy-load only for Typst files
}
