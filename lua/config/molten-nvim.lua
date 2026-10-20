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

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "MoltenInitPost",
    callback = function()
      -- local map = function(mode, lhs, rhs, desc)
      --   vim.keymap.set(mode, lhs, rhs, { buffer = false, silent = false, desc = desc })
      -- end

      -- Molten
      vim.keymap.set("n", "<localleader>md", ":MoltenDeinit<CR>", { silent = true, desc = "Deinitialize kernel" })
      vim.keymap.set("n", "<localleader>mI", ":MoltenInfo<CR>", { silent = true, desc = "Kernel information" })
      vim.keymap.set("n", "<localleader>mc", ":MoltenInterrupt<CR>", { silent = true, desc = "Interrupt kernel" })
      vim.keymap.set("n", "<localleader>mr", ":MoltenRestart<CR>", { silent = true, desc = "Restart kernel" })
      vim.keymap.set(
        "n",
        "<localleader>mx",
        ":MoltenRestart!<CR>",
        { silent = true, desc = "Restart kernel and clear all output" }
      )

      -- Evaluate
      vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
      vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
      vim.keymap.set(
        "n",
        "<localleader>e",
        ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" }
      )
      vim.keymap.set(
        "v",
        "<localleader>r",
        ":<C-u>MoltenEvaluateVisual<CR>",
        { silent = true, desc = "evaluate visual selection" }
      )
      vim.keymap.set("n", "<localleader>ra", ":MoltenEvaluateArgument ", { silent = true, desc = "evaluate input" })

      -- Navigate
      vim.keymap.set("n", "]c", ":MoltenNext<CR>", { silent = true, desc = "jump to next cell" })
      vim.keymap.set("n", "[c", ":MoltenPrev<CR>", { silent = true, desc = "jump to previous cell" })
      vim.keymap.set("n", "<localleader>g", ":MoltenGoto ", { silent = true, desc = "jump to cell" })

      -- Cell
      vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })

      -- Output
      -- show/hide output window
      vim.keymap.set("n", "<localleader>os", function()
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          -- MoltenHideOutput also works from inside the output window
          if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "molten_output" then
            vim.cmd("MoltenHideOutput")
            return
          end
        end
        vim.cmd("MoltenShowOutput")
      end, { silent = true, desc = "Toggle output window" })

      -- enter/exit output window
      vim.keymap.set("n", "<localleader>ok", function()
        -- MoltenEnterOutput only works from the cell. It enters the auto-opened hover window, or opens
        -- it if it was hidden
        if vim.bo.filetype == "molten_output" then
          vim.cmd("wincmd p")
        else
          vim.cmd("noautocmd MoltenEnterOutput")
        end
      end, { silent = true, desc = "enter/exit output window" })

      vim.keymap.set("n", "<localleader>op", ":MoltenImagePopup<CR>", { silent = true, desc = "Open image popup" })
      vim.keymap.set("n", "<localleader>oy", ":MoltenYankOutput<CR>", { silent = true, desc = "Yank cell output" })
      vim.keymap.set(
        "n",
        "<localleader>o<leader>y",
        ":MoltenYankOutput!<CR>",
        { desc = "yank cell output to clipboard" }
      )

      -- TODO: Implement R-nvim style treesitter-based jump to next `expression_statement`
    end,
  })
end

return M
