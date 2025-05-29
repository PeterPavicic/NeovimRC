require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
-- local nvlsp     = require("nvchad.configs.lspconfig")
-- local lspconfig = require "lspconfig"
-- 
-- load NVChad defaults for on_attach, capabilities, etc.
-- nvlsp.defaults()
-- 
-- 
-- 
-- now configure Marksman:
-- lspconfig.marksman.setup {
--   on_attach    = nvlsp.on_attach,
--   on_init      = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   filetypes    = { "markdown", "rmd", "rmarkdown", "quarto" },
-- }
-- 
-- 
-- local servers = {
--     "cssls",
--     "html",
--     "pyright",
--     "markdown"
--     -- "r_language_server"
-- }

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

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

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.pyright.setup {
--     cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
--     capabilities = capabilities,
--     settings = {
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 useLibraryCodeForTypes = true,
--             },
--         },
--     },
-- }


