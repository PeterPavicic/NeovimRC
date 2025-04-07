require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "markdown",
        "r"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<M-space>",
        },
    },
    indent = { enable = true },
})
