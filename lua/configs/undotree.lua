-- set variables in your init.lua (or in the `init` block of your Lazy.nvim spec)
vim.g.undotree_WindowLayout = 2
-- vim.g.undotree_SplitWidth = 40
-- vim.g.undotree_DiffpanelHeight = 8
-- vim.g.undotree_DiffAutoOpen = 0
-- vim.g.undotree_SetFocusWhenToggle = 1
--
-- -- then map the toggle command however you like
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
