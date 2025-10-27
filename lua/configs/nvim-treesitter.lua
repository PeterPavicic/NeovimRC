require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "bash",
        "css",
        "graphql",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "typst",
        -- "markdown-inline",
        -- "latex",
        "python",
        "r",
        "typescript",
    },

    auto_install = true,

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
