require("csvview").enable()
vim.keymap.set("n", "<LocalLeader>t", "<Cmd>CsvViewToggle<CR>", { buffer = true, desc = "CSV toggle view" })
