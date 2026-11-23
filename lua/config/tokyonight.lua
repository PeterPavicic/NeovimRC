local M = {}

M.config = function(_, opts)
  require("tokyonight").setup(opts)
  -- load the colorscheme here
  vim.cmd([[colorscheme tokyonight]])
end
M.opts = {
  transparent = true,
}

return M
