---@type LazySpec
return {
  "GCBallesteros/jupytext.nvim",
  config = true,
  lazy = false,
  opts = {
    style = "percent",
    output_extension = "auto", -- Default extension. Don't change unless you know what you are doing
    force_ft = nil, -- Default filetype. Don't change unless you know what you are doing
    custom_language_formatting = {},
  },
  -- NOTE: Plugin requires jupytext cli command
  -- Install with uv tool install jupytext
}
