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
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "configs.nvim-treesitter"
        end
    },

    {
        "ray-x/lsp_signature.nvim",
        -- TODO: Rewrite this to using 'opts' for practice 
        config = function()
            require("configs.lsp_signature")
        end,
    },


    {
        "Vigemus/iron.nvim",
        config = function()
            require("configs.iron")
        end,
    },

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


}
