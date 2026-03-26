return {
  -- Formatter with format-on-save
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter: extended languages + incremental selection (Ctrl+W / Ctrl+Shift+W)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "javascript", "typescript",
        "rust", "toml", "json", "yaml", "markdown", "bash",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-w>",
          node_incremental = "<C-w>",
          node_decremental = "<C-S-w>",
          scope_incremental = false,
        },
      },
    },
  },

  -- =============================================
  -- THEME: electron-vue
  -- =============================================
  {
    "rktjmp/lush.nvim",
    lazy = false,
  },
  {
    "AntonyZ89/electron-vue.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.cmd "colorscheme electron-vue-darker"
    end,
  },

  -- =============================================
  -- MULTI-CURSOR (IntelliJ: Alt+J select next, Shift+Alt+J unselect, Ctrl+Shift+Alt+J all)
  -- =============================================
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "BufReadPost",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<A-j>",
        ["Find Subword Under"] = "<A-j>",
        ["Select All"] = "<C-S-A-j>",
        ["Skip Region"] = "<S-A-j>",
        ["Add Cursor Down"] = "<C-A-Down>",
        ["Add Cursor Up"] = "<C-A-Up>",
      }
      vim.g.VM_theme = "iceblue"
    end,
  },

  -- =============================================
  -- BETTER TERMINAL
  -- =============================================
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { "<C-`>", "<S-A-t>" },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.35
        end
      end,
      open_mapping = "<C-`>",
      direction = "horizontal",
      shade_terminals = true,
      shading_factor = 2,
      float_opts = { border = "curved" },
    },
  },

  -- =============================================
  -- LSP DIAGNOSTICS PANEL
  -- =============================================
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
    },
    opts = {},
  },

  -- =============================================
  -- GIT
  -- =============================================
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = { { "<C-k>", "<cmd>LazyGit<CR>", desc = "LazyGit (Git commit)" } },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Git diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File git history" },
    },
  },
}
