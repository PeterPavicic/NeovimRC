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

    ft = {"tex", "bib"},

    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
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

  -- This is an extension of the default opts from NVChad
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "configs.nvimtree"
    end,
    enabled = true,
  },


  {
    "tpope/vim-fugitive",
    config = function()
      require "configs.vim-fugitive"
    end,
    lazy = false,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- use latest release instead of latest commit
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    opts = require "configs.obsidian",
    lazy = true,
  },

  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        -- textobject_field_inner = { "if", mode = { "o", "x" } },
        -- textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        -- jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        -- jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        -- jump_next_row = { "<Enter>", mode = { "n", "v" } },
        -- jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
        view = {
          display_mode = "border",
        }
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },

  {
    "folke/twilight.nvim",
    opts = {
      context = 4,
    }
  },


  {
    "folke/zen-mode.nvim",
    ft = "tex",
    opts = {
      window = {
        backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 0.8, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- comment the lines to not apply the options
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable listchars
        },
      },
      plugins = {
        -- disable some global vim options (vim.o)
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          laststatus = 0,
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables gitsigns in zen mode
        kitty = {
          enabled = true,
          font = "+2", -- font size increment
        },
        tmux = { enabled = true }, -- disables the tmux statusline
      },
      -- -- callback where you can add custom code when Zen mode opens
      on_open = function()
        vim.g._zen_old_showtabline = vim.o.showtabline
        vim.g._zen_old_winbar = vim.o.winbar
        vim.o.showtabline = 0
        vim.o.winbar = ""
        vim.cmd("TSContext disable")
      end,
      -- -- callback where you can add custom code when Zen mode closes
      on_close = function()
        vim.o.showtabline = vim.g._zen_old_showtabline or 2
        vim.o.winbar = vim.g._zen_old_winbar or ""
        vim.cmd("TSContext enable")
      end,
    },
    dependencies = "folke/twilight.nvim"
  },


  -- TODO: Implement mfussenegger/nvim-dap
  -- TODO: Find plugin for ipython/jupyter notebooks 
}
