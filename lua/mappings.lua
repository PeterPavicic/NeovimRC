-- Avoid accidentally closing everything
vim.keymap.set("i", "<C-c>", "<ESC>")

-- move text around using J, K
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block up 1 line"})
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block down 1 line"})

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')
vim.keymap.set({ 'n' }, '<A-Left>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-Down>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-Up>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-Right>', '<C-w>l')

-- J does not move cursor
vim.keymap.set("n", "J", function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd("normal! J")
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Collapse next line" })

-- Center when moving up, down half screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up"})

-- Center when searching
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result"})
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result"})

-- greatest remap ever (paste no replace)
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste and keep yank" })

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", { desc = "Delete into void"} )
vim.keymap.set({"n", "v"}, "<leader>x", "\"_x", { desc = "Delete into void"} )

-- next greatest remap ever (yank into system clipboard)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })

-- avoid Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Open :h help for word under cursor
-- vim.keymap.set("n", "<leader>h", [[:h <<C-r><C-w><CR>]], { desc = "Search word under cursor in manual"} )

-- Format json files
-- TODO: Fix this so it only works if current file is json file
-- and checks for jq installation
vim.keymap.set("n", "<leader>jq", "<CMD>%!jq<CR>", {desc = "Format JSON files"})

-- open/close Tabs
vim.keymap.set("n", "<leader>T", ":tabnew<CR>", { desc = "Open new tab"})
vim.keymap.set("n", "<leader>X", ":tabclose<CR>",  { desc = "Close current tab"} )

vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<leader>P", "\"+P", { desc = "Paste from system clipboard" })

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-c>", "<cmd>%y<CR>", { desc = "Copy whole file" })
vim.keymap.set("n", "<leader><C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file to system clipboard" })

-- Comment
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Clear highlights after search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })


-- LSP mappings
vim.keymap.set("n", "<leader>ds", vim.diagnostic.setloclist, {desc = "LSP diagnostic loclist"})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {desc =  "Go to declaration"})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "Go to definition"})

-- vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
-- vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
-- vim.keymap.set("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
-- vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
-- vim.keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
-- vim.keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
-- vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
-- vim.keymap.set("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
-- map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })

-- whichkey
-- vim.keymap.set("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
-- vim.keymap.set("n", "<leader>wk", function()
--   vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
-- end, { desc = "whichkey query lookup" })-
