require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- Removes undotree from buffer (avoids crashing)
autocmd("FileType", {
  pattern = "undotree",
  callback = function()
    vim.schedule(function()
      for i, buf in ipairs(vim.t.bufs) do
        if not vim.bo[buf].buflisted then
          vim.t.bufs = vim.list_slice(vim.t.bufs, 1, i - 1)
        end
      end
      vim.cmd.redrawtabline()
    end)
  end,
})
