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
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },
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
