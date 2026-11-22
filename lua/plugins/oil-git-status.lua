return {
  "refractalize/oil-git-status.nvim",
  dependencies = { "stevearc/oil.nvim" },
  lazy = false,
  config = function()
    local i = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌",
    }

    require("oil-git-status").setup({
      show_ignored = true,
      symbols = {
        index = {
          ["M"] = i.staged,
          ["A"] = i.staged,
          ["T"] = i.staged,
          ["C"] = i.staged,
          ["R"] = i.renamed,
          ["D"] = i.deleted,
          ["U"] = i.unmerged,
          ["?"] = i.untracked,
          ["!"] = i.ignored,
          [" "] = " ",
        },
        working_tree = {
          ["M"] = i.unstaged,
          ["T"] = i.unstaged,
          ["D"] = i.deleted,
          -- these codes fill both columns ("??", "!!", "UU"); blank the right one so the icon isn't doubled
          ["U"] = " ",
          ["?"] = " ",
          ["!"] = " ",
          ["A"] = " ",
          ["C"] = " ",
          ["R"] = " ",
          [" "] = " ",
        },
      },
    })

    -- nvim-tree's colour links
    local function set_hl()
      local links = {
        IndexAdded = "Constant",
        IndexModified = "Constant",
        IndexTypeChanged = "Constant",
        IndexCopied = "Constant",
        IndexUnmerged = "Constant",
        IndexRenamed = "PreProc",
        IndexDeleted = "Statement",
        IndexUntracked = "PreProc",
        IndexIgnored = "Comment",
        WorkingTreeModified = "Statement",
        WorkingTreeTypeChanged = "Statement",
        WorkingTreeDeleted = "Statement",
      }
      for suffix, target in pairs(links) do
        vim.api.nvim_set_hl(0, "OilGitStatus" .. suffix, { link = target })
      end
    end
    set_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })
  end,
}
