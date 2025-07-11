require "nvchad.options"

local o = vim.o

-- Enable cursorline
o.cursorlineopt = 'both'

-- set clipboard to system clipboard
-- o.clipboard = "unnamedplus"
o.clipboard = ""

o.nu = true
o.relativenumber = true

-- indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- searching
o.hlsearch = true -- Primeagen has this set to false
o.incsearch = true

-- some nice colours
o.termguicolors = true


-- min distance from edge lines
o.scrolloff = 3

-- not sure if this is good to have
-- after this much idle time, file is written to swap
o.updatetime = 500
o.smartcase = true
