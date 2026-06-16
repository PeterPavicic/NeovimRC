---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash", "css", "csv", "graphql", "html",
      "java", "json", "lua", "markdown", "python",
      "r", "rnoweb", "yaml", "sql", "typst",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  lazy = false,
}
