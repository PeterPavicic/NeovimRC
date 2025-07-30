require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


-- Yank highlighting
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Removes undotree from buffer (avoids crashing)
autocmd({"FileType"}, {
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
autocmd({ "BufWritePost" }, {
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
autocmd({ "BufReadPost" }, {
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

local markdown_group = augroup('ObsidianGroup', { clear = true })

autocmd( {"FileType"} , {
  pattern = 'markdown',
  group = markdown_group,
  desc = 'Set conceallevel 2 for markdown files', -- A helpful description
  callback = function()
    -- Set conceallevel to 2 locally for the buffer
    -- 1: Shows a placeholder for hidden characters.
    -- 2: Hides markup characters completely.
    vim.opt_local.conceallevel = 2
  end,
})
