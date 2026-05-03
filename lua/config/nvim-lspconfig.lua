-- In order for these to work make sure to install the corresponding LSPs (potentially using Mason)
local servers = {
  "bashls",
  "cssls",
  "hyprls",
  "jdtls",
  "jsonls",
  "lua_ls",
  "marksman",
  "prettier",
  "pyright",
  "texlab",
  "tinymist",
}

local default_capabilities = require("blink.cmp").get_lsp_capabilities()

-- Enable basic capabilities for all LSPs
vim.lsp.config("*", {
  capabilities = default_capabilities,
})

-- lower highlight priority for highlights than treesitter
-- meaning this will fire if treesitter errors/fails/should work for language injection
vim.highlight.priorities.semantic_tokens = 95

vim.lsp.enable(servers)
