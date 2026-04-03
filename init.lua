-- load options
require "options"

-- set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- load Lazy
require "config.lazy"

-- load mappings
require "mappings"

-- load autocmds
require "autocmds"

-- disable node, perl, and python 3 providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after 'updatetime' and when going to insert mode
-- vim.cmd('packadd! nohlsearch')
