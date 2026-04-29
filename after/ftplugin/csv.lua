vim.keymap.set("n", "<LocalLeader>t", "<Cmd>CsvViewToggle<CR>", { buffer = true, desc = "CSV toggle view" })
vim.keymap.set("n", "<LocalLeader>e", "<Cmd>CsvViewEnable<CR>", { buffer = true, desc = "CSV enable view" })
vim.keymap.set("n", "<LocalLeader>d", "<Cmd>CsvViewDisable<CR>", { buffer = true, desc = "CSV disable view" })
vim.keymap.set("n", "<LocalLeader>i", "<Cmd>CsvViewInfo<CR>", { buffer = true, desc = "CSV view info" })
