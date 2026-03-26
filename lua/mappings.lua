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
-- SAVE (IntelliJ: Ctrl+S / Ctrl+Shift+S = SaveAll)
-- =============================================
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>wa<CR>", { desc = "Save all" })
map({ "n", "i", "v" }, "<C-S-s>", "<Esc><cmd>wa<CR>", { desc = "Save all" })

-- =============================================
-- UNDO / REDO (IntelliJ: Ctrl+Z / Ctrl+Shift+Z / Ctrl+Y)
-- =============================================
map("n", "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<Esc>ui", { desc = "Undo" })
map("n", "<C-S-z>", "<C-r>", { desc = "Redo" })
map("i", "<C-S-z>", "<Esc><C-r>i", { desc = "Redo" })
map("n", "<C-y>", "<C-r>", { desc = "Redo" })

-- =============================================
-- COPY / CUT / PASTE (system clipboard)
-- =============================================
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })
map("v", "<C-x>", '"+d', { desc = "Cut to clipboard" })
map({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from clipboard" })
map("i", "<C-v>", "<C-r>+", { desc = "Paste from clipboard" })
map("c", "<C-v>", "<C-r>+", { desc = "Paste in command line" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- =============================================
-- COMMENTS (IntelliJ: Ctrl+Shift+C line, Ctrl+Alt+C block)
-- =============================================
map("n", "<C-S-c>", "gcc", { desc = "Toggle line comment", remap = true })
map("v", "<C-S-c>", "gc", { desc = "Toggle line comment", remap = true })
map("i", "<C-S-c>", "<Esc>gcci", { desc = "Toggle line comment", remap = true })
map("n", "<C-A-c>", "gbc", { desc = "Toggle block comment", remap = true })
map("v", "<C-A-c>", "gb", { desc = "Toggle block comment", remap = true })

-- =============================================
-- FIND / SEARCH
-- =============================================
map("n", "<C-f>", "/", { desc = "Find in file" })
map("n", "<C-h>", ":%s/", { desc = "Find and replace" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Quick file open" })
map("n", "<C-S-p>", "<cmd>Telescope commands<CR>", { desc = "Command palette" })
-- FindInPath had no binding in your keymap; using leader combo
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find in files (live grep)" })

-- =============================================
-- REFORMAT CODE (IntelliJ: Ctrl+Shift+F)
-- =============================================
map({ "n", "v" }, "<C-S-f>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Reformat code" })

-- =============================================
-- LINE OPERATIONS
-- =============================================

-- Delete line (IntelliJ: Ctrl+D = EditorDeleteLine)
map("n", "<C-d>", "dd", { desc = "Delete line" })
map("i", "<C-d>", "<Esc>ddi", { desc = "Delete line" })

-- Duplicate line (IntelliJ: Ctrl+Shift+D = EditorDuplicate)
map("n", "<C-S-d>", "<cmd>t.<CR>", { desc = "Duplicate line" })
map("i", "<C-S-d>", "<Esc><cmd>t.<CR>gi", { desc = "Duplicate line" })
map("v", "<C-S-d>", "y'>p", { desc = "Duplicate selection" })

-- Move line up/down (IntelliJ: Alt+Up/Down)
map("n", "<A-Up>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-Down>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("i", "<A-Up>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-Down>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- =============================================
-- SELECTION (IntelliJ: Ctrl+W expand, Ctrl+Shift+W shrink)
-- Multi-select: Alt+J next, Shift+Alt+J unselect, Ctrl+Shift+Alt+J all
-- =============================================
-- Expand/shrink selection via treesitter (configured in plugins)
-- vim-visual-multi handles Alt+J bindings (configured in plugins)

-- =============================================
-- TERMINAL
-- =============================================
-- Ctrl+` handled by toggleterm plugin (open_mapping)
-- Shift+Alt+T for external terminal (IntelliJ: Tool_External Tools_Warp)
map("t", "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<S-A-t>", function()
  require("toggleterm").toggle(0, nil, nil, "float")
end, { desc = "Floating terminal" })

-- =============================================
-- BUFFER / TAB MANAGEMENT
-- =============================================
map("n", "<C-Tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Next buffer" })
map("n", "<C-S-Tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })
map("n", "<C-F4>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })
map("n", "<C-n>", "<cmd>enew<CR>", { desc = "New buffer" })

-- =============================================
-- WINDOW MANAGEMENT (leader prefix since Ctrl+W = expand selection)
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
-- Reveal in file tree (IntelliJ: Shift+Alt+O = RevealIn)
map("n", "<S-A-o>", "<cmd>NvimTreeFindFile<CR>", { desc = "Reveal file in tree" })

-- =============================================
-- GO TO LINE (IntelliJ: Ctrl+G = GotoRow)
-- =============================================
map("n", "<C-g>", function()
  vim.ui.input({ prompt = "Go to line: " }, function(input)
    if input then
      vim.cmd(":" .. input)
    end
  end)
end, { desc = "Go to line" })

-- =============================================
-- LSP BINDINGS (from your IntelliJ keymap)
-- =============================================
-- RenameElement: Shift+Alt+R / Shift+Ctrl+Alt+R
map("n", "<S-A-r>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<C-S-A-r>", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- ShowIntentionActions: Alt+Enter / Ctrl+Period
map("n", "<A-CR>", vim.lsp.buf.code_action, { desc = "Code action / quick fix" })
map("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code action" })

-- Go to definition (Vim standard, IntelliJ: Ctrl+B for declaration)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<C-b>", vim.lsp.buf.definition, { desc = "Go to declaration" })
-- Note: Ctrl+B conflicts with file explorer toggle above
-- In normal buffers with LSP, Ctrl+B goes to definition
-- Use <leader>e or NvimTreeToggle command for file tree

-- Trigger autocomplete
map("n", "<C-Space>", function()
  require("cmp").complete()
end, { desc = "Trigger autocomplete" })

-- OptimizeImports: Ctrl+Shift+O
map("n", "<C-S-o>", function()
  vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
end, { desc = "Organize imports" })

-- File structure: Ctrl+F12
map("n", "<C-F12>", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "File structure" })

-- =============================================
-- GIT BINDINGS (from your IntelliJ keymap)
-- =============================================
-- CheckinProject / Git.Commit.Stage: Ctrl+K
-- (handled by lazygit plugin lazy-key spec)

-- Vcs.Push: Ctrl+Shift+K
map("n", "<C-S-k>", function()
  vim.cmd "!git push"
end, { desc = "Git push" })

-- Git.Commit.And.Push.Executor: Ctrl+Alt+K
map("n", "<C-A-k>", function()
  vim.cmd "!git add -A && git commit && git push"
end, { desc = "Git commit and push" })

-- Vcs.UpdateProject: Ctrl+T
map("n", "<C-t>", function()
  vim.cmd "!git pull"
end, { desc = "Git pull" })

-- Git.Add / Git.Stage.Add: Ctrl+Alt+A
map("n", "<C-A-a>", function()
  vim.cmd("!git add " .. vim.fn.expand "%")
end, { desc = "Git add current file" })

-- Git.Stage.Revert / Git.Stage.Reset: Ctrl+Alt+Z
map("n", "<C-A-z>", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Revert hunk" })

-- Git.Branches: Ctrl+Shift+`
map("n", "<C-S-`>", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })

-- CopyReferencePopupGroup: Shift+Alt+C
map("n", "<S-A-c>", function()
  local path = vim.fn.expand "%:."
  local line = vim.fn.line "."
  local ref = path .. ":" .. line
  vim.fn.setreg("+", ref)
  vim.notify("Copied: " .. ref)
end, { desc = "Copy file reference" })

-- =============================================
-- BUILD / RUN (from your IntelliJ keymap)
-- =============================================
-- BuildProject: Ctrl+Shift+B
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

-- Rust.Build: Ctrl+F9
map("n", "<C-F9>", function()
  vim.cmd "!cargo build"
end, { desc = "Cargo build" })

-- Run: Ctrl+F5
map("n", "<C-F5>", function()
  if vim.fn.filereadable "Cargo.toml" == 1 then
    vim.cmd "!cargo run"
  elseif vim.fn.filereadable "Makefile" == 1 then
    vim.cmd "make run"
  else
    vim.notify("No run config detected", vim.log.levels.WARN)
  end
end, { desc = "Run project" })

-- Debug: F5
map("n", "<F5>", function()
  local ok, dap = pcall(require, "dap")
  if ok then
    dap.continue()
  else
    vim.notify("DAP not installed", vim.log.levels.WARN)
  end
end, { desc = "Debug continue" })

-- =============================================
-- DIAGNOSTICS
-- =============================================
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics panel" })

-- =============================================
-- KEEP FROM ORIGINAL CONFIG
-- =============================================
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
