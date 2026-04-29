local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Yank highlighting
autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

-- Remember folds for buffers
local remember_folds_group = augroup("RememberFolds", { clear = true })

-- Right after buffer saved to file
autocmd("BufWritePost", {
  group = remember_folds_group,
  pattern = "?*",
  callback = function()
    -- Only for normal buffers
    if vim.bo.buftype == "" then
      vim.cmd([[silent! mkview 1]])
      -- print("mkview 1 executed for buffer: " .. vim.fn.bufname())
    end
  end,
})

-- Right after buffer read from file
autocmd("BufReadPost", {
  group = remember_folds_group,
  pattern = "?*",
  callback = function()
    -- Only for normal buffers
    if vim.bo.buftype == "" then
      vim.cmd([[silent! loadview 1]])
      -- print("loadview 1 executed for buffer: " .. vim.fn.bufname())
    end
  end,
})

-- Toggle conform's autoformat-on-save
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
