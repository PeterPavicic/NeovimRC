---@type LazySpec
return {
  "folke/tokyonight.nvim",
  lazy = false, -- load on startup
  priority = 1000, -- load this before all other start plugins
  config = function(_, opts)
    require("tokyonight").setup(opts)
    -- load the colorscheme here
    vim.cmd([[colorscheme tokyonight]])
  end,
  opts = {
    transparent = true,
  },
}
