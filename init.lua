-- load options
require "options"

-- set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- load Lazy
require "config.lazy"

-- load undotree
vim.cmd("packadd nvim.undotree")

-- load mappings
require "mappings"

-- load autocmds
require "autocmds"

require "ui2"

-- disable node, perl, and python 3 providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

vim.diagnostic.config({
  virtual_text = {
    spacing = 2,        -- columns between code and the message
    -- prefix = "●",        -- no leading symbol; set to "●" or "▎" if you want one
    -- source = "if_many",  -- show "[lua_ls]" etc. when multiple servers attach
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
