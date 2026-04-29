---@type LazySpec
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    theme = "tokyonight",
    sections = {
      lualine_x = { "encoding", "fileformat", "filetype", "lsp_status" },
    },
  },
  lazy = false,
}
