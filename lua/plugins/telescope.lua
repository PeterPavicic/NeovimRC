---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- native telescope sorter to improve sorting performance
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    "debugloop/telescope-undo.nvim",
  },
  cmd = "Telescope",
  opts = require("config.telescope").opts,
}
