return {
    ensure_installed = {
        "bash",
        "css",
        "csv",
        "graphql",
        "html",
        "java",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "python",
        "r",
        "sql",
        "typst",
    },

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        -- TODO: Fix on 0.12
        -- keymaps = {
        --     init_selection = "",
        --     node_incremental = "<c-space>",
        --     scope_incremental = "<c-s>",
        --     node_decremental = "<M-space>",
        -- },
    },
    indent = { enable = true },
}
