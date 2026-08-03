vim.pack.add({
    "https://github.com/OXY2DEV/markview.nvim",
}, { load = false, confirm = false })

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  pattern = { "*.md", "*.markdown" },
  once = true,
  callback = function()
    require("config.lazy").load({ "markview.nvim" })
  end,
})

require("config.lazy").commands("Markview", { "markview.nvim" })
