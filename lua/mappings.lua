require "nvchad.mappings"


local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Avoid accidentally closing everything
map("i", "<C-c>", "<ESC>")

-- move text around using J, K
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block up 1 line"})
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block down 1 line"})


map("n", "J", "mzJ`z") -- J does not move cursor

-- Center when moving up, down half screen
-- NOTE: So far not a fan
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Center when searching
-- NOTE: So far not a fan
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever (paste no replace)
map("x", "<leader>p", [["_dP]], { desc = "Paste and keep yank" })

map({"n", "v"}, "<leader>d", "\"_d", { desc = "Delete into void"} )

-- next greatest remap ever (yank into system clipboard)
map({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })

-- avoid Ex mode
map("n", "Q", "<nop>")


-- Replace word under cursor
map("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor"} )


-- Move up and down between visual lines instead of logical ones.
map("n", "j", "gj")
map("n", "k", "gk")


-- Format json files

-- WARNING: Requires jq installation
map("n", "<leader>jq", "<CMD>%!jq<CR>")-- TODO: Fix this so it only works if current file is json file


map("n", "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", { desc = "Toggle Treesitter Playground" })
