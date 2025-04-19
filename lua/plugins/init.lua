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


    -- R stuff:

    {
        "R-nvim/R.nvim",
        lazy = true,
        ft   = { "r", "rmd", "quarto", "rnoweb", "rhelp" },
        config = function()
            require("r").setup()
        end,
    },

    -- cmp-r: a cmp source that piggy‑backs on R.nvim
    {
        "R-nvim/cmp-r",
        dependencies = {
            "R-nvim/R.nvim",      -- backend provider
            "hrsh7th/nvim-cmp",    -- completion engine
        },
        lazy = true,
        ft   = { "r", "rmd", "quarto", "rnoweb", "rhelp" },
        config = function()
            -- optional: override defaults (filetypes, doc_width, trigger_characters…)
            require("cmp_r").setup({
                -- filetypes = {"r","rmd","quarto","rnoweb","rhelp"},
                -- doc_width = 60,
                -- trigger_characters = { " ", ":", "(", '"', "@", "$" },
                sources = {
                    { name = 'cmp_r' },
                }
            })
        end,
        -- ensure cmp-r is loaded after nvim-cmp
        after = "nvim-cmp",
    },

    -- now inject cmp-r into NVChad’s cmp sources
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "R-nvim/cmp-r" },
        opts = function(_, opts)
            -- unshift cmp_r so it has highest priority
            table.insert(opts.sources, 1, { name = "cmp_r" })
            return opts
        end,
    },


    -- -- TODO: Load and configure this
    -- {
    --     "lervag/vimtex",
    --     ft = { "tex", "latex", "rmd", "quarto" },
    --     config = function()
    --         vim.g.vimtex_view_method = "zathura"
    --         vim.g.vimtex_compiler_method = "latexmk"
    --     end
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


}
