require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "rust_analyzer", "ts_ls", "lua_ls", "jsonls", "yamlls" }
vim.lsp.enable(servers)

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
      procMacro = { enable = true },
    },
  },
})
