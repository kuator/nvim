local packages = {
  "mason-null-ls.nvim",
  "none-ls-extras.nvim",
  "plenary.nvim",
  "none-ls.nvim",
}

vim.pack.add({
  "https://github.com/jay-babu/mason-null-ls.nvim",
  "https://github.com/nvimtools/none-ls-extras.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvimtools/none-ls.nvim",
}, { load = false, confirm = false })

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "astro", "css", "graphql", "handlebars", "html", "htmlangular",
    "java", "javascript", "javascriptreact", "json", "json5", "jsonc",
    "less", "lua", "luau", "markdown", "markdown.mdx", "scss", "sql",
    "svelte", "typescript", "typescriptreact", "vue", "yaml",
  },
  once = true,
  callback = function(args)
    require("config.lazy").load(packages, "config.none_ls")
    require("null-ls.client").try_add(args.buf)
  end,
})

require("config.lazy").commands("NullLs*", packages, "config.none_ls")
require("config.lazy").commands("NoneLs*", packages, "config.none_ls")
