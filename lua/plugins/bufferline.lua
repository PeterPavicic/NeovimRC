---@type LazySpec
return {
  "akinsho/bufferline.nvim",
  lazy = true,
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { "<leader>tb", desc = "Activate bufferline" },
  },
}
