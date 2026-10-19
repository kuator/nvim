local snippet_packages = { "vim-snippets", "LuaSnip" }

vim.pack.add({
  "https://github.com/honza/vim-snippets",
  { src = "https://github.com/L3MON4D3/LuaSnip" },
}, { load = false, confirm = false })

vim.pack.add({
  "https://github.com/antonk52/filepaths_ls.nvim",
  "https://github.com/onsails/lspkind.nvim",
  "https://github.com/xzbdmw/colorful-menu.nvim",
}, { load = true, confirm = false })

require("config.native_completion").setup()
vim.lsp.enable("filepaths_ls")

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    local lazy = require("config.lazy")
    lazy.load(snippet_packages, "config.luasnip")
  end,
})
