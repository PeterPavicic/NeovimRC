---@type LazySpec
return {
  "chomosuke/typst-preview.nvim",
  version = "1.*",
  opts = {
    -- Custom format string to open the output link provided with %s
    -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
    open_cmd = "firefox --new-window %s --class typst-preview",
  }, -- default options
  ft = "typst", -- lazy-load only for Typst files
}
