require("nvchad.configs.lspconfig").defaults()

local servers = {
    -- "cssls",
    -- "html",
    "texlab",
    "prettier",
    "pyright",
    "marksman",
    "luals",
    "r_language_server",
    "bashls",
    "jdtls",
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


-- For all LSPs
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
