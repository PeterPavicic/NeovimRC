require("nvchad.configs.lspconfig").defaults()

local servers = {
    -- "cssls",
    -- "html",
    "prettier",
    "pyright",
    "marksman",
    "luals",
    "r_language_server",
    -- TODO: Try out jupytext
    -- "jupytext"
}

-- NOTE: In order for to get these LSPs to work, Mason install:
-- bash-language-server
-- lua-language-server
-- marksman
-- pyright
-- r-languageserver
-- stylua
-- prettier
-- And run the following in R:
-- install.packages("languageserver")


-- vim.lsp.config('*')

vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    }
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

-- Old Marksman setup:
-- lspconfig.marksman.setup {
--   on_attach    = nvlsp.on_attach,
--   on_init      = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   filetypes    = { "markdown", "rmd", "rmarkdown", "quarto" },
-- }


-- lspconfig.pyright.setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities
-- }

-- Old PyRight setup
--
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


