return {
    {
        -- TODO: Add description
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        -- Inserts colourful TODO, etc notes.
        -- TODO: Configure this further, especially colours.
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = require "configs.todo-comments",
        lazy = false,
    },

    {
        -- Basic Nnvim LSP Client configurations for LSP servers
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "ray-x/lsp_signature.nvim",
        -- TODO: Rewrite this to using 'opts' for practice 
        event = "LspAttach",
        opts = require "configs.lsp_signature"
        -- config = function()
        --     require("configs.lsp_signature")
        --     -- require("lsp_signature").on_attach({
        --     --     bind = true,          -- necessary to activate the plugin
        --     --     handler_opts = {
        --     --         border = "rounded"  -- optional, adds a nice border to the popup
        --     --     },
        --     --     -- You can adjust other options as needed.
        --     --     --
        --     -- })
        -- end,
    },


    {
        "ya2s/nvim-cursorline",
        lazy = false,
        config = function()
            require "configs.cursorline"

            -- require('nvim-cursorline').setup {
            --     cursorline = {
            --         enable = true,
            --         timeout = 1000,
            --         number = false,
            --     },
            --     cursorword = {
            --         enable = true,
            --         min_length = 3,
            --         hl = { underline = true },
            --     }
            -- }
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("configs.nvim-treesitter")

            -- require('nvim-treesitter.configs').setup({
            --     ensure_installed = {
            --         "lua",
            --         "python",
            --         "javascript",
            --         "typescript",
            --         "html",
            --         "css",
            --         "json",
            --         "markdown",
            --         "r"
            --     },
            --     highlight = {
            --         enable = true,
            --         additional_vim_regex_highlighting = false,
            --     },
            --     incremental_selection = {
            --         enable = true,
            --         keymaps = {
            --             init_selection = "<c-space>",
            --             node_incremental = "<c-space>",
            --             scope_incremental = "<c-s>",
            --             node_decremental = "<M-space>",
            --         },
            --     },
            --     indent = { enable = true },
            -- })
        end
    },


    {
        "nvim-treesitter/playground",
        cmd = { "TSPlaygroundToggle" },
        config = function()
            require("nvim-treesitter.configs").setup {
                playground = {
                    enable = true,             -- Enable the playground
                    disable = {},              -- Optionally disable for specific languages
                    updatetime = 25,           -- Debounced time for highlighting nodes (in ms)
                    persist_queries = false,   -- Whether the query persists across Vim sessions
                    keybindings = {
                        toggle_query_editor = "o",
                        toggle_hl_groups = "i",
                        toggle_injected_languages = "t",
                        toggle_anonymous_nodes = "a",
                        toggle_language_display = "I",
                        focus_language = "f",
                        unfocus_language = "F",
                        update = "R",
                        goto_node = "<cr>",
                        show_help = "?",
                    },
                },
            }
        end
    },

    -- Autoindents blank lines and colours indentations
    {
        -- TODO: Rice this
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        event = "BufReadPost"
    },

    -- {
    --     "Vigemus/iron.nvim",
    --     config = function()
    --         require("configs.iron")
    --     end,
    -- },

    -- NOTE: Potential plugins 
    -- Linter
        -- https://github.com/mfussenegger/nvim-lint
        -- https://www.perforce.com/blog/qac/what-is-linting
    -- Some stuff from Kickstart: 
        -- https://github.com/nvim-lua/kickstart.nvim/blob/master/lua/kickstart/plugins/
    -- Harpoon:
        -- https://github.com/ThePrimeagen/harpoon
    -- Undotree:
        -- https://github.com/mbbill/undotree
    -- All the R stuff


}
