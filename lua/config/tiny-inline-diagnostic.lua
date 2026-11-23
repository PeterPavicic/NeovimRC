local M = {}

M.config = function()
  require("tiny-inline-diagnostic").setup()
  vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
end

return M
