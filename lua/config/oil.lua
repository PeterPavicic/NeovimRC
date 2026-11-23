local M = {}

M.opts = {
  win_options = {
    signcolumn = "yes:2",
    statuscolumn = "%l %s",
  },
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
}

return M
