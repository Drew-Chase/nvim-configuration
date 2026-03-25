require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- Auto-save all buffers on focus lost
autocmd("FocusLost", {
  pattern = "*",
  callback = function()
    vim.cmd "silent! wa"
  end,
  desc = "Auto-save on focus lost",
})

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
  desc = "Highlight on yank",
})

-- Auto-resize splits when terminal is resized
autocmd("VimResized", {
  pattern = "*",
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
  desc = "Auto-resize splits",
})

-- Return to last edit position when opening a file
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Restore cursor position",
})
