local snippet_packages = { "vim-snippets", "LuaSnip" }
local completion_packages = { "blink.cmp", "colorful-menu.nvim" }

vim.pack.add({
  "https://github.com/honza/vim-snippets",
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/xzbdmw/colorful-menu.nvim",
}, { load = false, confirm = false })

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    local lazy = require("config.lazy")
    lazy.load(snippet_packages, "config.luasnip")
    lazy.load(completion_packages, "config.blink_cmp")
  end,
})
