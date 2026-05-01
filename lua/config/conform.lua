return {
  ---@type conform.setupOpts
  formatters_by_ft = {
    -- You can customize some of the format options for the filetype (:help conform.format)
    -- Run the first available formatter
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    jsonc = { "prettierd", "prettier", stop_after_first = true },
    lua = { "stylua" },
    -- Run multiple formatters sequentially
    python = { "ruff_organize_imports", "ruff_format" },
    r = { "air" },
    sql = { "sql_formatter" },
    typst = { lsp_format = "fallback" },
  },

  ---@type conform.DefaultFormatOpts
  default_format_opts = {
    async = true,
  },

  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { async = true }
  end,
}
