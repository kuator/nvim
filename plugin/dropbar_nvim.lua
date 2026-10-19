vim.pack.add({
  "https://github.com/Bekaboo/dropbar.nvim",
}, { load = true, confirm = false })


require("dropbar").setup({
  bar = {
    sources = function()
      local sources = require("dropbar.sources")
      return { sources.path, sources.treesitter }
    end,
  },
})
