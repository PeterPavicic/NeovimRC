---@type LazySpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  -- default config
  config = function()
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
  end,
}
