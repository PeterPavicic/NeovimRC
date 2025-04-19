-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
vim.lsp.enable(servers)


-- No idea what this is, it was commented originally also

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }



-- lspconfig.pyright.setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities
-- }

-- TODO: Determine if this is necessary

   -- require'nvim-treesitter.configs'.setup {
   --   ensure_installed = { "python", "graphql" },
   --   highlight = { enable = true },
   --   -- Other settings …
   -- }


-- Uncomment for PyRight setup

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.pyright.setup {
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}


-- Check if the GraphQL LSP binary is available.
if vim.fn.executable("graphql-lsp") == 1 then
  -- Configure GraphQL LSP using NVChad defaults.
  lspconfig.graphql.setup({
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    -- Specify filetypes where GraphQL is used (adjust as needed)
    filetypes = { "graphql", "javascript", "typescript", "javascriptreact", "typescriptreact" , "python" },
    -- Determine the project root directory; here we use a Git repo if available
    root_dir = function(fname)
      local util = require("lspconfig.util")
      return util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end,
    -- NVChad default handlers
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    -- Optional settings: add further customization to the GraphQL LSP here if needed.
    settings = {
      -- Example placeholder: you can add GraphQL-specific settings here.
    },
  })
else
  print("Warning: graphql-lsp is not installed. Please install it with 'npm install -g graphql-language-service-cli'")
end
