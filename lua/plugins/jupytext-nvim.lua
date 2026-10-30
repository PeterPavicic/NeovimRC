---@type LazySpec
return {
  "GCBallesteros/jupytext.nvim",
  -- config = true,
  config = function(_, opts)
    require("jupytext").setup(opts)
    local utils = require("jupytext.utils")
    local exts = { python = "py", julia = "jl", r = "r", R = "r", bash = "sh" }
    utils.get_ipynb_metadata = function(filename)
      -- Add metadata if missing
      local f = assert(io.open(filename, "r"))
      local md = vim.json.decode(f:read("a")).metadata or {}
      f:close()
      local ks, li = md.kernelspec or {}, md.language_info or {}
      local lang = ks.language or ({ python3 = "python" })[ks.name] or li.name or "python"
      return { language = lang, extension = exts[lang] or "py" }
    end
  end,
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
