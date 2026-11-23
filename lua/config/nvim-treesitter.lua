local M = {}

M.init = function()
  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      -- Enable treesitter highlighting and disable regex syntax
      pcall(vim.treesitter.start)
      -- Enable treesitter-based indentation
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  local ensure_installed = {
    "bash",
    "css",
    "csv",
    "graphql",
    "html",
    "java",
    "json",
    "lua",
    "markdown",
    "python",
    "r",
    "rnoweb",
    "yaml",
    "sql",
    "typst",
  }
  local alreadyInstalled = require("nvim-treesitter.config").get_installed()
  local parsersToInstall = vim
    .iter(ensure_installed)
    :filter(function(parser)
      return not vim.tbl_contains(alreadyInstalled, parser)
    end)
    :totable()
  require("nvim-treesitter").install(parsersToInstall)
end

return M
