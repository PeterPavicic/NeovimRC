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


  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    config = function()
      require("configs.nvim-treesitter-context")
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

      -- disable autocompletion popup
      opts.completion = {
        -- autocomplete = true,     -- Ensure autocompletion is enabled
        keyword_length = 3,
      }

      return opts
    end,
  },


  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {
      default_mappings = true,
      -- which builtin marks to show. default {}
      builtin_marks = { ".", "<", ">", "^" },
      -- whether movements cycle back to the beginning/end of buffer. default true
      cyclic = true,
      -- whether the shada file is updated after modifying uppercase marks. default false
      force_write_shada = false,
      -- how often (in ms) to redraw signs/recompute mark positions. 
      -- higher values will have better performance but may cause visual lag, 
      -- while lower values may cause performance penalties. default 150.
      refresh_interval = 250,
      -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
      -- marks, and bookmarks.
      -- can be either a table with all/none of the keys, or a single number, in which case
      -- the priority applies to all marks.
      -- default 10.
      sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
      -- disables mark tracking for specific filetypes. default {}
      excluded_filetypes = {},
      -- disables mark tracking for specific buftypes. default {}
      excluded_buftypes = {},
      -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
      -- sign/virttext. Bookmarks can be used to group together positions and quickly move
      -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
      -- default virt_text is "".
      bookmark_0 = {
        sign = "⚑",
        virt_text = "hello world",
        -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
        -- defaults to false.
        annotate = false,
      },
      mappings = {}
    },
  },

  {
    "mbbill/undotree",
    config = function() 
      require("configs.undotree")
    end,
    event = "BufReadPost",
  },


  -- Install deno to fix: 
  -- sudo pacman -S webkit2gtk 
  -- deno add jsr:@webview/webview (in ~/.config/nvim)
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        filetype = {
          "markdown",
          "conf",
          "md",
          "Rmd"
        },
        app = "webview",
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  {
    "ThePrimeagen/vim-be-good",
    event = { "VeryLazy" },
  },

  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_general_viewer = "okular"
      -- vim.g.maplocalleader = "\\"
    end
  },
  -- TODO: Figure these out

  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  --   opts = function()
  --     return require "configs.nvimtree"
  --   end,
  --   enabled = true,
  -- },



  -- {
  --   'stevearc/oil.nvim',
  --   ---@module 'oil'
  --   ---@type oil.SetupOpts
  --   opts = {},
  --   -- Optional dependencies
  --   dependencies = { { "echasnovski/mini.icons", opts = {} } },
  --   -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  --   -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  --   lazy = false,
  -- },

  -- {
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("configs.harpoon2")
  --   end
  -- },

  -- TODO: Try out oil.nvim
  -- TODO: Try out obsidian.nvim

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
