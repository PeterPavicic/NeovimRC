local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add to list"})
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon show menu"})

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon go to 1"})
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon go to 2"})
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon go to 3"})
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon go to 4"})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-P>", function() harpoon:list():prev() end, { desc = "Harpoon go to next"})
vim.keymap.set("n", "<C-N>", function() harpoon:list():next() end, { desc = "Harpoon go to previous"})
