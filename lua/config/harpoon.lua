local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon add to list" })
vim.keymap.set("n", "<leader>e", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon show menu" })

for i = 1, 6 do
  vim.keymap.set("n", "<M-" .. i .. ">", function()
    harpoon:list():select(i)
  end, { desc = "Harpoon go to " .. i })
end

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-P>", function()
  harpoon:list():prev()
end, { desc = "Harpoon go to next" })
vim.keymap.set("n", "<C-N>", function()
  harpoon:list():next()
end, { desc = "Harpoon go to previous" })
