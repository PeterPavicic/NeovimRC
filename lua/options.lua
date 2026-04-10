-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.o.numberwidth = 2

-- Case-insensitive search UNLESS \C or 1<=capital letter in search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- highlight current line and linenumber
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

-- don't sync system clipboard
vim.opt.clipboard = ""

-- indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.opt.confirm = true

-- Show <tab> and trailing spaces
vim.opt.list = true

-- searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- some nice colours
vim.opt.termguicolors = true


-- min distance from edge lines
vim.opt.scrolloff = 3

-- after this much idle time, file is written to swap
vim.opt.updatetime = 500
vim.opt.smartcase = true

-- disable node, perl, and python 3 providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.laststatus = 3

-- don't show the current mode
vim.o.showmode = true

-- what to do with cursor when splitting
-- Possible values are:
-- cursor Keep the same relative cursor position.
-- screen Keep the text on the same screen line.
-- topline  Keep the topline the same.
vim.o.splitkeep = "screen"

-- fill end of file with emptiness instead of ~
vim.opt.fillchars = { eob = " " }

-- disable certain messages
vim.opt.shortmess = "ltToOCFs"

-- column for diagnostic/etc signs
vim.o.signcolumn = "yes"

-- instead of above and left (default)
vim.o.splitbelow = true
vim.o.splitright = true

-- how long Neovim waits for next keypress for it to count as a sequence
vim.o.timeoutlen = 500

vim.o.showmode = false

vim.o.undofile = true

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH
