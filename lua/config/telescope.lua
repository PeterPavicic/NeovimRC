return {
  pickers = {
    live_grep = {
      file_ignore_patterns = { "node_modules", ".git", ".venv" },
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
  },
  defaults = {
    prompt_prefix = "   ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = "close" },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {
    undo = {
      mappings = {
        n = {
          ["<cr>"] = function(bufnr)
            return require("telescope-undo.actions").yank_additions(bufnr)
          end,
          ["<S-cr>"] = function(bufnr)
            return require("telescope-undo.actions").yank_deletions(bufnr)
          end,
        },
      },
    },
    -- other extensions:
    -- file_browser = { ... }
  },
}
