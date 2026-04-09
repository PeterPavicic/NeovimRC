---@type LazySpec
return {
  -- Inserts colourful TODO, etc notes.
  -- TODO: test
  -- PERF : test
  -- NOTE: test
  -- FIX: test
  -- WARN: test
  -- HACK: test
  "folke/todo-comments.nvim",
  event = "BufEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- accept defaults
  opts = {},
}
