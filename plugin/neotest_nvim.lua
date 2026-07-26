vim.pack.add({
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/antoinemadec/FixCursorHold.nvim",
  "https://github.com/nvim-neotest/neotest",
  "https://github.com/nvim-neotest/neotest-python",
}, { load = true, confirm = false })

require("neotest").setup({
  adapters = { require("neotest-python") },
})
