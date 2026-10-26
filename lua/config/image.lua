local M = {}

-- image.nvim passes the cursor move through tmux straight to the terminal, offset by pane_top. But
-- pane_top is relative to the tmux window, not the client, so with `status-position top` every image
-- is drawn one row (per status line) too high. Add the status bar height back on.
local fix_tmux_top_status = function()
  -- NOTE: must be the same module name image.nvim uses, "image.utils.tmux" is a separate copy
  local tmux = require("image/utils/tmux")
  if not tmux.is_tmux then
    return
  end

  local command = { "tmux", "display-message", "-p" }
  if vim.env.TMUX_PANE then
    vim.list_extend(command, { "-t", vim.env.TMUX_PANE })
  end
  table.insert(command, "#{pane_left} #{pane_top} #{status-position} #{status}")

  -- cached until the next event loop tick, like the original
  local pane_position = nil
  tmux.get_pane_position = function()
    if pane_position then
      return pane_position
    end

    local left, top, position, status = vim.fn.system(command):match("(%-?%d+)%s+(%-?%d+)%s+(%S+)%s+(%S+)")
    top = tonumber(top) or 0
    if position == "top" then
      -- `status` is "on", "off" or the number of status lines (2-5)
      top = top + (status == "off" and 0 or (tonumber(status) or 1))
    end

    pane_position = { left = tonumber(left) or 0, top = top }
    vim.schedule(function()
      pane_position = nil
    end)
    return pane_position
  end
end

M.config = function(_, opts)
  fix_tmux_top_status()
  require("image").setup(opts)
end

M.opts = {
  processor = "magick_cli",
  backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
  integrations = {}, -- do whatever you want with image.nvim's integrations
  max_width = 100, -- tweak to preference
  max_height = 30, -- ^
  max_height_window_percentage = math.huge, -- this is necessary for a good experience
  max_width_window_percentage = math.huge,
  window_overlap_clear_enabled = true,
  -- ui2 (vim._core.ui2) keeps cmd/msg/pager/dialog floats open (some hidden), which image.nvim
  -- counts as overlapping every window, so nothing would ever render
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "", "cmd", "msg", "pager", "dialog" },
  -- clear images when switching to another tmux window/session (needs focus-events on)
  tmux_show_only_in_active_window = true,
}

return M
