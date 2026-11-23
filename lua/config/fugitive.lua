local M = {}

M.config = function()
  local fugitive_group = vim.api.nvim_create_augroup("Fugitive", {})

  local autocmd = vim.api.nvim_create_autocmd
  autocmd("BufWinEnter", {
    group = fugitive_group,
    pattern = "*",
    callback = function()
      if vim.bo.ft ~= "fugitive" then
        return
      end

      local bufnr = vim.api.nvim_get_current_buf()
      -- git pull
      vim.keymap.set("n", "<leader>p", function()
        vim.cmd.Git("push")
      end, { buffer = bufnr, remap = false, desc = "git push" })

      -- git pull
      vim.keymap.set("n", "<leader>P", function()
        vim.cmd.Git({ "pull" })
      end, { buffer = bufnr, remap = false, desc = "git pull" })
    end,
  })

  vim.g.fugitive_summary_format = "%s%d"
end

return M
