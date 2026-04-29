---@type LazySpec
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufEnter",
  main = "ibl",
  enabled = false,
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
}
