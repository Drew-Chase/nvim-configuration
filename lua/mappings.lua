require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

-- =============================================
-- REMOVE CONFLICTING NVCHAD DEFAULTS
-- =============================================
del("n", "<C-c>") -- was: copy whole file
del("n", "<C-n>") -- was: NvimTree toggle
del("i", "<C-b>") -- was: beginning of line
del("n", "<leader>b") -- was: new buffer
del("n", "<leader>x") -- was: close buffer
del("n", "<leader>/") -- was: comment toggle
del("v", "<leader>/") -- was: comment toggle
del("n", "<tab>") -- was: next buffer
del("n", "<S-tab>") -- was: prev buffer
del({ "n", "v" }, "<leader>fm") -- was: format
del("n", "<C-h>") -- was: window left

-- =============================================
-- CORE IDE BINDINGS
-- =============================================

-- Save (extend NvChad's normal mode Ctrl+S to insert/visual)
map({ "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })

-- Undo / Redo
map("n", "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<Esc>ui", { desc = "Undo" })
map("n", "<C-S-z>", "<C-r>", { desc = "Redo" })
map("i", "<C-S-z>", "<Esc><C-r>i", { desc = "Redo" })
map("n", "<C-y>", "<C-r>", { desc = "Redo (JetBrains)" })

-- Copy / Cut / Paste (system clipboard)
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })
map("v", "<C-x>", '"+d', { desc = "Cut to clipboard" })
map({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from clipboard" })
map("i", "<C-v>", "<C-r>+", { desc = "Paste from clipboard" })
map("c", "<C-v>", "<C-r>+", { desc = "Paste in command line" })

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- =============================================
-- FIND / SEARCH
-- =============================================
map("n", "<C-f>", "/", { desc = "Find in file" })
map("n", "<C-h>", ":%s/", { desc = "Find and replace" })
map("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", { desc = "Find in files" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Quick file open" })
map("n", "<C-S-p>", "<cmd>Telescope commands<CR>", { desc = "Command palette" })

-- =============================================
-- COMMENTS
-- =============================================
map("n", "<C-/>", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<C-/>", "gc", { desc = "Toggle comment", remap = true })
map("i", "<C-/>", "<Esc>gcci", { desc = "Toggle comment", remap = true })

-- =============================================
-- TERMINAL
-- =============================================
-- Handled by toggleterm plugin (open_mapping = "<C-`>")
-- Add terminal-mode escape back to normal
map("t", "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- =============================================
-- LINE OPERATIONS
-- =============================================

-- Move line up/down (Alt+Up/Down)
map("n", "<A-Up>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-Down>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("i", "<A-Up>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-Down>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Delete line (Ctrl+Shift+K)
map("n", "<C-S-k>", "dd", { desc = "Delete line" })
map("i", "<C-S-k>", "<Esc>ddi", { desc = "Delete line" })

-- Duplicate line/selection (Ctrl+Shift+D)
map("n", "<C-S-d>", "<cmd>t.<CR>", { desc = "Duplicate line" })
map("i", "<C-S-d>", "<Esc><cmd>t.<CR>gi", { desc = "Duplicate line" })
map("v", "<C-S-d>", "y'>p", { desc = "Duplicate selection" })

-- =============================================
-- BUFFER / TAB MANAGEMENT
-- =============================================

-- Close buffer (Ctrl+W - VSCode style)
map("n", "<C-w>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

-- Next / prev buffer
map("n", "<C-Tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Next buffer" })
map("n", "<C-S-Tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })

-- New buffer
map("n", "<C-n>", "<cmd>enew<CR>", { desc = "New buffer" })

-- =============================================
-- WINDOW MANAGEMENT (moved to leader prefix)
-- =============================================
map("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
map("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
map("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
map("n", "<leader>wl", "<C-w>l", { desc = "Window right" })
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>wq", "<C-w>q", { desc = "Close window" })

-- =============================================
-- FILE EXPLORER
-- =============================================
map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- =============================================
-- GO TO LINE
-- =============================================
map("n", "<C-g>", function()
  vim.ui.input({ prompt = "Go to line: " }, function(input)
    if input then
      vim.cmd(":" .. input)
    end
  end)
end, { desc = "Go to line" })

-- =============================================
-- LSP BINDINGS (JetBrains-ported)
-- =============================================
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<S-A-r>", vim.lsp.buf.rename, { desc = "Rename symbol (JetBrains)" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<A-CR>", vim.lsp.buf.code_action, { desc = "Code action / quick fix" })
map("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code action (VSCode)" })
map("n", "<C-Space>", function()
  require("cmp").complete()
end, { desc = "Trigger autocomplete" })
map("n", "<C-S-o>", function()
  vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
end, { desc = "Organize imports" })
map("n", "<C-F12>", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "File structure" })
map({ "n", "v" }, "<C-A-l>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Reformat code" })

-- =============================================
-- GIT BINDINGS (JetBrains-ported)
-- =============================================
-- Ctrl+K handled by lazygit plugin lazy-key spec
map("n", "<C-t>", function()
  vim.cmd "!git pull"
end, { desc = "Git pull" })
map("n", "<C-A-z>", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Revert hunk" })
map("n", "<C-A-a>", function()
  vim.cmd("!git add " .. vim.fn.expand "%")
end, { desc = "Git add current file" })
map("n", "<C-S-`>", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })

-- =============================================
-- BUILD / RUN (JetBrains-ported)
-- =============================================
map("n", "<C-S-b>", function()
  if vim.fn.filereadable "Cargo.toml" == 1 then
    vim.cmd "!cargo build"
  elseif vim.fn.filereadable "Makefile" == 1 then
    vim.cmd "make"
  elseif vim.fn.filereadable "package.json" == 1 then
    vim.cmd "!npm run build"
  else
    vim.notify("No build system detected", vim.log.levels.WARN)
  end
end, { desc = "Build project" })

map("n", "<C-F5>", function()
  if vim.fn.filereadable "Cargo.toml" == 1 then
    vim.cmd "!cargo run"
  elseif vim.fn.filereadable "Makefile" == 1 then
    vim.cmd "make run"
  else
    vim.notify("No run config detected", vim.log.levels.WARN)
  end
end, { desc = "Run project" })

-- =============================================
-- DIAGNOSTICS
-- =============================================
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics panel" })

-- =============================================
-- KEEP FROM ORIGINAL CONFIG
-- =============================================
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
