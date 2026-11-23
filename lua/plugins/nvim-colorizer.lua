---@type LazySpec
return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = require("config.nvim-colorizer").opts,
  },
}
