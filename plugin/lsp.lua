local packages = {
  "nvim-lspconfig",
  "mason.nvim",
  "nvim-jdtls",
  "mason-lspconfig.nvim",
  "SchemaStore.nvim",
}

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mfussenegger/nvim-jdtls",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/b0o/SchemaStore.nvim",
}, { load = false, confirm = false })

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "css", "html", "java", "javascript", "javascriptreact", "json", "jsonc",
    "less", "lua", "markdown", "python", "sass", "scss", "sh", "sql",
    "typescript", "typescriptreact", "yaml", "yaml.docker-compose", "yaml.gitlab",
    "yaml.helm-values", "zsh", "vim"
  },
  once = true,
  callback = function()
    require("config.lazy").load(packages, "config.lsp")
  end,
})

require("config.lazy").commands("Mason*", packages, "config.lsp")
