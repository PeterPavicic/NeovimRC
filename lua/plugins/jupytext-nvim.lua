---@type LazySpec
return {
  "GCBallesteros/jupytext.nvim",
  lazy = false,
  config = require("config.jupytext").config,
  opts = require("config.jupytext").opts,
  -- NOTE: Plugin requires jupytext cli command
  -- Install with uv tool install jupytext
}
