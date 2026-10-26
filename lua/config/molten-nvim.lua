local M = {}

M.init = function()
  vim.g.molten_output_win_max_height = 20

  -- The behavior of MoltenEnterOutput
  vim.g.molten_enter_output_behavior = "open_and_enter"

  -- Keep the output window open after leaving it
  vim.g.molten_output_win_hide_on_leave = false

  -- Automatically open the floating output window when your cursor moves into a cell. It opens
  -- right below the cell, on top of the virtual text output
  vim.g.molten_auto_open_output = true

  -- optional, I like wrapping. works for virt text and the output window
  vim.g.molten_wrap_output = true

  -- The output window and virtual text will be shown just below the last line of code in the cell.
  -- NOTE: setting true also reserves virtual lines for the output window, pushing the code down instead of
  -- letting the window hover over the virtual text
  vim.g.molten_cover_empty_lines = false

  -- Output as virtual text. Allows outputs to always be shown, works with images, but can
  -- be buggy with longer images
  vim.g.molten_virt_text_output = true

  -- This will make it so the output shows up below the \`\`\` cell delimiter
  -- WARNING: This needs to be overwritten by a Quarto/Otter/Markdown config
  vim.g.molten_virt_lines_off_by_1 = false

  vim.g.molten_image_provider = "image.nvim"

  -- Open image output automatically in its own window with python's Image.show()
  vim.g.molten_auto_image_popup = false

  vim.g.molten_image_location = "float"

  -- KEYBINDINGS
  local group = vim.api.nvim_create_augroup("MoltenKeymaps", { clear = true })

  -- show/hide output window
  local toggle_output = function()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      -- MoltenHideOutput also works from inside the output window
      if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "molten_output" then
        vim.cmd("MoltenHideOutput")
        return
      end
    end
    vim.cmd("MoltenShowOutput")
  end

  -- The output window shows its own buffer, so the code buffer's mappings don't apply there
  local map_output_buf = function(buf)
    vim.keymap.set(
      "n",
      "<localleader>ok",
      "<cmd>wincmd p<CR>",
      { buffer = buf, silent = true, desc = "exit output window" }
    )
    vim.keymap.set(
      "n",
      "<localleader>os",
      toggle_output,
      { buffer = buf, silent = true, desc = "Toggle output window" }
    )
  end

  -- Molten sets the filetype every time it opens the output window
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "molten_output",
    callback = function(args)
      map_output_buf(args.buf)
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "MoltenInitPost",
    callback = function()
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true, desc = desc })
      end

      -- Molten
      map("n", "<localleader>md", ":MoltenDeinit<CR>", "Deinitialize kernel")
      map("n", "<localleader>mI", ":MoltenInfo<CR>", "Kernel information")
      map("n", "<localleader>mc", ":MoltenInterrupt<CR>", "Interrupt kernel")
      map("n", "<localleader>mr", ":MoltenRestart<CR>", "Restart kernel")
      map("n", "<localleader>mx", ":MoltenRestart!<CR>", "Restart kernel and clear all output")

      -- Evaluate
      map("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", "evaluate line")
      map("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", "re-evaluate cell")
      map("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", "run operator selection")
      map("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>", "evaluate visual selection")
      map("n", "<localleader>ra", ":MoltenEvaluateArgument ", "evaluate input")

      -- Navigate
      map("n", "]c", ":MoltenNext<CR>", "jump to next cell")
      map("n", "[c", ":MoltenPrev<CR>", "jump to previous cell")
      map("n", "<localleader>g", ":MoltenGoto ", "jump to cell")

      -- Cell
      map("n", "<localleader>rd", ":MoltenDelete<CR>", "molten delete cell")

      -- Output
      map("n", "<localleader>os", toggle_output, "Toggle output window")

      -- enter output window; exiting is mapped on the output buffer itself
      map("n", "<localleader>ok", function()
        -- MoltenEnterOutput only works from the cell. It enters the auto-opened hover window, or opens
        -- it if it was hidden
        vim.cmd("noautocmd MoltenEnterOutput")
        -- noautocmd suppresses FileType if this opened the window, so map the output buffer here too
        if vim.bo.filetype == "molten_output" then
          map_output_buf(0)
        end
      end, "enter output window")

      map("n", "<localleader>op", ":MoltenImagePopup<CR>", "Open image popup")
      map("n", "<localleader>oy", ":MoltenYankOutput<CR>", "Yank cell output")
      map("n", "<localleader>o<leader>y", ":MoltenYankOutput!<CR>", "yank cell output to clipboard")

      -- TODO: Implement R-nvim style treesitter-based jump to next `expression_statement`
    end,
  })
end

return M
