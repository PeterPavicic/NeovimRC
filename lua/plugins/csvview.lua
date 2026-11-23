---@type LazySpec
return {
  "hat0uma/csvview.nvim",
  ft = "csv",
  opts = ("config.csvview").opts,
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}
