local map = vim.keymap.set

-- Avoid accidentally closing everything
map("i", "<C-c>", "<ESC>")

-- move text around using J, K
-- map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block up 1 line"})
-- map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block down 1 line"})

-- Navigate between windows in any modes
map({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h")
map({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j")
map({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k")
map({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l")
map({ "n" }, "<A-h>", "<C-w>h")
map({ "n" }, "<A-j>", "<C-w>j")
map({ "n" }, "<A-k>", "<C-w>k")
map({ "n" }, "<A-l>", "<C-w>l")
map({ "n" }, "<A-Left>", "<C-w>h")
map({ "n" }, "<A-Down>", "<C-w>j")
map({ "n" }, "<A-Up>", "<C-w>k")
map({ "n" }, "<A-Right>", "<C-w>l")

-- J does not move cursor
map("n", "J", function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd("normal! J")
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Collapse next line" })

-- Center when moving up, down half screen
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up" })

-- Center when searching
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

-- greatest remap ever (paste no replace)
map("x", "<leader>p", '"_dP', { desc = "Paste and keep yank" })

map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete into void" })
map({ "n", "v" }, "<leader>x", '"_x', { desc = "Delete into void" })

-- next greatest remap ever (yank into system clipboard)
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })
-- paste to/from system clipboard
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste from system clipboard" })

-- avoid Ex mode
map("n", "Q", "<nop>")

-- Open :h help for word under cursor
-- map("n", "<leader>h", [[:h <<C-r><C-w><CR>]], { desc = "Search word under cursor in manual"} )

-- open/close tabs
map("n", "<leader>T", "<CMD>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>Q", "<CMD>tabclose<CR>", { desc = "Close current tab" })

-- open/close buffers
map("n", "<leader>B", "<CMD>enew<CR>", { desc = "Open new buffer" })
map("n", "<leader>q", "<CMD>bdelete<CR>", { desc = "Close current buffer" })

-- save/copy file
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y<CR>", { desc = "Copy whole file" })
map("n", "<leader><C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file to system clipboard" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Clear highlights after search
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- LSP mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- TELESCOPE
map("n", "<leader>ft", require("telescope.builtin").builtin, { desc = "Open telescope (colourscheme)" })
--
-- buffers
map("n", "<leader>b", require("telescope.builtin").buffers, { desc = "telescope find buffers" })
--
-- find files
map("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "telescope find files" })
map("n", "<leader>fa", function()
  require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true })
end, { desc = "telescope find all files" })
--
-- grep
map("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "telescope live grep" })
map(
  "n",
  "<leader>fz",
  require("telescope.builtin").current_buffer_fuzzy_find,
  { desc = "telescope find in current buffer" }
)
--
-- help
map("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "telescope help page" })
map("n", "<leader>gc", require("telescope.builtin").git_commits, { desc = "telescope git commits" })
map("n", "<leader>gst", require("telescope.builtin").git_status, { desc = "telescope git status" })
map("n", "<leader>th", require("telescope.builtin").colorscheme, { desc = "telescope theme (colourscheme)" })

-- undotree
map("n", "<leader>u", require("undotree").open, { desc = "Toggle undotree" })

-- oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open oil in floating window" })

-- conform
map("n", "<leader>fmt", require("conform").format, { desc = "Format buffer (conform)" })
map("n", "<leader>tf", function()
  if vim.g.disable_autoformat then
    vim.g.disable_autoformat = false
    vim.notify("Format on save enabled")
  else
    vim.g.disable_autoformat = true
    vim.notify("Format on save disabled")
  end
end, { desc = "Toggle format on save" })
